;; raylib.lisp
(uiop:define-package #:gamebits/raylib
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
	   
	   #:vector2 #:make-vector2 :vector2-x :vector2-y
	   
	   #:init-window
	   #:close-window
	   #:with-window
	   #:window-should-close

	   #:set-target-fps
	   #:get-fps
	   #:get-frame-time
	   	   
	   #:begin-drawing
	   #:end-drawing
	   #:with-drawing
	   
	   #:clear-background

	   #:font
	   #:load-font
	   #:load-font-ex
	   #:unload-font
	   #:with-font
	   
	   #:draw-text
	   #:draw-text-pro
	   #:measure-text-ex

	   #:get-mouse-position
	   #:is-mouse-button-down
	   #:is-mouse-button-up
	   #:is-mouse-button-pressed
	   #:is-mouse-button-released
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

(defmethod cffi:translate-into-foreign-memory
    ((value color)
     (type %color-tclass)
     pointer)
  (cffi:with-foreign-slots ((r g b a) pointer (:struct %color))
    (setf r (color-r value))
    (setf g (color-g value))
    (setf b (color-b value))
    (setf a (color-a value))))

(cffi:defcstruct %vector2
  (x :float)
  (y :float))

(defstruct vector2 (x :float) (y :float))

(defmethod cffi:translate-into-foreign-memory
    ((value vector2)
     (type %vector2-tclass)
     pointer)
  (cffi:with-foreign-slots ((x y) pointer (:struct %vector2))
    (setf x (float (vector2-x value)))
    (setf y (float (vector2-y value)))))

(defmethod cffi:translate-from-foreign
    (pointer (type %vector2-tclass))
  (cffi:with-foreign-slots ((x y) pointer (:struct %vector2))
    (make-vector2 :x x :y y)))


(cffi:defcfun ("InitWindow" init-window) :void
  (width :int)
  (height :int)
  (title :string))

(cffi:defcfun ("CloseWindow" close-window) :void)

(cffi:defcfun ("SetTargetFPS" set-target-fps) :void
  (fps :int))

;; int GetFPS(void);
(cffi:defcfun ("GetFPS" get-fps) :int)

;; float GetFrameTime(void);
(cffi:defcfun ("GetFrameTime" get-frame-time) :float)

(defmacro with-window ((width height title &key (fps 60)) &body body)
  `(progn
     (set-target-fps ,fps)
     (init-window ,width ,height ,title)
     (unwind-protect
	  (progn ,@body)
       (close-window))))

(cffi:defcfun ("WindowShouldClose" window-should-close) :bool)

(cffi:defcfun ("BeginDrawing" begin-drawing) :void)
(cffi:defcfun ("EndDrawing" end-drawing) :void)

(defmacro with-drawing (() &body body)
  `(progn
     (begin-drawing)
     (unwind-protect
	  (progn ,@body)
       (end-drawing))))

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
      (setf texture (cffi:convert-to-foreign font-texture '(:struct %texture)))
      (setf recs font-recs)	  
      (setf glyphs font-glyphs))))

(defmethod cffi:translate-from-foreign 
    (pointer (type %font-tclass))
  (cffi:with-foreign-slots ((base-size glyph-count glyph-padding texture recs glyphs) pointer (:struct %font))
    (make-instance 'font
		   :base-size base-size
		   :glyph-count glyph-count
		   :glyph-padding glyph-padding
		   :texture (cffi:translate-from-foreign texture '(:struct %texture))
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

(defmacro with-font ((font file-name size &key (codepoints (cffi:null-pointer)) (codepoint-count 0)) &body body)
  `(let ((,font (load-font-ex ,file-name ,size ,codepoints ,codepoint-count)))
     (unwind-protect
	  (progn ,@body)
       (unload-font ,font))))


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

;; Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);    // Measure string size for Font
(cffi:defcfun ("MeasureTextEx" measure-text-ex) (:struct %vector2)
  (font (:struct %font))
  (text :string)
  (font-size :float)
  (spacing :float))    

;; input

;; Vector2 GetMousePosition(void);
(cffi:defcfun ("GetMousePosition" get-mouse-position) (:struct %vector2))

;; bool IsMouseButtonDown(int button);
(cffi:defcfun ("IsMouseButtonDown" is-mouse-button-down) :bool
  (button :int))

;; bool IsMouseButtonPressed(int button);                  // Check if a mouse button has been pressed once
(cffi:defcfun ("IsMouseButtonPressed" is-mouse-button-pressed) :bool
  (button :int))

;; bool IsMouseButtonReleased(int button);                 // Check if a mouse button has been released once
(cffi:defcfun ("IsMouseButtonReleased" is-mouse-button-released) :bool
  (button :int))

;; bool IsMouseButtonUp(int button);                       // Check if a mouse button is NOT being pressed
(cffi:defcfun ("IsMouseButtonUp" is-mouse-button-up) :bool
  (button :int))


;; void DrawRectangleV(Vector2 position, Vector2 size, Color color);                                  // Draw a color-filled rectangle (Vector version)

(cffi:defcfun ("DrawRectangleV" draw-rectangle-v) :void
  (position (:struct %vector2))
  (size (:struct %vector2))
  (color (:struct %color)))

;; void DrawRectangleRec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle

#+nil(cffi:defcfun ("DrawRectangleRec" draw-rectangle-rec) :void
  (rec (:struct %rectangle)) ; Assuming Rectangle is defined as %rectangle
  (color (:struct %color)))

;; void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
;; void DrawRectangleGradientV(int posX, int posY, int width, int height, Color top, Color bottom);   // Draw a vertical-gradient-filled rectangle
;; void DrawRectangleGradientH(int posX, int posY, int width, int height, Color left, Color right);   // Draw a horizontal-gradient-filled rectangle
;; void DrawRectangleGradientEx(Rectangle rec, Color topLeft, Color bottomLeft, Color topRight, Color bottomRight); // Draw a gradient-filled rectangle with custom vertex colors
;; void DrawRectangleLines(int posX, int posY, int width, int height, Color color);                   // Draw rectangle outline
;; void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);                            // Draw rectangle outline with extended parameters
;; void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);              // Draw rectangle with rounded edges
;; void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, Color color);         // Draw rectangle lines with rounded edges
;; void DrawRectangleRoundedLinesEx(Rectangle rec, float roundness, int segments, float lineThick, Color color); // Draw rectangle with rounded edges outline
;; void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                // Draw a color-filled triangle (vertex in counter-clockwise order!)
;; void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline (vertex in counter-clockwise order!)
;; void DrawTriangleFan(const Vector2 *points, int pointCount, Color color);                          // Draw a triangle fan defined by points (first vertex is the center)
;; void DrawTriangleStrip(const Vector2 *points, int pointCount, Color color);                        // Draw a triangle strip defined by points
;; void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);               // Draw a regular polygon (Vector version)
;; void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides
;; void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color); // Draw a polygon outline of n sides with extended parameters
