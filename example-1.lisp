(uiop:define-package #:gamebits/example-1
  (:use #:cl)
  (:local-nicknames (#:c #:gamebits))
  (:export #:run-example-1))

(in-package #:gamebits/example-1)

(defparameter *default-font* nil)

(defun update (ctx delta-time)
  "Update the game state. This function can be expanded to include more complex logic."
  (declare (ignore delta-time))
  ;; For now, we do nothing here.
  (c:with-drawing (ctx)
    (c:clear-screen ctx c:+white+)	; White background
    (c:draw-text ctx  190 200
		 "Hello, Gamebits!"
		 c:+red+ *default-font* 100)
    ))

(defun do-fps (fps start-time body-fn)
  "Execute BODY-FN once, maintaining the target FPS.
  FPS is the target frames per second.
  START-TIME is the time at the start of the current frame.
  BODY-FN is a function or lambda to execute during the frame.
  Returns the updated start time for the next frame."
  (let* ((frame-time (/ 1.0 fps))	; Calculate frame duration
         (elapsed-time (/ (- (get-internal-real-time) start-time)
                          internal-time-units-per-second)))
    ;; Execute the body function
    (funcall body-fn frame-time)
    ;; Sleep for the remaining time in the frame
    (when (< elapsed-time frame-time)
      (sleep (- frame-time elapsed-time)))
    ;; Return the updated start time for the next frame
    (get-internal-real-time)))

(defun run-game (ctx update-func &key (fps 60))
  (let* ((start-time (get-internal-real-time))) ; Initialize start time
    (loop :until (c:window-should-close ctx)
	  :do (setf start-time
		    (do-fps fps start-time
		      (lambda (delta-time)
			(livesupport:continuable
			  (funcall update-func ctx delta-time))
			(livesupport:update-repl-link)))))))


(defun run-example-1 ()
  (tmt:with-body-in-main-thread ()
    (float-features:with-float-traps-masked t
      (c:with-context (ctx :raylib 800 600 "Example 1")
	(c:with-font (ctx *default-font* "Roboto/static/Roboto-Regular.ttf")
	  (run-game ctx 'update))))))
