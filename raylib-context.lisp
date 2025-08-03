(uiop:define-package #:gamebits/raylib-context
  (:use #:cl)
  (:mix #:gamebits/context)
  (:local-nicknames (#:r #:gamebits/raylib))
  (:export))

(in-package #:gamebits/raylib-context)


(defclass raylib-context ()
  ())

(defmethod create-context ((type (eql :raylib)) width height title)
  (let ((ctx (make-instance 'raylib-context)))
    (r:init-window width height title)
    ctx))

(defmethod destroy-context ((ctx raylib-context))
  (r:close-window))

(defmethod begin-drawing ((ctx raylib-context))
  (r:begin-drawing))

(defmethod end-drawing ((ctx raylib-context))
  (r:end-drawing))

(defmethod clear-screen ((ctx raylib-context) color)
  (r:clear-background color))

(defmethod load-font ((ctx raylib-context) font-name)
  (let ((font (r:load-font font-name)))
    (unless font
	  (error "Failed to load font: ~a" font-name))
    font))

(defmethod destroy-font ((ctx raylib-context) font)
  (r:unload-font font))

(defmethod draw-text ((ctx raylib-context) x y text color font size)
  ;;(r:draw-text text x y size color)
  (r:draw-text-pro font text
		   (make-vector2 :x x :y y)
		   (make-vector2 :x 0 :y 0)
		   0.0 (float size) 1.0 color)
  )

(defmethod window-should-close ((ctx raylib-context))
  (r:window-should-close))

(defmethod cffi:translate-into-foreign-memory
    ((value color)
     (type r:%color-tclass)
     pointer)
  (cffi:with-foreign-slots ((r:r r:g r:b r:a) pointer (:struct r:%color))
    (setf r:r (color-r value))
    (setf r:g (color-g value))
    (setf r:b (color-b value))
    (setf r:a (color-a value))))

(defmethod cffi:translate-into-foreign-memory
    ((value vector2)
     (type r:%vector2-tclass)
     pointer)
  (cffi:with-foreign-slots ((r:x r:y) pointer (:struct r:%vector2))
    (setf r:x (float (vector2-x value)))
    (setf r:y (float (vector2-y value)))))

