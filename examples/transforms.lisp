(uiop:define-package #:gamebits/examples/transforms
  (:use #:cl)
  (:mix #:gamebits/raylib
	#:gamebits/vector2
	#:gamebits/vector-math
	#:gamebits/matrix-math)
  (:export #:transforms))

(in-package #:gamebits/examples/transforms)

(defparameter *screen-width* 800)
(defparameter *screen-height* 600)

(defun draw-base-shape ()
  (let ((center (transform-vector2 (make-vector2 :x 0 :y 0)))
	(line-point (transform-vector2 (make-vector2 :x 50 :y 0))))
    (draw-circle-lines (round (vector2-x center))
		       (round (vector2-y center))
		       (distance line-point center)
		       +black+)
    (draw-line (round (vector2-x center))
	       (round (vector2-y center))
	       (round (vector2-x line-point))
	       (round (vector2-y line-point))
	       +red+)))

(defparameter *rotations* (list 0.0 0.0 0.0 0.0))
(defparameter *speeds* (list 100.0 -200.0 300.0 -400.0))

(defun update-rotations ()
  (let ((delta (get-frame-time)))
    (loop for i from 0 below (length *rotations*)
	  do (incf (nth i *rotations*)
		   (* delta (nth i *speeds*))))))

(defun draw-shapes (rotations)
  (when rotations
    (with-current-transform (:theta (deg2rad (car rotations)))
      (draw-base-shape)
      (with-current-transform (:tx 150.0 :ty 0.0 :sx 0.5 :sy 0.5)
	(draw-shapes (cdr rotations))))))

(defun update ()
  (with-drawing ()
    (clear-background +white+)
    (update-rotations)
    (with-current-transform (:tx (/ *screen-width* 2.0)
			     :ty (/ *screen-height* 2.0))
      (draw-shapes *rotations*))
    (draw-fps 10 10)))

(defun transforms ()
  (with-window (*screen-width* *screen-height* "Transforms Example")
    (loop :until (window-should-close)
	  :do (progn
		(livesupport:continuable 
		  (update))
		(livesupport:update-repl-link)))))
