(uiop:define-package #:gamebits/vector-math-test
  (:use #:cl)
  (:mix #:fiveam
	#:gamebits/test
	#:gamebits/raylib
	#:gamebits/vector-math)
  (:export #:test-vector2-add
	   #:test-vector2-scale
	   #:test-rnd-parkmiller))

(in-package #:gamebits/vector-math-test)

(def-suite* vector-math-test :in gamebits-test)

(test vector2-add
  (let ((v1 (make-vector2 :x 3 :y 4))
	(v2 (make-vector2 :x 1 :y 2)))
    (is (equalp (vector2-add v1 v2)
		(make-vector2 :x 4 :y 6)))))


