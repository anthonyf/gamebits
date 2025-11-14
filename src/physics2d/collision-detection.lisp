(uiop:define-package #:gamebits/physics2d/collision-detection
  (:use #:cl)
  (:shadow #:position)
  (:mix #:gamebits/physics2d/collision-shape
	#:gamebits/physics2d/physics-body
	#:gamebits/physics2d/aabb
	#:gamebits/vector-math
	#:gamebits/raylib)
  (:export #:resolve-collisions))

(in-package #:gamebits/physics2d/collision-detection)

(defstruct manifold
  body-a
  body-b
  (penetration 0.0 :type float)
  (normal (make-vector2 :x 0.0 :y 0.0) :type vector2))

(defun collide-bodies (body-a body-b)
  "Check for collision between two bodies and return a manifold if they are colliding."
  (multiple-value-bind (penetration normal)
      (collide-shapes (collision-shape body-a) (collision-shape body-b))
    (when penetration
      (make-manifold :body-a body-a
		     :body-b body-b
		     :penetration penetration
		     :normal normal))))

(defmethod move-body ((body circle-body) displacement)
  "Move the circle body by the specified displacement vector."
  (setf (circle-center body)
	(vector2-add (circle-center body) displacement)))


(defun unique-pairs (items)
  (loop for i on items
	append (loop for j in (cdr i)
		     collect (cons (car i) j))))

;; TODO: make a test for this
#+nil
(unique-pairs '(a b c))


(defun collide-bodies (body-a body-b)
  (multiple-value-bind (penetration normal)
      (collide-shapes (collision-shape body-a) (collision-shape body-b))
    (when (make-manifold
      :body-a circle-a
      :body-b circle-b
      :penetration penetration
      :normal normal)))


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


(defun resolve-collisions (bodies)
  (let ((potential-collisions (broad-phase-collision-detection bodies)))
    (loop for (body-a . body-b) in potential-collisions
	  for manifold = (collide body-a body-b)
	  when manifold
	    do (resolve-collision manifold))))
