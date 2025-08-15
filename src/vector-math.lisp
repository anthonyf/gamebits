(uiop:define-package #:gamebits/vector-math
  (:use #:cl)
  (:mix #:gamebits/raylib)
  (:export #:vector2-add
	   #:vector2-scale
	   #:vector2-normalize
	   #:vector2-dot-product
	   #:vector2-from-angle
	   #:vector2-magnitude
	   #:rad2deg
	   #:deg2rad))

(in-package #:gamebits/vector-math)

(defun vector2-add (v1 v2)
  (make-vector2 :x (+ (vector2-x v1) (vector2-x v2))
		:y (+ (vector2-y v1) (vector2-y v2))))

(defun vector2-scale (v scalar)
  (make-vector2 :x (* (vector2-x v) scalar)
		:y (* (vector2-y v) scalar)))

(defun vector2-normalize (v)
  (let ((length (sqrt (+ (expt (vector2-x v) 2)
			 (expt (vector2-y v) 2)))))
    (if (zerop length)
	(make-vector2 :x 0 :y 0)
	(make-vector2 :x (/ (vector2-x v) length)
		      :y (/ (vector2-y v) length)))))

(defun vector2-dot-product (v1 v2)
  (+ (* (vector2-x v1) (vector2-x v2))
     (* (vector2-y v1) (vector2-y v2))))

(defun vector2-from-angle (angle)
  (make-vector2 :x (cos angle)
		:y (sin angle)))

(defun vector2-magnitude (v)
  (sqrt (+ (expt (vector2-x v) 2)
	   (expt (vector2-y v) 2))))

(defun rad2deg (rad)
  (coerce (float (* rad (/ 180.0 pi)))
	  'single-float))

(defun deg2rad (deg)
  (coerce (float (* deg (/ pi 180.0)))
	  'single-float))
