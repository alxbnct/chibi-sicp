;;-*-  geiser-scheme-implementation: chibi; -*-
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
    (display (stream-ref stream i))
    (display " ")))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))
(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))
	   (cond ((< (weight s1car) (weight s2car))
		  (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))
		 ((> (weight s1car) (weight s2car))
		  (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight)))
		 (else
		  (cons-stream s1car
			       (merge-weighted (stream-cdr s1)
					       s2
                                               weight))))))))

(define (pairs-weighted s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs-weighted (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define cubic-pairs 
  (pairs-weighted 
    integers
    integers
    (lambda (p) (+ (expt (car p) 3) (expt (cadr p) 3)))))

(define sums-of-cubes 
   (stream-map (lambda (x) (+ (expt (car x) 3)
                          (expt (cadr x) 3)))
               cubic-pairs))
#;(stream-print-n sums-of-cubes 20)
(define (first-repetition s)
 (if (= (stream-car s) (stream-car (stream-cdr s)) (stream-car (stream-cdr (stream-cdr s))) )
    s
    (first-repetition (stream-cdr s))))
(define (filter-repetitions s)
  (cons-stream (stream-car (first-repetition s)) 
               (filter-repetitions 
                 (stream-cdr (stream-cdr (stream-cdr (first-repetition s)))))))
#;(newline)
(stream-print-n (filter-repetitions sums-of-cubes) 1)
(filter-repetitions sums-of-cubes)
