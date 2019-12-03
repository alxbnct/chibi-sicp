(import (chibi process))
(import (chibi ast))
(define (square-limit painter n)
    (let ((combine4 (square-of-four flip-horiz identity
				    rotate180 flip-vert)))
      (combine4 (corner-split painter n))))

  (define (square-of-four tl tr bl br)
    (lambda (painter)
      (let ((top (beside (tl painter) (tr painter)))
	    (bottom (beside (bl painter) (br painter))))
	(below bottom top))))

  (define (corner-split painter n)
    (if (= n 0)
	painter
	(let ((up (up-split painter (- n 1)))
	      (right (right-split painter (- n 1))))
	  (let ((top-left (beside up up))
		(bottom-right (below right right))
		(corner (corner-split painter (- n 1))))
	    (beside (below painter top-left)
		    (below bottom-right corner))))))
(define (flip-vert painter)
  (transform-painter painter
		     (make-vect 0.0 1.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))
(define (identity x)
  x)
(define (make-vect xcor ycor . o)
  (append (list xcor) (list ycor) o))
(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cadr vect))
(define (scale-vect scale vect)
  (map (lambda (x) (* x scale)) vect))
(define (add-vect vec1 vec2)
  (map (lambda (cor1 cor2) (+ cor1 cor2)) vec1 vec2))
(define (sub-vect vec1 vec2)
  (map (lambda (cor1 cor2) (- cor1 cor2)) vec1 vec2))
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))
(define (make-segment start-vector end-vector)
  (list start-vector end-vector))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cadr segment))
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame)
	 (start-segment segment))
	((frame-coord-map frame)
	 (end-segment segment))))
     segment-list)))
(define wave 
   (segments->painter 
        (list 
               (make-segment (make-vect .25 0) (make-vect .35 .5)) 
               (make-segment (make-vect .35 .5) (make-vect .3 .6)) 
               (make-segment (make-vect .3 .6) (make-vect .15 .4)) 
               (make-segment (make-vect .15 .4) (make-vect 0 .65)) 
               (make-segment (make-vect 0 .65) (make-vect 0 .85)) 
               (make-segment (make-vect 0 .85) (make-vect .15 .6)) 
               (make-segment (make-vect .15 .6) (make-vect .3 .65)) 
               (make-segment (make-vect .3 .65) (make-vect .4 .65)) 
               (make-segment (make-vect .4 .65) (make-vect .35 .85)) 
               (make-segment (make-vect .35 .85) (make-vect .4 1)) 
               (make-segment (make-vect .4 1) (make-vect .6 1)) 
               (make-segment (make-vect .6 1) (make-vect .65 .85)) 
               (make-segment (make-vect .65 .85) (make-vect .6 .65)) 
               (make-segment (make-vect .6 .65) (make-vect .75 .65)) 
               (make-segment (make-vect .75 .65) (make-vect 1 .35)) 
               (make-segment (make-vect 1 .35) (make-vect 1 .15)) 
               (make-segment (make-vect 1 .15) (make-vect .6 .45)) 
               (make-segment (make-vect .6 .45) (make-vect .75 0)) 
               (make-segment (make-vect .75 0) (make-vect .6 0)) 
               (make-segment (make-vect .6 0) (make-vect .5 .3)) 
               (make-segment (make-vect .5 .3) (make-vect .4 0)) 
               (make-segment (make-vect .4 0) (make-vect .25 0)) 
        )
   )
)
(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
	(painter (make-frame
		  new-origin
		  (sub-vect (m corner1) new-origin)
		  (sub-vect (m corner2) new-origin)))))))
(define (frame-coord-map frame)
  (lambda (v)
   (add-vect
     (origin-frame frame)
            (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
	       (scale-vect (ycor-vect v) (edge2-frame frame))))))
(define canvas-size
  (make-parameter
   200
   (lambda (size)
     (if (and (exact-integer? size) (<= 2 size 1000))
	 size
	 (error "invalid canvas size")))))
(define canvas-file-name
   (make-parameter
      (string-append "./" (substring (process->string "uuidgen") 0 36) ".png")
      (lambda (name)
	(if (string? name)
	    name
	    (error "invalid canvas file name")))))
(define (canvas-reset)
  (system "rm" (canvas-file-name))
  (system "convert" "xc:white"
	  "-scale" (string-append
		    (number->string (canvas-size))
		    "x"
		    (number->string (canvas-size)))
	  (canvas-file-name)))
(define (canvas-refresh)
  (string-append "[[" (canvas-file-name) "]]"))
(canvas-reset)
(define (draw-line point1 point2)
  (system "mogrify"
	  "-fill" "black"
	  "-draw" (string-append "line "
				 (number->string (* (canvas-size) (car point1)))
				 ","
				 (number->string (* (canvas-size) (cadr point1)))
				 " "
				 (number->string (* (canvas-size) (car point2)))
				 ","
				 (number->string (* (canvas-size) (cadr point2))))
	  (canvas-file-name))
  (string-append "[[" (canvas-file-name) "]]"))
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
	   (transform-painter
	    painter1
	    (make-vect 0.0 0.0)
	    split-point
	    (make-vect 0.0 1.0)))
	  (paint-right
	   (transform-painter
	    painter2
	    split-point
	    (make-vect 1.0 0.0)
	    (make-vect 0.5 1.0))))
      (lambda (frame)
	(paint-left frame)
	(paint-right frame)))))
(define (below painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))
(define (rotate270 painter)
  (transform-painter painter
		     (make-vect 0.0 1.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))
(define (rotate90 painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))

(define (rotate180 painter)
  (transform-painter painter
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 1.0)
		     (make-vect 1.0 0.0)))
(define (split op1 op2)
  (define (split-inner painter n)
    (if (= n 0)
    painter
    (let ((smaller (split-inner painter (- n 1))))
      (op2 painter (op1 smaller smaller)))))
  (lambda (painter n)
    (split-inner painter n)))
(define up-split (split beside below))
(define right-split (split below beside))
(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.0 1.0)))

((square-limit wave 2) (make-frame (make-vect 0.0 1.0) (make-vect 1.0 0.0) (make-vect 0.0 -1.0)))
(canvas-refresh)
