;; Adapted from https://code.tutsplus.com/series/how-to-create-a-custom-physics-engine--gamedev-12715

(uiop:define-package #:gamebits/physics2d
  (:use #:cl)
  (:mix #:gamebits/vector2
	#:gamebits/vector-math)
  (:export #:aabb
	   #:aabb-vs-aabb
	   #:aabb-contains-point
	   #:circle
	   #:circle-vs-circle
	   #:draw-bodies
	   #:physics-main-loop))

(in-package #:gamebits/physics2d)

(defstruct material
  (friction 0.5 :type float)
  (restitution 0.5 :type float)
  (density 1.0 :type float))

;; Rock       Density : 0.6  Restitution : 0.1
;; Wood       Density : 0.3  Restitution : 0.2
;; Metal      Density : 1.2  Restitution : 0.05
;; BouncyBall Density : 0.3  Restitution : 0.8
;; SuperBall  Density : 0.3  Restitution : 0.95
;; Pillow     Density : 0.1  Restitution : 0.2
;; Static     Density : 0.0  Restitution : 0.4

(defclass body ()
  ((transform :accessor transform :initarg :transform)
   (material :accessor material :initarg :material :type material)

   ;; mass properties
   (mass :initform 1.0 :type float)
   (inverse-mass :initform 1.0 :type float)
   (inertia :initform 1.0 :type float)
   (inverse-inertia :initform 1.0 :type float)
   
   (velocity :accessor velocity :initarg :velocity :type vector2)
   (force :accessor force :initarg :force :type vector2)
   (gravity-scale :accessor gravity-scale :initarg :gravity-scale :type float)))

(defclass shape ()
  ())

(defgeneric draw-shape (shape)
  (:documentation "Draw the given shape."))

(defclass circle (shape)
  ((center :accessor circle-center :initarg :center :type vector2)
   (radius :accessor circle-radius :initarg :radius :type float)))

(defmethod draw-shape ((circle circle))
  (draw-circle-lines-v (circle-center circle)
		       (circle-radius circle)
		       +green+)
  (draw-line-v (circle-center circle)
	       (vector2-add (circle-center circle)
			    (make-vector2 :x (circle-radius circle)
					  :y 0.0))
	       +red+))

(defclass circle-body (body circle)
  ())




(defgeneric move-body (body displacement)
  (:documentation "Move the given body by the specified displacement vector."))


(defun draw-bodies ()
  (dolist (body *bodies*)
    (draw-shape body)))

