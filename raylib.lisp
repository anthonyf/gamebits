;; raylib.lisp
(uiop:define-package #:gamebits/raylib
  (:use #:cl)
  (:export #:color
	   #:make-color :color-r :color-g :color-b :color-a
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

(defstruct color r g b a)

(defmethod cffi:translate-into-foreign-memory (value color pointer)
  (cffi:with-foreign-slots ((r g b a) pointer (:struct %color))
    (setf r (color-r value))
    (setf g (color-g value))
    (setf b (color-b value))
    (setf a (color-a value))))

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

(defstruct color-lisp 
  "A structure representing a color with red, green, blue, and alpha components."
  (r 0 :type (integer 0 255))
  (g 0 :type (integer 0 255))
  (b 0 :type (integer 0 255))
  (a 255 :type (integer 0 255)))
