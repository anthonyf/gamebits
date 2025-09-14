(uiop:define-package #:gamebits/rectangle
  (:use #:cl)
  (:export  #:rectangle #:make-rectangle #:rectangle-x #:rectangle-y
	    #:rectangle-width #:rectangle-height))

(in-package #:gamebits/rectangle)

(defstruct rectangle (x :float) (y :float) (width :float) (height :float))

