(uiop:define-package #:gamebits/examples/spinning-text
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:spinning-text))

(in-package #:gamebits/examples/spinning-text)

(defparameter *default-font* nil)

(defparameter *rotation* 0.0)

(defun update ()
  "Update the game state. This function can be expanded to include more complex logic."
  ;; For now, we do nothing here.
  (let* ((delta-time (get-frame-time))
	 (font-spacing 1.0)
	 (font-size 50.0)
 	 (text (format nil "Hello, Gamebits! FPS=~A" (get-fps)))
	 (text-size (measure-text-ex *default-font* text font-size font-spacing))
	 (origin (make-vector2 :x (/ (vector2-x text-size) 2) :y (/ (vector2-y text-size) 2))))
    (with-drawing ()
      (clear-background +white+)
      (draw-text-pro *default-font* text (make-vector2 :x 400.0 :y 300.0)
		     origin *rotation* font-size font-spacing +blue+)
      (incf *rotation* (* 90 delta-time 0.5))
      )))

(defun spinning-text ()
  (with-window (800 600 "Spinning Text Example")
    (with-font (*default-font* (namestring (asdf:system-relative-pathname :gamebits "Roboto/static/Roboto-Regular.ttf")))
      ;;(setf *default-font* (get-font-default))
      (loop :until (window-should-close)
	    :do (progn
		  (livesupport:continuable 
		    (funcall 'update))
		  (livesupport:update-repl-link))))))
