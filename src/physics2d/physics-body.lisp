(uiop:define-package #:gamebits/physics2d/physics-body
  (:use #:cl)
  (:mix #:gamebits/vector-math
	#:gamebits/raylib
	#:gamebits/physics2d/collision-shape)
  (:shadow #:position)
  (:export #:phsyics-body
	   #:static-body
	   #:rigid-body

	   #:transform
	   #:position
	   #:rotation
	   #:scale
	   
	   #:collision-shape
	   #:collision-layer
	   #:position
	   #:rotation
	   #:linear-velocity
	   #:angular-velocity
	   #:linear-acceleration
	   #:angular-acceleration
	   #:mass
	   #:forces
	   #:torques
	   #:gravity-scale
	   #:restitution
	   #:friction
	   ))

(in-package #:gamebits/physics2d/physics-body)

(defclass transform ()
  ((position :initarg :position :accessor position :initform (make-vector2 :x 0.0 :y 0.0))
   (rotation :initarg :rotation :accessor rotation :initform 0.0 :type float)
   (scale :initarg :scale :accessor scale :initform (make-vector2 :x 1.0 :y 1.0))))

(defun transform-point (transform point)
  (let* ((scaled-point (vector2-mul point (scale transform)))
	 (rotated-point (vector2-rotate scaled-point (rotation transform)))
	 (translated-point (vector2-add rotated-point (position transform))))
	translated-point))

(defclass physics-body ()
  ((collision-shape :initarg :collision-shape :accessor collision-shape :initform nil :type collision-shape)
   (collision-layer :initarg :collision-layer :accessor collision-layer :initform 1)
   (transform :initarg :transform :accessor transform :initform (make-instance 'transform) :type transform)))

(defclass static-body (physics-body)
  ((restitution :initarg :restitution :accessor restitution :initform 0.2)
   (friction :initarg :friction :accessor friction :initform 0.5)))

(defclass rigid-body (physics-body)
  ((linear-velocity :initarg :linear-velocity :accessor linear-velocity :initform (make-vector2 :x 2 :y 0))
   (angular-velocity :initarg :angular-velocity :accessor angular-velocity :initform 0.0)
   (linear-acceleration :initarg :linear-acceleration :accessor linear-acceleration :initform (make-vector2 :x 2 :y 0))
   (angular-acceleration :initarg :angular-acceleration :accessor angular-acceleration :initform 0.0)
   (mass :initarg :mass :accessor mass :initform 1.0)
   (forces :initarg :forces :accessor forces :initform (make-vector2 :x 2 :y 0))
   (torques :initarg :torques :accessor torques :initform 0.0)
   (gravity-scale :initarg :gravity-scale :accessor gravity-scale :initform 1.0)
   (restitution :initarg :restitution :accessor restitution :initform 0.2)
   (friction :initarg :friction :accessor friction :initform 0.5)))


