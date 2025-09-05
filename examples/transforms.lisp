(uiop:define-package #:gamebits/examples/transforms
  (:use #:cl)
  (:mix #:gamebits/raylib
	#:gamebits/rlgl)
  (:export #:transforms))

(in-package #:gamebits/examples/transforms)

(defparameter *screen-width* 800)
(defparameter *screen-height* 600)

(defun draw-base-shape ()
  (draw-circle-lines 0 0 50.0 +black+)
  (draw-line 0 0 50 0 +red+))

(defparameter *rotations* (list 0.0 0.0 0.0 0.0))
(defparameter *speeds* (list 100.0 -200.0 300.0 -400.0))

(defun update-rotations ()
  (let ((delta (get-frame-time)))
    (loop for i from 0 below (length *rotations*)
	  do (incf (nth i *rotations*)
		   (* delta (nth i *speeds*))))))

(defun draw-shapes (rotations)
  (when rotations
    (with-matrix-push ()
      (rl-rotatef (car rotations) 0.0 0.0 1.0)
      (draw-base-shape)
      (rl-translatef 150.0 0.0 0.0)
      (rl-scalef 0.5 0.5 1.0)
      (draw-shapes (cdr rotations)))))

(defun update ()
  (with-drawing ()
    (clear-background +white+)
    (update-rotations)
    (with-matrix-push
      (rl-translatef (/ *screen-width* 2.0) (/ *screen-height* 2.0) 0.0)
      (draw-shapes *rotations*))
    (draw-fps 10 10)))

(defun transforms ()
  (with-window (*screen-width* *screen-height* "Transforms Example")
    (loop :until (window-should-close)
	  :do (progn
		(livesupport:continuable 
		  (funcall 'update))
		(livesupport:update-repl-link)))))
