;;;; gamebits.lisp
(uiop:define-package #:gamebits
  (:use #:cl)
  (:mix-reexport #:gamebits/macros
		 #:gamebits/context
		 #:gamebits/color)
  (:export #:run-game))

(in-package #:gamebits)

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
  (loop :for start-time = (get-internal-real-time)
	  :then (do-fps fps start-time
		  (lambda (delta-time)
		    (livesupport:continuable 
		      (funcall update-func ctx delta-time))))
	:until (window-should-close ctx)
	:do (livesupport:update-repl-link)))
