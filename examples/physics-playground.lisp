(uiop:define-package #:gamebits/examples/physics-playground
  (:use #:cl)
  (:mix #:gamebits/raylib
	#:gamebits/raygui
	#:gamebits/physics2d)
  (:export #:physics-playground))

(in-package #:gamebits/examples/physics-playground)

(defun draw-interface ()
  #+nil(gui-button ))


(defun render-fn (alpha)
  (declare (ignore alpha))
  (with-drawing ()
    (clear-background +white+)
    (draw-bodies)
    (draw-interface)
    ))

(defun physics-playground ()
  (physics-main-loop 800 600 "Physics Playground"
		     :render-fn 'render-fn
		     :fps 60))
