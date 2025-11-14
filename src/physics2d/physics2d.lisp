(uiop:define-package #:gamebits/physics2d
  (:use #:cl)
  (:shadow #:position)
  (:mix-reexport #:gamebits/physics2d/collision-shape
		 #:gamebits/physics2d/physics-body
		 #:gamebits/physics2d/collision-detection)
  (:export #:*bodies*
	   #:physics-main-loop
	   #:process-physics))

(in-package #:gamebits/physics2d)

(defparameter *bodies* nil
  "A global list of bodies in the physics simulation.")


(defun process-physics ()
  (resolve-collisions *bodies*))

(defun physics-main-loop (height width title &key render-fn update-physics-fn (fps 60))
  (with-window (height width title :fps nil)
    (let ((dt (/ 1.0 fps))
	  (accumulator 0.0))
      (let ((frame-start (get-time)))
	(loop :until (window-should-close)
	      :for current-time = (get-time)
	      :do (progn
		    ;; Store the time elapsed since the last frame began
		    (incf accumulator (- current-time frame-start))
		    ;; Record the starting of this frame
		    (setf frame-start current-time)
		    
		    ;; Clamp accumulator to avoid spiral of death
		    (when (> accumulator 0.2)
		      (setf accumulator 0.2))
		    
		    (loop :while (> accumulator dt)
			  :do (livesupport:continuable
				(process-physics)
				(when update-physics-fn
				  (funcall update-physics-fn dt))
				(decf accumulator dt)))
		  
		    (let ((alpha (/ accumulator dt)))
		      (when render-fn
			(livesupport:continuable
			  (funcall render-fn alpha))))))))))

