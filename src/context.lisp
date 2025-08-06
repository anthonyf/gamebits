(uiop:define-package #:gamebits/context
  (:use #:cl)
  (:export #:create-context
	   #:destroy-context
	   #:with-context
	   #:*ctx*
	   #:window-should-close
	   #:begin-drawing
	   #:end-drawing
	   #:with-drawing
	   #:clear-screen

	   #:draw-line
	   #:draw-arc-filled
	   #:draw-arc-lines

	   #:draw-filled-rect
	   #:draw-lined-rect
	   #:draw-filled-rounded-rect
	   #:draw-lined-rouned-rect
	   
	   #:load-font
	   #:destroy-font
	   #:with-font
	   #:draw-text
	   #:measure-text

	   #:mouse-button-down-p
	   #:mouse-button-up-p
	   #:mouse-button-pressed-p
	   #:mouse-button-released-p
	   #:mouse-position
	   #:+button-left+

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
(defgeneric load-font (ctx font-name size))
(defgeneric destroy-font (ctx font))

(defgeneric draw-line (ctx x1 y1 x2 y2 color thickness))
(defgeneric draw-arc-filled (ctx center-x center-y color radius))
(defgeneric draw-arc-lines (ctx center-x center-y color radius thickness))

(defgeneric draw-filled-rect (ctx x y width height color &optional rotation origin))
(defgeneric draw-lined-rect (ctx x y width height color thickness &optional rotation origin))
(defgeneric draw-filled-rounded-rect (ctx x y width height color &optional rotation origin))
(defgeneric draw-lined-rouned-rect (ctx x y width height color thickness roundness &optional rotation origin))


(defgeneric draw-text (ctx x y text color font size &optional rotation origin))
(defgeneric measure-text (ctx text font size))

;; input
(defgeneric mouse-button-down-p (ctx button-index))
(defgeneric mouse-button-up-p (ctx button-index))
(defgeneric mouse-button-pressed-p (ctx button-index))
(defgeneric mouse-button-released-p (ctx button-index))
(defgeneric mouse-position (ctx))

(defparameter +button-left+ 0)

;; primative types

(defstruct vector2 (x :float) (y :float))


(defmacro with-font ((ctx font font-name size) &body body)
  "Load FONT in the context and execute BODY with the loaded font."
  `(let ((,font (load-font ,ctx ,font-name ,size)))
     (unwind-protect
	  (progn ,@body)
       (destroy-font ,ctx ,font)
       (format t "destroyed font~%"))))

(defparameter *ctx* nil "The current drawing context.")

(defmacro with-context ((ctx type width height title) &body body)
  "Create a context of TYPE with WIDTH, HEIGHT, and TITLE, and execute BODY within that context."
  `(let* ((,ctx (create-context ,type ,width ,height ,title))
	  (*ctx* ,ctx))
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
