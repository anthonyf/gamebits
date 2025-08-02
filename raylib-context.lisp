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

(defmethod draw-text ((ctx raylib-context) x y text color font size)
  (r:draw-text text x y size color))

(defmethod window-should-close ((ctx raylib-context))
  (r:window-should-close))
