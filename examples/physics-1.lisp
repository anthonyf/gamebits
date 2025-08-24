(uiop:define-package #:gamebits/examples/physics-1
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:physics-1))

(in-package #:gamebits/examples/physics-1)

(defun update ()
  (with-drawing ()
    (clear-background +white+)))

(defun physics-1 ()
  (with-window (800 600 "Physics 1 Example")
    (loop :until (window-should-close)
	  :do (livesupport:continuable
		(funcall 'update))
	      (livesupport:update-repl-link))))

