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
	   #:get-text-width

	   #:vector2 #:make-vector2 :vector2-x :vector2-y
	   
	   #:color #:make-color :color-r :color-g :color-b :color-a
	   #:+red+ :+white+ :+blue+
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
(defgeneric load-font (ctx font-name))
(defgeneric destroy-font (ctx font))
(defgeneric draw-rect (ctx x y width height color))
(defgeneric draw-text (ctx x y text color font size))
(defgeneric get-text-width (ctx text font size))

;; primative types

(defstruct vector2 (x :float) (y :float))

(defstruct color (r :int) (g :int) (b :int) (a :int))

(defparameter +red+ (make-color :r 255 :g 0 :b 0 :a 255))
(defparameter +white+ (make-color :r 255 :g 255 :b 255 :a 255))
(defparameter +blue+ (make-color :r 0 :g 0 :b 255 :a 255))

(defmacro with-font ((ctx font font-name) &body body)
  "Load FONT in the context and execute BODY with the loaded font."
  `(let ((,font (load-font ,ctx ,font-name)))
	 (unwind-protect
	  (progn ,@body)
	   (destroy-font ,ctx ,font))))

(defmacro with-context ((ctx type width height title) &body body)
  "Create a context of TYPE with WIDTH, HEIGHT, and TITLE, and execute BODY within that context."
  `(let ((,ctx (create-context ,type ,width ,height ,title)))
     (unwind-protect
	  (progn ,@body)
       (destroy-context ,ctx))))

(defmacro with-drawing ((ctx) &body body)
  "Create a context of TYPE with WIDTH, HEIGHT, and TITLE, begin drawing, execute BODY, and end drawing."
  `(progn
     (begin-drawing ,ctx)
     (unwind-protect
	  (progn ,@body)
       (end-drawing ,ctx))))
