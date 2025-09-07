;;;; gamebits.lisp
(uiop:define-package #:gamebits
  (:use #:cl)
  (:mix-reexport #:gamebits/raylib
		 #:gamebits/raygui
		 #:gamebits/rlgl
		 #:gamebits/vector-math
		 #:gamebits/physics2d)
  (:export #:with-main-thread))

(in-package #:gamebits)

(defmacro with-main-thread ((&key blocking) &body body)
  (alexandria:once-only (blocking)
    `(trivial-main-thread:with-body-in-main-thread (:blocking ,blocking)
       ,@body)))
