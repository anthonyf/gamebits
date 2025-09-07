(uiop:define-package #:gamebits/sprite
  (:use #:cl)
  (:mix #:gamebits/raylib)
  (:export #:get-animation-source-rect))

(in-package #:gamebits/sprite)


(defun get-animation-source-rect (texture w-frames h-frames frames-per-second)
  "Get the source rectangle for the current frame of an animation."
  (let* ((frame-width (/ (texture-width texture) w-frames))
	 (frame-height (/ (texture-height texture) h-frames))
	 (total-frames (* w-frames h-frames))
	 (current-frame (mod (floor (* (get-time) frames-per-second)) total-frames))
	 (frame-x (mod current-frame w-frames))
	 (frame-y (floor (/ current-frame w-frames))))
	(make-rectangle :x (* frame-x frame-width)
		    :y (* frame-y frame-height)
		    :width frame-width
		    :height frame-height)))
