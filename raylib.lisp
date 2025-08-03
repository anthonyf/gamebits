;; raylib.lisp
(uiop:define-package #:gamebits/raylib
  (:use #:cl)
  (:export #:%color #:%color-tclass #:r #:g #:b #:a
	   #:%vector2 #:%vector2-tclass #:x #:y
	   #:font
	   #:load-font
	   #:load-font-ex
	   #:unload-font
	   #:init-window
	   #:close-window
	   #:set-target-fps
	   #:window-should-close
	   #:begin-drawing
	   #:end-drawing
	   #:clear-background
	   #:draw-text
	   #:draw-text-pro
	   ))

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

;; typedef struct Texture {
;;     unsigned int id;        // OpenGL texture id
;;     int width;              // Texture base width
;;     int height;             // Texture base height
;;     int mipmaps;            // Mipmap levels, 1 by default
;;     int format;             // Data format (PixelFormat type)
;; } Texture;

(cffi:defcstruct %texture
  (id :uint)
  (width :int)
  (height :int)
  (mipmaps :int)
  (format :int))

(defclass texture ()
  ((id :initarg :id)
   (width :initarg :width)
   (height :initarg :height)
   (mipmaps :initarg :mipmaps)
   (format :initarg :format)))

(defmethod cffi:translate-into-foreign-memory 
    ((value texture)
     (type %texture-tclass)
     pointer)
  (cffi:with-foreign-slots ((id width height mipmaps format) pointer (:struct %texture))
    (with-slots ((texture-id id)
		 (texture-width width)
		 (texture-height height)
		 (texture-mipmaps mipmaps)
		 (texture-format format))
	value
      (setf id texture-id)
      (setf width texture-width)
      (setf height texture-height)
      (setf mipmaps texture-mipmaps)
      (setf format texture-format))))

(defmethod cffi:translate-from-foreign 
    (pointer (type %texture-tclass))
  (cffi:with-foreign-slots ((id width height mipmaps format) pointer (:struct %texture))
    (make-instance 'texture
		   :id id
		   :width width
		   :height height
		   :mipmaps mipmaps
		   :format format)))

;; typedef struct Font {
;;     int baseSize;           // Base size (default chars height)
;;     int glyphCount;         // Number of glyph characters
;;     int glyphPadding;       // Padding around the glyph characters
;;     Texture2D texture;      // Texture atlas containing the glyphs
;;     Rectangle *recs;        // Rectangles in texture for the glyphs
;;     GlyphInfo *glyphs;      // Glyphs info data
;; } Font;

(cffi:defcstruct %font 
  (base-size :int)
  (glyph-count :int)
  (glyph-padding :int)
  (texture (:struct %texture)) ; Assuming Texture is defined as %texture
  (recs (:pointer :void)) ; Assuming recs is a pointer to some structure
  (glyphs (:pointer :void))) ; Assuming glyphs is a pointer to some structure

(defclass font ()
  ((base-size :initarg :base-size :accessor base-size)
   (glyph-count :initarg :glyph-count :accessor glyph-count)
   (glyph-padding :initarg :glyph-padding :accessor glyph-padding)
   (texture :initarg :texture :accessor texture)
   (recs :initarg :recs :accessor recs)
   (glyphs :initarg :glyphs :accessor glyphs)))

(defmethod cffi:translate-into-foreign-memory
    ((value font)
     (type %font-tclass)
     pointer)
  (cffi:with-foreign-slots ((base-size glyph-count glyph-padding texture recs glyphs) pointer (:struct %font))
    (with-slots ((font-base-size base-size)
		 (font-glyph-count glyph-count)
		 (font-glyph-padding glyph-padding)
		 (font-texture texture)
		 (font-recs recs)
		 (font-glyphs glyphs))
	value
      (setf base-size font-base-size)
      (setf glyph-count font-glyph-count)
      (setf glyph-padding font-glyph-padding)
      (setf texture (cffi:convert-to-foreign font-texture '(:struct %texture))) ; Assuming texture is a Texture)))
      (setf recs font-recs)	  
      (setf glyphs font-glyphs))))

(defmethod cffi:translate-from-foreign 
    (pointer (type %font-tclass))
  (cffi:with-foreign-slots ((base-size glyph-count glyph-padding texture recs glyphs) pointer (:struct %font))
    (make-instance 'font
		   :base-size base-size
		   :glyph-count glyph-count
		   :glyph-padding glyph-padding
		   :texture (cffi:translate-from-foreign texture '(:struct %texture)) ; Assuming texture is a Texture)))
		   :recs recs
		   :glyphs glyphs)))

;; RLAPI Font LoadFont(const char *fileName);
(cffi:defcfun ("LoadFont" load-font) (:struct %font)
  (file-name :string))

;; Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointCount); // Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
(cffi:defcfun ("LoadFontEx" load-font-ex) (:struct %font)
  (file-name :string)
  (font-size :int)
  (codepoints (:pointer :int)) ; Assuming codepoints is a pointer to an array of integers
  (codepoint-count :int)) 

;; RLAPI void UnloadFont(Font font);
(cffi:defcfun ("UnloadFont" unload-font) :void
  (font (:struct %font)))

(cffi:defcfun ("DrawText" draw-text) :void
  (text :string)
  (x :int)
  (y :int)
  (font-size :int)
  (color (:struct %color)))

;; void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint); // Draw text using Font and pro parameters (rotation)

(cffi:defcfun ("DrawTextPro" draw-text-pro) :void
  (font (:struct %font)) ; Assuming Font is a pointer type
  (text :string)
  (position (:struct %vector2))
  (origin (:struct %vector2)) 
  (rotation :float)
  (font-size :float)
  (spacing :float)
  (tint (:struct %color)))

(defstruct color-lisp 
  "A structure representing a color with red, green, blue, and alpha components."
  (r 0 :type (integer 0 255))
  (g 0 :type (integer 0 255))
  (b 0 :type (integer 0 255))
  (a 255 :type (integer 0 255)))
