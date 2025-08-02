(uiop:define-package #:gamebits/context
  (:use #:cl)
  (:export #:create-context
	   #:destroy-context
	   #:window-should-close
	   #:begin-drawing
	   #:end-drawing
	   #:make-color
	   #:clear-screen
	   #:draw-line
	   #:draw-rect
	   #:draw-text
	   #:get-text-width))

(in-package #:gamebits/context)

;; context management functions
(defgeneric create-context (type width height title))
(defgeneric destroy-context (ctx))
(defgeneric window-should-close (ctx))

;; drawing functions
(defgeneric begin-drawing (ctx))
(defgeneric end-drawing (ctx))
(defgeneric make-color (ctx r g b a))
(defgeneric clear-screen (ctx color))
(defgeneric draw-line (ctx x1 y1 x2 y2 color))
(defgeneric draw-rect (ctx x y width height color))
(defgeneric draw-text (ctx x y text color font size))
(defgeneric get-text-width (ctx text font size))
