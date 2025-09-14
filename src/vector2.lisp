(uiop:define-package #:gamebits/vector2
  (:use #:cl)
  (:export #:vector2 #:make-vector2 #:vector2-x #:vector2-y
	   #:x #:y))

(in-package #:gamebits/vector2)

(defstruct vector2 (x :float) (y :float))

