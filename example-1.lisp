(uiop:define-package #:gamebits/example-1
  (:use #:cl)
  (:local-nicknames (#:c #:gamebits))
  (:export #:run-example-1))

(in-package #:gamebits/example-1)

(defun update (ctx)
  "Update the game state. This function can be expanded to include more complex logic."
  ;; For now, we do nothing here.
  (format t "Updating game state...~%")
  (c:begin-drawing ctx)
  (c:clear-screen ctx c:+white+)		; White background
  (c:draw-text ctx  190 200 "Hello, Gamebits!" c:+red+ "default" 20)
  (c:end-drawing ctx)
  )

(defun run-example-1 ()  
  (tmt:with-body-in-main-thread ()
    (float-features:with-float-traps-masked t
      (let* ((ctx (c:create-context :raylib 800 600 "Example 1")))
	(loop :until (c:window-should-close ctx)
	      :do (c:with-fps (60)
		    (livesupport:continuable
		      (update ctx))
		    (livesupport:update-repl-link))
	      )
       
	(c:destroy-context ctx)))))
