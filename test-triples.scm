(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream a b) (cons a (delay b)))))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
		   (stream-map proc (stream-cdr s)))))
(define stream-null? null?)
(define the-empty-stream '())
(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))
(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))
(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred
				     (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
	      (cons proc (map stream-cdr argstreams))))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))
(define ones (cons-stream 1 ones))
(define zeros (cons-stream 0 zeros))
(define integers (cons-stream 1 (add-streams ones integers)))
(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (partial-sums s)
  (define ps (cons-stream (stream-car s) (add-streams ps (stream-cdr s))))
  ps)
(define (stream-print-n stream n)
    (do ((i 0 (+ i 1)))
      ((= i n) #t)
    (show #t (stream-ref stream i) " ")))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))
(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))
(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (cons (stream-car s) x))
		(pairs (stream-cdr t) (stream-cdr u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(stream-print-n 
(stream-filter 
       (lambda (triple) 
           (let ((i (car triple))
                 (j (cadr triple))
                 (k (caddr triple)))
            (= (* k k) (+ (* i i) (* j j)))))
(triples integers integers integers))
    7)
