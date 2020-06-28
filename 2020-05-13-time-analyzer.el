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
(cl-labels (
; lexical-defun
(decorate-orgtable (tbl)
  (seq-concatenate
   'string
   "("
"| Exercise | Days | Sessions | Minutes |"
(char-to-string ?\n)
"|- + - + - + - |"
(format-orgtable tbl)
")")
)

; lexical-defun
(format-orgtable (list-of-lists)
(apply
 #'seq-concatenate
 (cons
  'string
  (seq-map (lambda (x) (format-table-line x)) list-of-lists)))
)

; lexical-defun
(format-table-line (line)
(seq-concatenate 'string
 (char-to-string ?\n)
 "|"
 (substring (car line) 0 (min 60 (seq-length (car line))))
 "|"
 (format "%3.3f"(caddr line))
 "|"
 (format "%3d" (nth 4 line))
 "|"
 (format "%3.3f" (nth 6 line))
 "|")
)
;; lexical-defun
(get-study-sessions-data ()
 (apply
  'append
  (with-current-buffer
      (find-file-noselect "only_study.org")
    (org-element-map
        (org-element-parse-buffer)
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
                     )))))
 )

;; lexical-defun
(get-task-sequence-data ()
(let ((problem-index 0))
 (apply
  'seq-concatenate
  (cons
   'list
   (with-current-buffer (find-file-noselect "index.org")
     (org-element-map
         (org-element-parse-buffer)
         (list 'headline)
       (lambda (x)
         (assert x)
         ;;(plist-get (cadr (org-element-at-point)) :raw-value)
         (if (and (eq 'done (org-element-property :todo-type x)))
             (progn
               ;; (princ (org-element-property :raw-value x)
               ;;       (get-buffer "*scratch*"))
               ;; (princ (char-to-string ?\n) (get-buffer "*scratch*"))
               ;; (princ (org-element-property :raw-value
               ;;                             (org-element-property :closed x))
               ;;       (get-buffer "*scratch*"))
               ;; (princ (char-to-string ?\n) (get-buffer "*scratch*"))
               (assert (org-element-property :raw-value x) t "error: x=%s" x)
               (assert (org-element-property :closed x) t "error: x=%s" x)
               (setq problem-index (+ 1 problem-index))
               (list (list (org-element-property :raw-value x)
                           (org-element-property :closed x)
                           problem-index)))
                      (list))))))))
 )

;; lexical-defun
(sort-task-seq (task-seq)
 (seq-sort
  (lambda (x y)
    (if (org-time< (org-element-property :raw-value (cadr x))
                   (org-element-property :raw-value (cadr y)))
        t
      nil))
  task-seq)
 )

;; lexical-defun
(find-out-of-order-tasks (task-seq)
(seq-reduce (lambda (acc next-elem)
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
            (list 0 "2019-08-19 Mon 09:19" (list) (list)))
)

;; lexical-defun
(find-spanning-sessions-and-duration
 (prev-time-stamp next-time-stamp study-sessions)
 (seq-reduce
  (lambda (acc next-session)
    (let ((session-start (car next-session))
          (session-end (cadr next-session)))
      (cond ((<= session-end prev-time-stamp) acc)
            ((<= next-time-stamp session-start ) acc)
            (t (list (+ (car acc) 1)
                     (+ (cadr acc)
                        (cond ((and (<= prev-time-stamp session-start)
                                    (<= session-end next-time-stamp))
                               (- session-end session-start))
                              ((and (<= session-start prev-time-stamp)
                                    (<= prev-time-stamp session-end)
                                    (<= session-end next-time-stamp))
                               (- session-end prev-time-stamp))
                              ((and (<= prev-time-stamp session-start)
                                    (<= session-start next-time-stamp)
                                    (<= next-time-stamp session-end))
                               (- next-time-stamp session-start))
                              ((and (<= session-start prev-time-stamp)
                                    (<= next-time-stamp session-end))
                               (- next-time-stamp prev-time-stamp))
                              (t 0))))))
      
      ;; (if (and
      ;;      (<= session-start next-time-stamp)
      ;;      (<= next-time-stamp session-end))
      ;;     t
      ;;   acc)
      ))
  study-sessions
  (list 0 0)))

;; lexical-defun
(summarize-list (sorted-task-seq study-sessions)
(cadr (seq-reduce
       (lambda (acc next-elem)
         (let ((prev-time-stamp (car acc))
               (retval (cadr acc))
               (next-time-stamp
                (org-time-string-to-seconds
                 (org-element-property :raw-value (cadr next-elem))))
               (exercise-name (car next-elem))
               (exercise-index (caddr next-elem)))
           ;; loop body
           (let ((spans-sessions
                  (find-spanning-sessions-and-duration
                   prev-time-stamp next-time-stamp study-sessions)))
             (list next-time-stamp
                   (cons (list exercise-name  ;; next-elem
                               :spent-time-calendar-days (/ (-
                                                             next-time-stamp
                                                             prev-time-stamp)
                                                            (* 60 60 24))
                               :spans-sessions (if (not (eq 0 (car spans-sessions)))
                                                   (car spans-sessions)
                                                 (error "Fix time: %s, spans-sessions=%s" next-elem spans-sessions))
                               :spent-time-net-minutes (/ (cadr spans-sessions) 60)
                               :original-index exercise-index)
                                 retval)))))
       sorted-task-seq
       (list (org-time-string-to-seconds "2019-08-19 Mon 09:19") ())))
)

(r-h (l)
  (seq-reverse (seq-subseq l 0)))

;; lexical-defun
(make-logarithmic-histogram (astrotime-list)
(let* ((numbins
        (ceiling
         (log (+ 1.0
                 (seq-reduce
                  #'max
                  (seq-map (lambda (x) (nth 6 x))
                           (r-h astrotime-list)
                           )
                  0))
              2))))
  
  (seq-reduce
   (lambda (acc elem)
     (let* ((hardness (nth 6 elem))
            (nbin (floor (log (+ 1.0 hardness) 2))))
       (aset acc
             nbin
             (+ 1 (aref acc nbin)))
       acc))
   (r-h astrotime-list)
   (make-vector numbins 0)))
)

;; lexical-defun
(make-linear-histogram (astrotime-list)
(let* ((numbins 32)
       (binsize
        (ceiling
         (/ (seq-reduce
             #'max
             (seq-map
              (lambda (x) (nth 6 x))
              (r-h astrotime-list))
             0)
            numbins ))))

  (seq-reduce
   (lambda (acc elem)
     (let* ((hardness (nth 6 elem))
            (nbin (floor (/ hardness binsize))))
       (aset acc
             nbin
             (+ 1 (aref acc nbin)))
       acc))
   (r-h astrotime-list)
   (make-vector numbins 0)))
)

;; lexical-defun
(sort-by-hardness (astrotime-list)
;; 6 is the hardness index
(seq-sort (lambda (x y)
            (let* ((hardness-x (nth 6 x))
                   (hardness-y (nth 6 y)))
              (if (< hardness-x hardness-y)
                  t
                nil)))
          astrotime-list)
)

;; lexical-defun
(sort-by-nsessions (astrotime-list)
;; 4 is the nsessions index
(seq-sort (lambda (x y)
            (let* ((nses-x (nth 4 x))
                   (nses-y (nth 4 y)))
              (if (< nses-x nses-y)
                  t
                nil)))
          astrotime-list)
)

;; lexical-defun
(sort-by-original-index (astrotime-list)
;; 8 is the original index
(seq-sort (lambda (x y)
            (let* ((oidx-x (nth 8 x))
                   (oidx-y (nth 8 y)))
              (if (< oidx-x oidx-y)
                  t
                nil)))
          astrotime-list)
)

) ;; end cl-labels defuns

(let* (

;; lexical-define
(study-sessions (get-study-sessions-data))

;; lexical-define
(task-seq (get-task-sequence-data))

;; lexical-define
(sorted-task-seq (sort-task-seq task-seq))

;; lexical-define
(out-of-order-tasks (find-out-of-order-tasks task-seq))

;; lexical-define
(astrotime-list
 (summarize-list sorted-task-seq study-sessions))

;; lexical-define
(logarithmic-histogram
 (make-logarithmic-histogram astrotime-list))

;; lexical-define
(linear-histogram
 (make-linear-histogram astrotime-list))

;; lexical-define

(problems-sorted-by-hardness
 (sort-by-hardness astrotime-list))

;; lexical-define
(problems-sorted-by-nsessions
 (sort-by-nsessions astrotime-list))

;; lexical-define
(problems-sorted-by-original-index
 (sort-by-original-index astrotime-list))

)

(insert
   (let ()
     (seq-concatenate
      'string
      (char-to-string ?\()
      (pp "debug: task-seq")
      (pp (seq-subseq task-seq 0 2))
      (char-to-string ?\n)
      (pp "Amount of the out-of-order-problems: ")
      (pp (number-to-string (car out-of-order-tasks)))
      (char-to-string ?\n)
      ;;(char-to-string ?\n)
      (pp "Out-of-order problems :")
      (char-to-string ?\n)
      (pp (caddr out-of-order-tasks))
      ;; (pp (seq-reverse (seq-map (lambda (x) (list (car x))
      ;;                              )
      ;;                            (caddr out-of-order-tasks))))
      (char-to-string ?\n)

      (pp "Task summary (astrotime):")
      (char-to-string ?\n)
      (pp (seq-reverse (seq-subseq astrotime-list 0 2)))
      ;;(decorate-orgtable (seq-reverse (seq-subseq astrotime-list 0)))
      ;;(decorate-orgtable (seq-reverse (seq-subseq astrotime-list 0)))

      (char-to-string ?\n)
      (pp "Task summary (original-index):")
      (char-to-string ?\n)
      (pp (seq-subseq
           problems-sorted-by-original-index 0 2))

      
      (pp "Logarithmic histogram:")
      ;; Make a logarithmic histogram
      (pp logarithmic-histogram)
      (char-to-string ?\n)
      
      (pp "Linear histogram:")
      ;; Make a linear histogram
      (pp linear-histogram)
      (char-to-string ?\n)
      
      (pp "Median hardness:")
      (char-to-string ?\n)
      
      (pp
       (nth
        (floor (/ (seq-length
                   problems-sorted-by-hardness)
                  2))
               problems-sorted-by-hardness))
      
      (pp "Median n-sessions:")
      (char-to-string ?\n)
      
      (pp
       (nth
        (floor (/ (seq-length
                   problems-sorted-by-nsessions)
                  2))
               problems-sorted-by-nsessions))
      (char-to-string ?\))
      ;;(seq-reverse (caddr out-of-order-tasks))
      )))))

("debug: task-seq"
 (("Figure 1.1 Tree representation, showing the value of each subcombination"
  (timestamp
   (:type inactive :raw-value "[2019-08-20 Tue 14:35]" :year-start 2019 :month-start 8 :day-start 20 :hour-start 14 :minute-start 35 :year-end 2019 :month-end 8 :day-end 20 :hour-end 14 :minute-end 35 :begin 3559 :end 3581 :post-blank 0))
  1)
 ("Exercise 1.1 Interpreter result"
  (timestamp
   (:type inactive :raw-value "[2019-08-20 Tue 14:23]" :year-start 2019 :month-start 8 :day-start 20 :hour-start 14 :minute-start 23 :year-end 2019 :month-end 8 :day-end 20 :hour-end 14 :minute-end 23 :begin 5324 :end 5346 :post-blank 0))
  2))

"Amount of the out-of-order-problems: ""13"
"Out-of-order problems :"
(("Exercise 5.40 maintaining a compile-time environment"
  (timestamp
   (:type inactive :raw-value "[2020-03-08 Sun 15:02]" :year-start 2020 :month-start 3 :day-start 8 :hour-start 15 :minute-start 2 :year-end 2020 :month-end 3 :day-end 8 :hour-end 15 :minute-end 2 :begin 2374268 :end 2374290 :post-blank 0))
  351)
 ("Exercise 5.17 Printing labels"
  (timestamp
   (:type inactive :raw-value "[2020-02-29 Sat 17:43]" :year-start 2020 :month-start 2 :day-start 29 :hour-start 17 :minute-start 43 :year-end 2020 :month-end 2 :day-end 29 :hour-end 17 :minute-end 43 :begin 2170175 :end 2170197 :post-blank 0))
  328)
 ("Figure 5.1 Data paths for a Register Machine"
  (timestamp
   (:type inactive :raw-value "[2020-02-23 Sun 13:18]" :year-start 2020 :month-start 2 :day-start 23 :hour-start 13 :minute-start 18 :year-end 2020 :month-end 2 :day-end 23 :hour-end 13 :minute-end 18 :begin 2070667 :end 2070689 :post-blank 0))
  310)
 ("Exercise 4.79 prolog environments"
  (timestamp
   (:type inactive :raw-value "[2020-05-10 Sun 17:59]" :year-start 2020 :month-start 5 :day-start 10 :hour-start 17 :minute-start 59 :year-end 2020 :month-end 5 :day-end 10 :hour-end 17 :minute-end 59 :begin 2020240 :end 2020262 :post-blank 0))
  309)
 ("Exercise 4.71 Louis' simple queries"
  (timestamp
   (:type inactive :raw-value "[2020-02-21 Fri 20:56]" :year-start 2020 :month-start 2 :day-start 21 :hour-start 20 :minute-start 56 :year-end 2020 :month-end 2 :day-end 21 :hour-end 20 :minute-end 56 :begin 1890725 :end 1890747 :post-blank 0))
  301)
 ("Exercise 4.69 great grandchildren"
  (timestamp
   (:type inactive :raw-value "[2020-02-21 Fri 17:43]" :year-start 2020 :month-start 2 :day-start 21 :hour-start 17 :minute-start 43 :year-end 2020 :month-end 2 :day-end 21 :hour-end 17 :minute-end 43 :begin 1673864 :end 1673886 :post-blank 0))
  299)
 ("Exercise 4.49 Alyssa's generator"
  (timestamp
   (:type inactive :raw-value "[2020-02-18 Tue 21:51]" :year-start 2020 :month-start 2 :day-start 18 :hour-start 21 :minute-start 51 :year-end 2020 :month-end 2 :day-end 18 :hour-end 21 :minute-end 51 :begin 1156393 :end 1156415 :post-blank 0))
  278)
 ("Exercise 3.69 triples"
  (timestamp
   (:type inactive :raw-value "[2020-02-17 Mon 20:10]" :year-start 2020 :month-start 2 :day-start 17 :hour-start 20 :minute-start 10 :year-end 2020 :month-end 2 :day-end 17 :hour-end 20 :minute-end 10 :begin 873125 :end 873147 :post-blank 0))
  214)
 ("Exercise 2.61 sets as ordered lists"
  (timestamp
   (:type inactive :raw-value "[2019-09-26 Thu 21:44]" :year-start 2019 :month-start 9 :day-start 26 :hour-start 21 :minute-start 44 :year-end 2019 :month-end 9 :day-end 26 :hour-end 21 :minute-end 44 :begin 242506 :end 242528 :post-blank 0))
  109)
 ("Exercise 2.45 split"
  (timestamp
   (:type inactive :raw-value "[2019-09-24 Tue 01:37]" :year-start 2019 :month-start 9 :day-start 24 :hour-start 1 :minute-start 37 :year-end 2019 :month-end 9 :day-end 24 :hour-end 1 :minute-end 37 :begin 206270 :end 206292 :post-blank 0))
  93)
 ("Exercise 1.9 Iterative or recursive?"
  (timestamp
   (:type inactive :raw-value "[2019-08-29 Thu 15:14]" :year-start 2019 :month-start 8 :day-start 29 :hour-start 15 :minute-start 14 :year-end 2019 :month-end 8 :day-end 29 :hour-end 15 :minute-end 14 :begin 18521 :end 18543 :post-blank 0))
  10)
 ("Exercise 1.3 Sum of squares"
  (timestamp
   (:type inactive :raw-value "[2020-02-28 Fri 12:01]" :year-start 2020 :month-start 2 :day-start 28 :hour-start 12 :minute-start 1 :year-end 2020 :month-end 2 :day-end 28 :hour-end 12 :minute-end 1 :begin 6379 :end 6401 :post-blank 0))
  4)
 ("Figure 1.1 Tree representation, showing the value of each subcombination"
  (timestamp
   (:type inactive :raw-value "[2019-08-20 Tue 14:35]" :year-start 2019 :month-start 8 :day-start 20 :hour-start 14 :minute-start 35 :year-end 2019 :month-end 8 :day-end 20 :hour-end 14 :minute-end 35 :begin 3559 :end 3581 :post-blank 0))
  1))

"Task summary (astrotime):"
(("Exercise 5.52 Making a compiler for scheme" :spent-time-calendar-days 22.975 :spans-sessions 13 :spent-time-net-minutes 2359.0 :original-index 363)
 ("Exercise 4.79 prolog environments" :spent-time-calendar-days 4.284722222222222 :spans-sessions 5 :spent-time-net-minutes 940.0 :original-index 309))

"Task summary (original-index):"
(("Figure 1.1 Tree representation, showing the value of each subcombination" :spent-time-calendar-days 0.006944444444444444 :spans-sessions 1 :spent-time-net-minutes 10.0 :original-index 1)
 ("Exercise 1.1 Interpreter result" :spent-time-calendar-days 1.211111111111111 :spans-sessions 2 :spent-time-net-minutes 459.0 :original-index 2))
"Logarithmic histogram:"[2 6 15 41 55 67 85 52 29 6 3 1 1]

"Linear histogram:"[301 38 14 2 1 2 2 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1]

"Median hardness:"
("Exercise 2.8 sub-interval" :spent-time-calendar-days 0.12361111111111112 :spans-sessions 1 :spent-time-net-minutes 58.0 :original-index 55)
"Median n-sessions:"
("Exercise 1.41 double-double" :spent-time-calendar-days 0.010416666666666666 :spans-sessions 1 :spent-time-net-minutes 15.0 :original-index 42)
)

(provide '2020-05-13-time-analyzer)
;;; 2020-05-13-time-analyzer.el ends here
