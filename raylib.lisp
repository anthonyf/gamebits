;; raylib.lisp
(uiop:define-package #:gamebits/raylib
  (:use #:cl)
  (:export #:%color #:%color-tclass #:r #:g #:b #:a
	   #:%vector2 #:%vector2-tclass #:x #:y
	   #:init-window
	   #:close-window
	   #:set-target-fps
	   #:window-should-close
	   #:begin-drawing
	   #:end-drawing
	   #:clear-background
	   #:draw-text))

(in-package #:gamebits/raylib)

(cffi:define-foreign-library raylib
  (:darwin "libraylib.dylib")
  (:unix "libraylib.so")
  (:windows "raylib.dll")
  )

;; Homebrew specific: Add the library path to the foreign library directories
#+darwin(push #P"/opt/homebrew/opt/raylib/lib" cffi:*foreign-library-directories*)

(cffi:use-foreign-library raylib)

(cffi:defcstruct %color 
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(cffi:defcstruct %vector2
  (x :float)
  (y :float))

(cffi:defcfun ("InitWindow" init-window) :void
  (width :int)
  (height :int)
  (title :string))

(cffi:defcfun ("CloseWindow" close-window) :void)

(cffi:defcfun ("SetTargetFPS" set-target-fps) :void
  (fps :int))

(cffi:defcfun ("WindowShouldClose" window-should-close) :bool)

(cffi:defcfun ("BeginDrawing" begin-drawing) :void)
(cffi:defcfun ("EndDrawing" end-drawing) :void)

(cffi:defcfun ("ClearBackground" clear-background) :void
  (color (:struct %color)))

(cffi:defcfun ("DrawText" draw-text) :void
  (text :string)
  (x :int)
  (y :int)
  (font-size :int)
  (color (:struct %color)))

;; void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint); // Draw text using Font and pro parameters (rotation)

;; (cffi:defcfun ("DrawTextPro" draw-text-pro) :void
;;   (font (:pointer :void)) ; Assuming Font is a pointer type
;;   (text :string)
;;   (position (:struct %vector2)) ; Assuming Vector2 is defined elsewhere
;;   (origin (:struct %vector2)) ; Assuming Vector2 is defined elsewhere
;;   (rotation :float)
;;   (font-size :float)
;;   (spacing :float)
;;   (tint (:struct %color)))

(defstruct color-lisp 
  "A structure representing a color with red, green, blue, and alpha components."
  (r 0 :type (integer 0 255))
  (g 0 :type (integer 0 255))
  (b 0 :type (integer 0 255))
  (a 255 :type (integer 0 255)))
