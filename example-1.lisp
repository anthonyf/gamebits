(uiop:define-package #:gamebits/example-1
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:run-example-1))

(in-package #:gamebits/example-1)

(defparameter *default-font* nil)

(defun update (ctx delta-time)
  "Update the game state. This function can be expanded to include more complex logic."
  ;; For now, we do nothing here.
  (with-drawing (ctx)
    (clear-screen ctx +white+)	; White background
    (draw-text ctx 190 200
		 (format nil "Hello, Gamebits! FPS=~A" (round (/ 1.0 delta-time)))
		 +blue+ *default-font* 50)
    ))

(defun run-example-1 ()
  (float-features:with-float-traps-masked (:overflow :invalid :divide-by-zero)
    (with-context (ctx :raylib 800 600 "Example 1")
      (with-font (ctx *default-font* "Roboto/static/Roboto-Regular.ttf" 50)
	(run-game ctx 'update)))))

