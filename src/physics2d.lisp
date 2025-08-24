;; Adapted from https://code.tutsplus.com/series/how-to-create-a-custom-physics-engine--gamedev-12715

(uiop:define-package #:gamebits/physics2d
  (:use #:cl)
  (:mix #:gamebits/raylib
	#:gamebits/vector-math)
  (:export #:aabb
	   #:aabb-vs-aabb
	   #:aabb-contains-point
	   #:distance-squared
	   #:distance
	   #:circle
	   #:circle-vs-circle
	   ))

(in-package #:gamebits/physics2d)

(defstruct aabb 
  (min (make-vector2 :x 0 :y 0) :type vector2)
  (max (make-vector2 :x 0 :y 0) :type vector2))

(defun aabb-vs-aabb (aabb1 aabb2)
  (and (<= (vector2-x (aabb-min aabb1)) (vector2-x (aabb-max aabb2)))
       (>= (vector2-x (aabb-max aabb1)) (vector2-x (aabb-min aabb2)))
       (<= (vector2-y (aabb-min aabb1)) (vector2-y (aabb-max aabb2)))
       (>= (vector2-y (aabb-max aabb1)) (vector2-y (aabb-min aabb2)))))

(defun aabb-contains-point (aabb point)
  (and (<= (vector2-x (aabb-min aabb)) (vector2-x point))
       (>= (vector2-x (aabb-max aabb)) (vector2-x point))
       (<= (vector2-y (aabb-min aabb)) (vector2-y point))
       (>= (vector2-y (aabb-max aabb)) (vector2-y point))))

(defun distance-squared (p1 p2)
  (+ (expt (- (vector2-x p1) (vector2-x p2)) 2)
     (expt (- (vector2-y p1) (vector2-y p2)) 2)))

(defun distance (p1 p2)
  (sqrt (distance-squared p1 p2)))

(defstruct manifold
  body-a
  body-b
  (penetration 0.0 :type float)
  (normal (make-vector2 :x 0 :y 0) :type vector2))


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

(defstruct mass-data
  (mass 1.0 :type float)
  (inverse-mass 1.0 :type float)
  (inertia 1.0 :type float)
  (inverse-inertia 1.0 :type float))

(defclass body ()
  ((transform :accessor transform :initarg :transform)
   (material :accessor material :initarg :material :type material)
   (mass-data :accessor mass-data :initarg :mass-data :type mass-data)
   (velocity :accessor velocity :initarg :velocity :type vector2)
   (force :accessor force :initarg :force :type vector2)
   (gravity-scale :accessor gravity-scale :initarg :gravity-scale :type float)))

(defclass shape ()
  ())

(defclass circle (shape)
  ((center :accessor circle-center :initarg :center :type vector2)
   (radius :accessor circle-radius :initarg :radius :type float)))

(defclass circle-body (body circle)
  ())

(defgeneric collide (body-a body-b)
  (:documentation "Check for collision between two bodies and return a manifold if they are colliding."))

(defgeneric compute-aabb (body)
  (:documentation "Compute the axis-aligned bounding box (AABB) for the given body."))

(defmethod compute-aabb ((body circle-body))
  (let* ((center (circle-center body))
	 (radius (circle-radius body))
	 (min (make-vector2 :x (- (vector2-x center) radius)
			    :y (- (vector2-y center) radius)))
	 (max (make-vector2 :x (+ (vector2-x center) radius)
			    :y (+ (vector2-y center) radius))))
	(make-aabb :min min :max max)))


(defun unique-pairs (items)
  (loop for i on items
	append (loop for j in (cdr i)
		     collect (cons (car i) j))))

;; TODO: make a test for this
#+nil
(unique-pairs '(a b c))

(defun matching-layers-p (body-a body-b)
  "Check if two bodies are on matching collision layers."
  (declare (ignore body-a body-b))
  ;; TODO: Placeholder implementation; replace with actual layer checking logic.
  t)

(defun broad-phase-collision-detection (bodies)
  "Perform broad-phase collision detection on a list of bodies.  Returns
a list of body pairs that may be colliding."
  (loop for (a . b) in (unique-pairs bodies)
	for a-aabb = (compute-aabb a)
	for b-aabb = (compute-aabb b)
	when (and (aabb-vs-aabb a-aabb b-aabb)
		  (matching-layers-p a b))
	  collect (cons a b)))

(defun process-physics (bodies)
  (let ((potential-collisions (broad-phase-collision-detection bodies)))
    (loop for (body-a . body-b) in potential-collisions
	  for manifold = (collide body-a body-b)
	  when manifold
	    do (resolve-collision manifold))))

(defgeneric collide (body-a body-b)
  (:documentation "Check for collision between two bodies and return a manifold if they are colliding."))

(defmethod collide ((circle-a circle-body) (circle-b circle-body))
  "Check for collision between two circles and return a manifold if they are colliding."
  (let* ((n (vector2-sub (circle-center circle-b)
			 (circle-center circle-a)))
	 (r (+ (circle-radius circle-a)
	       (circle-radius circle-b)))
	 (r-squared (* r r)))
    (cond ((> (vector2-length-squared n)
	      r-squared)
	   nil)
	  ;; circles are colliding, compute manifold
	  (t
	   (let* ((d (vector2-length n))
		  (penetration (- r d))
		  ;; avoid division by zero
		  (normal (if (/= d 0.0)
			      (vector2-scale n (/ 1.0 d))
			      (make-vector2 :x 1.0 :y 0.0))))
	     (make-manifold
		      :body-a circle-a
		      :body-b circle-b
		      :penetration penetration
		      :normal normal))))))

(defgeneric move-body (body displacement)
  (:documentation "Move the given body by the specified displacement vector."))

(defmethod move-body ((body circle-body) displacement)
  "Move the circle body by the specified displacement vector."
  (setf (circle-center body)
	(vector2-add (circle-center body) displacement)))

(defun resolve-collision (manifold)
  "Resolve the collision between two bodies based on the manifold."
  (let* ((body-a (manifold-body-a manifold))
	 (body-b (manifold-body-b manifold))
	 (penetration (manifold-penetration manifold))
	 (normal (manifold-normal manifold))
	 ;; move bodies apart
	 (move-a (vector2-scale normal (/ penetration 2.0)))
	 (move-b (vector2-scale normal (/ (- penetration) 2.0))))
    ;; update positions
    (move-body body-a move-a)
    (move-body body-b move-b)))
