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

(defstruct circle
  (center (make-vector2 :x 0 :y 0) :type vector2)
  (radius 0.0 :type single-float))

(defun circle-vs-circle (circle1 circle2)
  (<= (distance-squared (circle-center circle1) (circle-center circle2))
      (expt (+ (circle-radius circle1) (circle-radius circle2)) 2)))
