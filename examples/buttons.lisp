(uiop:define-package #:gamebits/examples/buttons
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:buttons))

(in-package #:gamebits/examples/buttons)


(defun update (ctx delta-time)
  (declare (ignore delta-time))
  (with-drawing (ctx)
    (clear-screen ctx +white+)
    (with-ui-state ()
      (with-theme ((make-instance 'simple-theme))
	(when (button '#.(gensym) "Click Me" 10 10 100 50)
	  (format t "Button Clicked!~%"))))))

(defparameter *default-font* nil)

(defun buttons()
  (float-features:with-float-traps-masked (:overflow :invalid :divide-by-zero)
    (with-context (ctx :raylib 800 600 "Buttons Example")
      (with-font (ctx *default-font* "Roboto/static/Roboto-Regular.ttf" 50)
	(run-game ctx 'update)))))
