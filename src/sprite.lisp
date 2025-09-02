(uiop:define-package #:gamebits/sprite
  (:use #:cl)
  (:mix #:gamebits/raylib))

(in-package #:gamebits/sprite)


(defun draw-sprite (texture position frame-x frame-y frame-width frame-height)
  (let ((src-width (texture-width texture)))
    (draw-texture-rec texture
		      (make-rectangle :x (* frame-x frame-width)
				      :y (* frame-y frame-height)
				      :width frame-width
				      :height frame-height)
		      (make-vector2 (vector2-x position)
				    (vector2-y position))
		      (make-color :r 255 :g 255 :b 255 :a 255))))
