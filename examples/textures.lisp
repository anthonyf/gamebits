(uiop:define-package #:gamebits/examples/textures
  (:use #:cl)
  (:mix #:gamebits/raylib
	#:gamebits/sprite)
  (:export #:run-texture-example))

(in-package #:gamebits/examples/textures)

(defparameter *coin-texture* nil)

(defun update ()
  (with-drawing ()
    (clear-background +white+)
    (let ((source-rect (get-animation-source-rect *coin-texture* 8 1 16)))
      (draw-texture-rec *coin-texture* source-rect
			(make-vector2 :x (/ 800 2.0)
				      :y (/ 600 2.0))
		 	+white+)
      (draw-fps 10 10))))

(defun run-texture-example ()
  (with-window (800 600 "Texture Example")
    (let* ((coin-texture-file (namestring
			       (asdf:system-relative-pathname
				:gamebits/examples "examples/assets/coin_sheet.png")))
	   (*coin-texture* (load-texture
			    coin-texture-file)))
      (format nil "Loaded texture from '~A'~%" coin-texture-file)
      (assert (is-texture-valid *coin-texture*))
      (unwind-protect
	   (loop :until (window-should-close)
		 :do (progn
		       (livesupport:continuable
			 (update))
		       (livesupport:update-repl-link)))
	(unload-texture *coin-texture*)))))
