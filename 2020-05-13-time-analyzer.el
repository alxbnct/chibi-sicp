;;; 2020-05-13-time-analyzer.el --- Analyze sicp time usage  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Vladimir Nikishkin

;; Author: Vladimir Nikishkin <lockywolf@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;
;;(setq temp-list 'unbound)




;;; Code:

(require 'org-element)




(let* ((study-sessions (apply 'append (with-current-buffer "only_study.org"
		 (org-element-map (org-element-parse-buffer)
		     (list 'clock)
		   (lambda (x)
		     (let ((raw-string (org-element-property :raw-value
						  (org-element-property :value x))))
		     (list
		      (list
		       (org-time-string-to-seconds (substring-no-properties
		     	  raw-string
		     	  1
		     	  21))
		       (org-time-string-to-seconds (substring-no-properties
		     	  raw-string
		     	  25
		     	  45))))
		     ))))))
       (task-seq (apply 'append
	    (with-current-buffer "index.org"
	      (org-element-map (org-element-parse-buffer)
		  (list 'headline)
		(lambda (x)
		  ;;(plist-get (cadr (org-element-at-point)) :raw-value)
		  (if (and (eq 'done (org-element-property :todo-type x))
			   ;;(string-match "Exercise" (org-element-property :raw-value x))
			   )
		      (progn
			;; (princ (org-element-property :raw-value x)
			;; 	   (get-buffer "*scratch*"))
			;; (princ (char-to-string ?\n) (get-buffer "*scratch*"))
			;; (princ (org-element-property :raw-value
			;; 				 (org-element-property :closed x))
			;; 	   (get-buffer "*scratch*"))
			;; (princ (char-to-string ?\n) (get-buffer "*scratch*"))
			
			(list (list (org-element-property :raw-value x)
				    (org-element-property :closed x))))
		    (list)))))))
       (sorted-task-seq (seq-sort
			 (lambda (x y)
			  (if (org-time< (org-element-property :raw-value (cadr x))
					 (org-element-property :raw-value (cadr y)))
			      t
			    nil))
			 task-seq)))
  (insert
   (let ((res (seq-reduce (lambda (acc next-elem)
			    (if (org-time< (org-element-property :raw-value
								 (cadr next-elem))
					   (cadr acc))
				(list (+ 1 (car acc))
				      (org-element-property :raw-value (cadr next-elem))
				      (cons (cadddr acc) (caddr acc)))
			      (list (car acc)
				    (org-element-property :raw-value (cadr next-elem))
				    (caddr acc) next-elem)))
			  task-seq
			  (list 0 "2019-08-19 Mon 09:19" (list) (list))))
	 (astrotime-list
	  (cadr (seq-reduce
		 (lambda (acc next-elem)
		   (let ((perv-time-stamp (car acc))
			 (retval (cadr acc))
			 (next-time-stamp
			  (org-time-string-to-seconds
			   (org-element-property :raw-value (cadr next-elem)))))
		     ;; loop body
		     (let ((spans-sessions (seq-reduce
					    (lambda (acc next-session)
					      (let ((session-start (car next-session))
						    (session-end (cadr next-session)))
						;; We need to TODO  check that every closure date is within a study session
						;; (cond ((<= session-end perv-time-stamp) acc)
						;;       ((<= next-time-stamp session-start ) acc)
						;;       (t (+ acc 1)))
						(if (and
						     (<= session-start next-time-stamp)
						     (<= next-time-stamp session-end))
						    t
						  acc)
						))
					    study-sessions
					    nil)))
		     (list next-time-stamp
			   (cons (list next-elem
				       :spent-time-days (/ (-
							     next-time-stamp
							     perv-time-stamp)
							    (* 60 60 24))
				       :spans-sessions (if (eq t spans-sessions)
							   spans-sessions
							   (error "Fix time: %s, spans-sessions=%s" next-elem spans-sessions))
				       :spent-time 'todo)
				 retval)))))
		 sorted-task-seq
		 (list (org-time-string-to-seconds "2019-08-19 Mon 09:19") ()))))
	 )

     (seq-concatenate 'string
		      (pp "Amount of the out-of-order-problems: ")
		      (pp (number-to-string (car res)))
		      (char-to-string ?\n)
		      ;(char-to-string ?\n)
		      ;(pp "Out-of-order problems :")
		      ;(char-to-string ?\n)
		      ;(pp (seq-reverse (caddr res)))
		      ;(char-to-string ?\n)
		      (pp "Astronomical time for tasks")
		      (char-to-string ?\n)
		      (pp (seq-subseq astrotime-list 0 5)))
     
     ;;(seq-reverse (caddr res))
     )))




(provide '2020-05-13-time-analyzer)
;;; 2020-05-13-time-analyzer.el ends here
