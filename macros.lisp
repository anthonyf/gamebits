(uiop:define-package #:gamebits/macros
  (:use #:cl)
  (:export #:with-fps))

(in-package #:gamebits/macros)

(defmacro with-fps ((fps) &body body)
  "Execute BODY once, maintaining the target FPS.
The user is responsible for looping externally. START-TIME should be initialized
before the loop begins."
  (let ((start-time (gensym "START-TIME"))
	(frame-time (gensym "FRAME-TIME"))
        (elapsed-time (gensym "ELAPSED-TIME")))
    `(let ((,start-time (get-internal-real-time))
	   (,frame-time (/ 1.0 ,fps)))  ; Calculate frame duration
       (let ((,elapsed-time (/ (- (get-internal-real-time) ,start-time)
                               internal-time-units-per-second)))
         ;; Execute the body
         ,@body
         ;; Sleep for the remaining time in the frame
         (when (< ,elapsed-time ,frame-time)
           (sleep (- ,frame-time ,elapsed-time)))
         ;; Update the start time for the next frame
         (setf ,start-time (get-internal-real-time))))))
