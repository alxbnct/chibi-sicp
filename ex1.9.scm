;; -*- geiser-scheme-implementation:chicken; -*-
(import expand-full)
(define (inc x)
  (+ 1 x))
(define (dec x)
  (- x 1))
(define-syntax plusF
  (er-macro-transformer
   (lambda (form rename compare?)
     (let ((a (cadr form))
	   (b (caddr form)))
       (if (= a 0) b `(inc (plusF ,(dec a) ,b)))))))
(ppexpand* '(plusF 4 5))
