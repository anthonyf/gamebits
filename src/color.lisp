(uiop:define-package #:gamebits/color
  (:use #:cl)
  (:export #:color #:make-color :color-r :color-g :color-b :color-a
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

(in-package #:gamebits/color)

(defstruct color (r :int) (g :int) (b :int) (a :int))

;; various color constructors shamelessly stolen from raylib
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
