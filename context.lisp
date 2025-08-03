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
	   #:+lightgray+
	   #:+gray+
	   #:+darkgray+
	   #:+yellow+
	   #:+gold+
	   #:+orange+
	   #:+pink+
	   #:+red+
	   #:+maroon+
	   #:+green+
	   #:+lime+
	   #:+darkgreen+
	   #:+skyblue+
	   #:+blue+
	   #:+darkblue+
	   #:+purple+
	   #:+violet+
	   #:+darkpurple+
	   #:+beige+
	   #:+brown+
	   #:+darkbrown+
	   #:+white+
	   #:+black+
	   #:+blank+
	   #:+magenta+
	   #:+raywhite+
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
(defgeneric draw-text (ctx x y text color font size))
(defgeneric get-text-width (ctx text font size))

;; primative types

(defstruct vector2 (x :float) (y :float))

(defstruct color (r :int) (g :int) (b :int) (a :int))

(defparameter +lightgray+ (make-color :r 200 :g 200 :b 200 :a 255))   ;; Light Gray               
(defparameter +gray+ (make-color :r 130 :g 130 :b 130 :a 255))   ;; Gray                          
(defparameter +darkgray+ (make-color :r 80 :g 80 :b 80 :a 255))      ;; Dark Gray                 
(defparameter +yellow+ (make-color :r 253 :g 249 :b 0 :a 255))     ;; Yellow                      
(defparameter +gold+ (make-color :r 255 :g 203 :b 0 :a 255))     ;; Gold                          
(defparameter +orange+ (make-color :r 255 :g 161 :b 0 :a 255))     ;; Orange                      
(defparameter +pink+ (make-color :r 255 :g 109 :b 194 :a 255))   ;; Pink                          
(defparameter +red+ (make-color :r 230 :g 41 :b 55 :a 255))     ;; Red                            
(defparameter +maroon+ (make-color :r 190 :g 33 :b 55 :a 255))     ;; Maroon                      
(defparameter +green+ (make-color :r 0 :g 228 :b 48 :a 255))      ;; Green                        
(defparameter +lime+ (make-color :r 0 :g 158 :b 47 :a 255))      ;; Lime                          
(defparameter +darkgreen+ (make-color :r 0 :g 117 :b 44 :a 255))      ;; Dark Green               
(defparameter +skyblue+ (make-color :r 102 :g 191 :b 255 :a 255))   ;; Sky Blue                   
(defparameter +blue+ (make-color :r 0 :g 121 :b 241 :a 255))     ;; Blue                          
(defparameter +darkblue+ (make-color :r 0 :g 82 :b 172 :a 255))      ;; Dark Blue                
(defparameter +purple+ (make-color :r 200 :g 122 :b 255 :a 255))   ;; Purple                      
(defparameter +violet+ (make-color :r 135 :g 60 :b 190 :a 255))    ;; Violet                      
(defparameter +darkpurple+ (make-color :r 112 :g 31 :b 126 :a 255))    ;; Dark Purple             
(defparameter +beige+ (make-color :r 211 :g 176 :b 131 :a 255))   ;; Beige                        
(defparameter +brown+ (make-color :r 127 :g 106 :b 79 :a 255))    ;; Brown                        
(defparameter +darkbrown+ (make-color :r 76 :g 63 :b 47 :a 255))      ;; Dark Brown               
(defparameter +white+ (make-color :r 255 :g 255 :b 255 :a 255))   ;; White                        
(defparameter +black+ (make-color :r 0 :g 0 :b 0 :a 255))         ;; Black                        
(defparameter +blank+ (make-color :r 0 :g 0 :b 0 :a 0))           ;; Blank (Transparent)          
(defparameter +magenta+ (make-color :r 255 :g 0 :b 255 :a 255))     ;; Magenta                    
(defparameter +raywhite+ (make-color :r 245 :g 245 :b 245 :a 255))   ;; My own White (raylib logo)

(defmacro with-font ((ctx font font-name size) &body body)
  "Load FONT in the context and execute BODY with the loaded font."
  `(let ((,font (load-font ,ctx ,font-name ,size)))
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
