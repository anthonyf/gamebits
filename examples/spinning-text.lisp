(uiop:define-package #:gamebits/examples/spinning-text
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:spinning-text))

(in-package #:gamebits/examples/spinning-text)

(defparameter *default-font* nil)

(let ((rotation 0.0)
      )
  (defun update (ctx delta-time)
    "Update the game state. This function can be expanded to include more complex logic."
    ;; For now, we do nothing here.
    (let* ((font-size 50)
 	   (text (format nil "Hello, Gamebits! FPS=~A" (round (/ 1.0 delta-time))))
	   (text-size (measure-text ctx text *default-font* font-size))
	   (origin (make-vector2 :x (/ (vector2-x text-size) 2) :y (/ (vector2-y text-size) 2))))
      (with-drawing (ctx)
	(clear-screen ctx +white+)
	(draw-text ctx 400 300
		   text
		   +blue+ *default-font* font-size rotation origin)
	(incf rotation (* 90 delta-time 0.5))
	))))

(defun spinning-text ()
  (float-features:with-float-traps-masked (:overflow :invalid :divide-by-zero)
    (with-context (ctx :raylib 800 600 "Spinning Text Example")
      (with-font (ctx *default-font* "Roboto/static/Roboto-Regular.ttf" 50)
	(run-game ctx 'update)))))

