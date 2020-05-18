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


(cl-labels
    ((decorate-orgtable (tbl)
			(seq-concatenate 'string
					 "("
					 "| Exercise Name | Days Spent | Spans Sessions | Minutes Spent |"
					 (char-to-string ?\n)
					 "|- + - + - + - |"
					 (format-orgtable tbl)
					 ")"))
     (format-orgtable (list-of-lists)
		      ;(error "Type of l-o-l=%s" (type-of list-of-lists))
		      (apply #'seq-concatenate (cons 'string (seq-map (lambda (x) (format-table-line x))
			       list-of-lists))))
     (format-table-line (line)
			(seq-concatenate 'string
					 (char-to-string ?\n)
					 "|"
					 ;"debug: seq-length="
					 ;(format "%d" (seq-length line))
					 (substring (car line) 0 (min 60 (seq-length (car line))))
					 "|"
					 (format "%3.3f"(caddr line))
					 "|"
					 (format "%3d" (nth 4 line))
					 "|"
					 (format "%3.3f" (nth 6 line))
					 "|")))

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
       (task-seq (apply 'seq-concatenate ;'seq-concatenate ;'append
	    (cons 'list (with-current-buffer "index.org"
	      (org-element-map (org-element-parse-buffer)
		  (list 'headline)
		(lambda (x)
		  (assert x)
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
			(assert (org-element-property :raw-value x) t "error: x=%s" x)
			(assert (org-element-property :closed x) t "error: x=%s" x)
			
			(list (list (org-element-property :raw-value x)
				    (org-element-property :closed x))))
		    (list))))))))
       (sorted-task-seq (seq-sort
			 (lambda (x y)
			  (if (org-time< (org-element-property :raw-value (cadr x))
					 (org-element-property :raw-value (cadr y)))
			      t
			    nil))
			 task-seq)))
  (insert
   (let ((res (seq-reduce (lambda (acc next-elem)
			    (assert next-elem t "next-elem=%s" next-elem)
			    (if (org-time< (org-element-property :raw-value
								 (cadr next-elem))
					   (cadr acc))
				(list (+ 1 (car acc))
				      (org-element-property :raw-value (cadr next-elem))
				      (progn (assert (cadddr acc) "wrong append=%s" acc)
					     (cons (cadddr acc) (caddr acc)))
				      next-elem)
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
						(cond ((<= session-end perv-time-stamp) acc)
						      ((<= next-time-stamp session-start ) acc)
						      (t (list (+ (car acc) 1)
							       (+ (cadr acc)
								  (cond ((and (<= perv-time-stamp session-start)
									      (<= session-end next-time-stamp))
									 (- session-end session-start))
									((and (<= session-start perv-time-stamp)
									      (<= perv-time-stamp session-end)
									      (<= session-end next-time-stamp))
									 (- session-end perv-time-stamp))
									((and (<= perv-time-stamp session-start)
									      (<= session-start next-time-stamp)
									      (<= next-time-stamp session-end))
									 (- next-time-stamp session-start))
									((and (<= session-start perv-time-stamp)
									      (<= next-time-stamp session-end))
									 (- next-time-stamp perv-time-stamp))
									(t 0))))))
						
						;; (if (and
						;;      (<= session-start next-time-stamp)
						;;      (<= next-time-stamp session-end))
						;;     t
						;;   acc)
						))
					    study-sessions
					    (list 0 0))))
		     (list next-time-stamp
			   (cons (list (car next-elem)  ;; next-elem
				       :spent-time-calendar-days (/ (-
							     next-time-stamp
							     perv-time-stamp)
							    (* 60 60 24))
				       :spans-sessions (if (not (eq 0 (car spans-sessions)))
							   (car spans-sessions)
							   (error "Fix time: %s, spans-sessions=%s" next-elem spans-sessions))
				       :spent-time-net-minutes (/ (cadr spans-sessions) 60))
				 retval)))))
		 sorted-task-seq
		 (list (org-time-string-to-seconds "2019-08-19 Mon 09:19") ()))))
	 )

     (seq-concatenate 'string
		      (char-to-string ?\()
		      (pp "Amount of the out-of-order-problems: ")
		      (pp (number-to-string (car res)))
		      (char-to-string ?\n)
		      ;(char-to-string ?\n)
		      (pp "Out-of-order problems :")
		      (char-to-string ?\n)
		      ;;(pp (caddr res))
		      ;; (pp (seq-reverse (seq-map (lambda (x) (list (car x))
		      ;; 			      )
		      ;; 			    (caddr res))))
		      (char-to-string ?\n)
		      (pp "Task summary:")
		      (char-to-string ?\n)
		      ;(pp (seq-reverse (seq-subseq astrotime-list 0 2)))
		      ;;(decorate-orgtable (seq-reverse (seq-subseq astrotime-list 0)))
		      ;;(decorate-orgtable (seq-reverse (seq-subseq astrotime-list 0)))
		      (pp (let* ((numbins (ceiling (log (+ 1.0 (seq-reduce #'max
						    (seq-map (lambda (x) (nth 6 x))
							     (seq-reverse (seq-subseq astrotime-list 0)))
						    0))
					       2))))
			    
			(seq-reduce (lambda (acc elem)
				      (let* ((hardness (nth 6 elem))
					    (nbin (floor (log (+ 1.0 hardness) 2))))
					(aset acc
					      nbin
					      (+ 1 (aref acc nbin)))
					acc))
			 (seq-reverse (seq-subseq astrotime-list 0))
			 (make-vector numbins 0))
			))
		      (char-to-string ?\))
     ;;(seq-reverse (caddr res))
     )))))

("Amount of the out-of-order-problems: ""13"
"Out-of-order problems :"

"Task summary:"
[2 6 15 41 55 67 85 52 29 6 3 1 1]
)



(provide '2020-05-13-time-analyzer)
;;; 2020-05-13-time-analyzer.el ends here
