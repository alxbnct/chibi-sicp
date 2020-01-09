;; sleep.scm
(import (srfi 18)
	(scheme small))

(thread-join!
 (thread-start!
  (make-thread (lambda ()
		 (let loop ((x 1))
		   (thread-sleep! 1)
		   (write x)
		   (newline)
		   (loop (+ x 1)))))))

(exit)
