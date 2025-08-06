(uiop:define-package #:gamebits/imgui
  (:use #:cl)
  (:mix #:gamebits/context
	#:gamebits/color)
  (:export #:*theme*
	   #:with-theme
	   #:simple-theme
	   #:ui-state
	   #:*state*
	   #:with-ui-state
	   #:button))

(in-package #:gamebits/imgui)

(defgeneric draw-button (theme mode label x y w h))

(defparameter *theme* nil)

(defclass simple-theme ()
  ())

(defmacro with-theme ((theme) &body body)
  `(let ((*theme* ,theme))
     ,@body))

(defmethod draw-button ((theme simple-theme) mode label x y w h)
  (draw-filled-rect *ctx* x y w h 
		    (case mode
		      (:normal +gray+)
		      (:hovered +lightgray+)
		      (:pressed +darkgray+)))
  #+nil(format t "drawing button~%"))

(defparameter *state* nil)

(defclass ui-state ()
  ((hot-item-id :accessor hot-item-id
		:initform nil)
   (active-item-id :accessor active-item-id
		   :initform nil)
   ))

(defun ui-begin ()
  )

(defun ui-end ()
  )

(defmacro with-ui-state ((&optional state) &body body)
  `(let ((*state* (or ,state (make-instance 'ui-state))))
     (ui-begin)
     ,@body
     (ui-end)))


(defun centered-layout ())

(defun point-in-rect-p (x y rect-x rect-y rect-w rect-h)
  "Check if the point (x, y) is inside the rectangle defined by (rect-x, rect-y, rect-w, rect-h)."
  (and (>= x rect-x)
       (<= x (+ rect-x rect-w))
       (>= y rect-y)
       (<= y (+ rect-y rect-h))))

(defun region-hit-p (x y w h)
  (let* ((mouse-position (mouse-position *ctx*)))
    (point-in-rect-p (vector2-x mouse-position)
		     (vector2-y mouse-position)
		     x y w h)))


(defun button (id label x y w h)
  (let* ()
    (when (region-hit-p x y w h)
      (setf (hot-item-id *state*) id)
      (when (and (null (active-item-id *state*))
		 (mouse-button-down-p *ctx* +button-left+))
	(setf (active-item-id *state*) id)))
    
    (cond ((eql id (hot-item-id *state*))
	   (cond ((eql id (active-item-id *state*))
		  (draw-button *theme* label :pressed x y w h))
		 (t (draw-button *theme* :hovered label x y w h))))
	  (t (draw-button *theme* :normal label x y w h)))
    
    (and (eql id (hot-item-id *state*))
	 (eql id (active-item-id *state*))
	 (mouse-button-up-p *ctx* +button-left+))))
