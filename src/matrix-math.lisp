(uiop:define-package #:gamebits/matrix-math
  (:use #:cl)
  (:mix #:gamebits/vector2
	#:gamebits/rectangle
	#:gamebits/vector-math)
  (:export #:*transforms*
	   #:matrix3
	   #:matrix3-m11
	   #:matrix3-m12
	   #:matrix3-m13
	   #:matrix3-m21
	   #:matrix3-m22
	   #:matrix3-m23
	   #:matrix3-m31
	   #:matrix3-m32
	   #:matrix3-m33
	   #:transform-angle
	   #:transform-f-rect
	   #:transform-rotate
	   #:transform-scale
	   #:transform-scale-x
	   #:transform-scale-y
	   #:transform-translate
	   #:transform-vector2
	   #:with-current-transform
	   #:current-transform
	   ))

(in-package #:gamebits/matrix-math)

(defstruct matrix3
  (m11 0 :type float) (m12 0 :type float) (m13 0 :type float)
  (m21 0 :type float) (m22 0 :type float) (m23 0 :type float)
  (m31 0 :type float) (m32 0 :type float) (m33 0 :type float))

(defun matrix3-multiply! (m1 m2)
  (let (t11 t12 t13 t21 t22 t23 t31 t32 t33)
    (with-slots ((a11 m11) (a12 m12) (a13 m13)
		 (a21 m21) (a22 m22) (a23 m23)
		 (a31 m31) (a32 m32) (a33 m33)) m1
      (with-slots ((b11 m11) (b12 m12) (b13 m13)
		   (b21 m21) (b22 m22) (b23 m23)
		   (b31 m31) (b32 m32) (b33 m33)) m2
	(setf t11 (+ (* a11 b11) (* a12 b21) (* a13 b31))
	      t12 (+ (* a11 b12) (* a12 b22) (* a13 b32))
	      t13 (+ (* a11 b13) (* a12 b23) (* a13 b33))
	      t21 (+ (* a21 b11) (* a22 b21) (* a23 b31))
	      t22 (+ (* a21 b12) (* a22 b22) (* a23 b32))
	      t23 (+ (* a21 b13) (* a22 b23) (* a23 b33))
	      t31 (+ (* a31 b11) (* a32 b21) (* a33 b31))
	      t32 (+ (* a31 b12) (* a32 b22) (* a33 b32))
	      t33 (+ (* a31 b13) (* a32 b23) (* a33 b33)))
	(setf a11 t11 a12 t12 a13 t13
	      a21 t21 a22 t22 a23 t23
	      a31 t31 a32 t32 a33 t33)))
    m1))

(defun matrix3-scale (sx sy)
  (make-matrix3 :m11 sy  :m12 0.0 :m13 0.0
		:m21 0.0 :m22 sx  :m23 0.0
		:m31 0.0 :m32 0.0 :m33 1.0))

(defun matrix3-rotate (theta)
  (make-matrix3 :m11 (cos theta) :m12 (- (sin theta)) :m13 0.0
		:m21 (sin theta) :m22 (cos theta)     :m23 0.0
		:m31 0.0         :m32 0.0             :m33 1.0))

(defun matrix3-translate (tx ty)
  (make-matrix3 :m11 1.0 :m12 0.0 :m13 tx
		:m21 0.0 :m22 1.0 :m23 ty
		:m31 0.0 :m32 0.0 :m33 1.0))

(defun matrix3-identity ()
  (make-matrix3 :m11 1.0 :m12 0.0 :m13 0.0
		:m21 0.0 :m22 1.0 :m23 0.0
		:m31 0.0 :m32 0.0 :m33 1.0))

(defun matrix3-copy (m)
  (with-slots (m11 m12 m13
	       m21 m22 m23
	       m31 m32 m33)
      m
    (make-matrix3 :m11 m11 :m12 m12 :m13 m13
		  :m21 m21 :m22 m22 :m23 m23
		  :m31 m31 :m32 m32 :m33 m33)))

;; transforms

(defvar *transforms* (list (matrix3-identity)))

(defun push-matrix ()
  "push a copy of the current matrix"
  (assert *transforms* nil "trying to push to uninitialized *transforms*")
  (push (matrix3-copy (first *transforms*))
	 *transforms*))

(defun pop-matrix ()
  "pop the current matrix"
  (assert *transforms* nil "trying to pop too many times")
  (pop *transforms*)
  (assert *transforms* nil "*transforms* should always have at least 1 entry (identity)"))

(defun transform-rotate (theta)
  (matrix3-multiply! (first *transforms*)
		     (matrix3-rotate theta)))

(defun transform-scale (sx sy)
  (matrix3-multiply! (first *transforms*)
		     (matrix3-scale sx sy)))

(defun transform-scale-y (matrix)
  

(defun transform-scale-x (matrix)
 ))

(defun transform-translate (tx ty)
  (matrix3-multiply! (first *transforms*)
		     (matrix3-translate (float tx) (float ty))))

(defun transform-vector2 (v)
  (with-slots (x y) v
    (with-slots (m11 m12 m13
		 m21 m22 m23
		 m31 m32 m33)
	(first *transforms*)
      (make-vector2 :x (+ (* m11 x) (* m12 y) (* m13 1))
		    :y (+ (* m21 x) (* m22 y) (* m23 1))))))

(defun transform-f-rect (rect)
  (let* ((pos (transform-vector2 (make-vector2 :x (rectangle-x rect) :y (rectangle-y rect))))
	 (sx (vector2-length (vector2-sub (transform-vector2 (make-vector2 :x 1.0 :y 0.0))
					  pos)))
	 (sy (vector2-length (vector2-sub (transform-vector2 (make-vector2 :x 0.0 :y 1.0))
					  pos))))
    (make-rectangle :x (vector2-x pos)
		    :y (vector2-y pos)
		    :width (* sx (rectangle-width rect))
		    :height (* sy (rectangle-height rect)))))

(defun transform-angle ()
  (let ((xform (first *transforms*)))
    (atan (matrix3-m21 xform)
	  (matrix3-m11 xform))))

(defun current-transform ()
  (first *transforms*))

(defmacro with-current-transform ((&key (theta nil theta-p) (sx nil sx-p) (sy nil sy-p) (tx nil tx-p) (ty nil ty-p)) &body body)
  `(unwind-protect
	(progn (push-matrix)
	       ,@(when (or tx-p ty-p)
		   `((transform-translate (or ,tx 0.0) (or ,ty 0.0))))
	       ,@(when theta-p
		   `((transform-rotate ,theta)))
	       ,@(when (or sx-p sy-p)
		   `((transform-scale (or ,sx 1.0) (or ,sy 1.0))))
	       ,@body)
     (pop-matrix)))
