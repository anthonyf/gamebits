(uiop:define-package #:gamebits/vector-math-test
  (:use #:cl)
  (:mix #:fiveam
	#:gamebits/test
	#:gamebits/raylib
	#:gamebits/vector-math)
  (:export #:vector-math-test))

(in-package #:gamebits/vector-math-test)

(def-suite* vector-math-test :in gamebits-test)

(test vector2-add
  (let ((v1 (make-vector2 :x 3 :y 4))
	(v2 (make-vector2 :x 1 :y 2)))
    (is (equalp (vector2-add v1 v2)
		(make-vector2 :x 4 :y 6)))))


(test vector2-sub
  (let ((v1 (make-vector2 :x 3 :y 4))
	(v2 (make-vector2 :x 1 :y 2)))
	(is (equalp (vector2-sub v1 v2)
		    (make-vector2 :x 2 :y 2)))))

(test vector2-scale
  (let ((v (make-vector2 :x 3 :y 4)))
	(is (equalp (vector2-scale v 2)
		    (make-vector2 :x 6 :y 8)))))

(test vector2-normalize
  (let ((v (make-vector2 :x 3 :y 4)))
	(is (equalp (vector2-normalize v)
		    (make-vector2 :x 0.6 :y 0.8)))))

(test vector2-dot-product
  (let ((v1 (make-vector2 :x 3 :y 4))
	(v2 (make-vector2 :x 1 :y 2)))
    (is (equalp (vector2-dot-product v1 v2) 11.0))))

(test vector2-from-angle
  (let ((angle (/ pi 4))) ; 45 degrees
	(is (equalp (vector2-from-angle angle)
		    (make-vector2 :x (cos angle) :y (sin angle))))))

(test vector2-magnitude
  (let ((v (make-vector2 :x 3 :y 4)))
    (is (equalp (vector2-magnitude v) 5.0))))

(test rad2deg
  (let ((rad (/ pi 4))) ; 45 degrees
    (is (equalp (rad2deg rad) 45.0))))

(test deg2rad
  (let ((deg 45.0)) ; 45 degrees
    (is (equalp (deg2rad deg) (/ pi 4)))))
