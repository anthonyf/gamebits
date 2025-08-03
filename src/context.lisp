(uiop:define-package #:gamebits/context
  (:use #:cl)
  (:export #:create-context
	   #:destroy-context
	   #:with-context
	   #:window-should-close
	   #:begin-drawing
	   #:end-drawing
	   #:with-drawing
	   #:clear-screen
	   #:draw-line
	   #:draw-rect
	   #:load-font
	   #:destroy-font
	   #:with-font
	   #:draw-text
	   #:measure-text

	   #:vector2 #:make-vector2 :vector2-x :vector2-y
	   
	   ))

(in-package #:gamebits/context)

;; context management functions
(defgeneric create-context (type width height title))
(defgeneric destroy-context (ctx))
(defgeneric window-should-close (ctx))

;; drawing functions
(defgeneric begin-drawing (ctx))
(defgeneric end-drawing (ctx))
(defgeneric clear-screen (ctx color))
(defgeneric draw-line (ctx x1 y1 x2 y2 color))
(defgeneric load-font (ctx font-name size))
(defgeneric destroy-font (ctx font))
(defgeneric draw-rect (ctx x y width height color))

(defgeneric draw-text (ctx x y text color font size &optional rotation origin))
(defgeneric measure-text (ctx text font size))

;; primative types

(defstruct vector2 (x :float) (y :float))


(defmacro with-font ((ctx font font-name size) &body body)
  "Load FONT in the context and execute BODY with the loaded font."
  `(let ((,font (load-font ,ctx ,font-name ,size)))
     (unwind-protect
	  (progn ,@body)
       (destroy-font ,ctx ,font)
       (format t "destroyed font~%"))))

(defmacro with-context ((ctx type width height title) &body body)
  "Create a context of TYPE with WIDTH, HEIGHT, and TITLE, and execute BODY within that context."
  `(let ((,ctx (create-context ,type ,width ,height ,title)))
     (unwind-protect
	  (progn ,@body)
       (destroy-context ,ctx)
       (format t "destroyed context~%"))))

(defmacro with-drawing ((ctx) &body body)
  "Create a context of TYPE with WIDTH, HEIGHT, and TITLE, begin drawing, execute BODY, and end drawing."
  `(progn
     (begin-drawing ,ctx)
     (unwind-protect
	  (progn ,@body)
       (end-drawing ,ctx))))
