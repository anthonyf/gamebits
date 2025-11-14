(uiop:define-package #:gamebits/physics2d/aabb
  (:use #:cl)
  (:mix #:gamebits/raylib)
  (:export #:make-aabb #:min #:max
	   #:aabb-vs-aabb
	   #:aabb-contains-point))

(in-package #:gamebits/physics2d/aabb)

(defstruct aabb 
  (min (make-vector2 :x 0.0 :y 0.0) :type vector2)
  (max (make-vector2 :x 0.0 :y 0.0) :type vector2))

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
