(import (srfi 18) (scheme small))

(define (parallel-execute . forms)
  (let ((myo (open-output-string)))
    (define (create-threads . forms)
    (if (null? forms)
	(list)
	(let ((ctxi (thread-start!
		     (make-thread
		      (lambda () (parameterize ((current-output-port myo))
				((car forms))))))))
	  (cons ctxi (apply create-threads (cdr forms))))))
  (define (wait-threads thread-list)
    (if (null? thread-list)
	#t
	(begin (thread-join! (car thread-list))
	       (wait-threads (cdr thread-list)))))
  (wait-threads (apply create-threads forms))
  (display (get-output-string myo))))
(parallel-execute 
 (lambda () (thread-sleep! 3) (display "hello1") (newline))
 (lambda () (display "hello2") (newline)))
(exit)
