(uiop:define-package #:gamebits/physics2d/collision-shape
  (:use #:cl)
  (:mix #:gamebits/raylib
	#:gamebits/physics2d/aabb
	#:gamebits/vector-math)
  (:export #:circle-shape
	   #:circle-center
	   #:circle-radius
	   
	   #:compute-aabb
	   #:collide-shapes))

(in-package #:gamebits/physics2d/collision-shape)


(defgeneric compute-aabb (shape)
  (:documentation "Compute the axis-aligned bounding box (AABB) for the given shape."))

(defgeneric collide-shapes (body-a body-b)
  (:documentation "Check for collision between two shapes and return (values penetration normal) if they are colliding."))

(defclass collision-shape ()
  ())

(defclass circle-shape (collision-shape)
  ((center :initarg :center :accessor circle-center :initform (make-vector2 :x 0.0 :y 0.0))
   (radius :initarg :radius :accessor circle-radius :initform 1.0)))

(defmethod compute-aabb ((shape circle-shape))
  (let* ((center (circle-center shape))
	 (radius (circle-radius shape))
	 (min (make-vector2 :x (- (vector2-x center) radius)
			    :y (- (vector2-y center) radius)))
	 (max (make-vector2 :x (+ (vector2-x center) radius)
			    :y (+ (vector2-y center) radius))))
    (make-aabb :min min :max max)))

;; TODO: these shapes should be offset by the body's position
(defmethod collide-shapes ((circle-a circle-shape) (circle-b circle-shape))
  (let* ((n (vector2-sub (circle-center circle-b)
			 (circle-center circle-a)))
	 (r (+ (circle-radius circle-a)
	       (circle-radius circle-b)))
	 (r-squared (* r r)))
    (cond ((> (vector2-length-squared n)
	      r-squared)
	   nil)
	  ;; circles are colliding, compute penetration and normal
	  (t
	   (let* ((d (vector2-length n))
		  (penetration (- r d))
		  ;; avoid division by zero
		  (normal (if (/= d 0.0)
			      (vector2-scale n (/ 1.0 d))
			      (make-vector2 :x 1.0 :y 0.0))))
	     (values penetration
		     normal))))))
