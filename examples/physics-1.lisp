(uiop:define-package #:gamebits/examples/physics-1
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:physics-1))

(in-package #:gamebits/examples/physics-1)

(defun render (alpha)
  (declare (ignore alpha))
  (with-drawing ()
    (clear-background +white+)
    (draw-bodies)))

(defun physics-1 ()
  (physics-main-loop 800 600 "Physics Example 1"
		     :render-fn 'render)
		     :fps 60)

