;; raylib.lisp
(uiop:define-package #:gamebits/raylib
  (:use #:cl)
  (:export #:%color #:color #:make-color :color-r :color-g :color-b :color-a
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

	   #:get-color
	   
	   #:%vector #:vector2 #:make-vector2 :vector2-x :vector2-y

	   #:%rectangle #:rectangle #:make-rectangle :rectangle-x :rectangle-y
	   :rectangle-width :rectangle-height

	   #:%font #:font
	   #:get-font-default
	   #:load-font
	   #:load-font-ex
	   #:unload-font
	   #:with-font

	   #:make-camera2d
	   #:camera2d-offset
	   #:camera2d-target
	   #:camera2d-rotation
	   #:camera2d-zoom
	   
	   #:set-config-flags

	   #:is-key-pressed
	   #:is-key-pressed-repeat
	   #:is-key-down
	   #:is-key-released
	   #:is-key-up
	   #:get-key-pressed
	   #:get-char-pressed
	   #:get-key-name
	   #:set-exit-key
	   
	   
	   #:+FLAG-VSYNC-HINT+
	   #:+FLAG-FULLSCREEN-MODE+
	   #:+FLAG-WINDOW-RESIZABLE+
	   #:+FLAG-WINDOW-UNDECORATED+
	   #:+FLAG-WINDOW-HIDDEN+
	   #:+FLAG-WINDOW-MINIMIZED+
	   #:+FLAG-WINDOW-MAXIMIZED+
	   #:+FLAG-WINDOW-UNFOCUSED+
	   #:+FLAG-WINDOW-TOPMOST+
	   #:+FLAG-WINDOW-ALWAYS-RUN+
	   #:+FLAG-WINDOW-TRANSPARENT+
	   #:+FLAG-WINDOW-HIGHDPI+
	   #:+FLAG-WINDOW-MOUSE-PASSTHROUGH+
	   #:+FLAG-BORDERLESS-WINDOWED-MODE+
	   #:+FLAG-MSAA-4X-HINT+
	   #:+FLAG-INTERLACED-HINT+

	   #:+KEY-NULL+
	   #:+KEY-APOSTROPHE+
	   #:+KEY-COMMA+
	   #:+KEY-MINUS+
	   #:+KEY-PERIOD+
	   #:+KEY-SLASH+
	   #:+KEY-ZERO+
	   #:+KEY-ONE+
	   #:+KEY-TWO+
	   #:+KEY-THREE+
	   #:+KEY-FOUR+
	   #:+KEY-FIVE+
	   #:+KEY-SIX+
	   #:+KEY-SEVEN+
	   #:+KEY-EIGHT+
	   #:+KEY-NINE+
	   #:+KEY-SEMICOLON+
	   #:+KEY-EQUAL+
	   #:+KEY-A+
	   #:+KEY-B+
	   #:+KEY-C+
	   #:+KEY-D+
	   #:+KEY-E+
	   #:+KEY-F+
	   #:+KEY-G+
	   #:+KEY-H+
	   #:+KEY-I+
	   #:+KEY-J+
	   #:+KEY-K+
	   #:+KEY-L+
	   #:+KEY-M+
	   #:+KEY-N+
	   #:+KEY-O+
	   #:+KEY-P+
	   #:+KEY-Q+
	   #:+KEY-R+
	   #:+KEY-S+
	   #:+KEY-T+
	   #:+KEY-U+
	   #:+KEY-V+
	   #:+KEY-W+
	   #:+KEY-X+
	   #:+KEY-Y+
	   #:+KEY-Z+
	   #:+KEY-LEFT-BRACKET+
	   #:+KEY-BACKSLASH+
	   #:+KEY-RIGHT-BRACKET+
	   #:+KEY-GRAVE+
	   #:+KEY-SPACE+
	   #:+KEY-ESCAPE+
	   #:+KEY-ENTER+
	   #:+KEY-TAB+
	   #:+KEY-BACKSPACE+
	   #:+KEY-INSERT+
	   #:+KEY-DELETE+
	   #:+KEY-RIGHT+
	   #:+KEY-LEFT+
	   #:+KEY-DOWN+
	   #:+KEY-UP+
	   #:+KEY-PAGE-UP+
	   #:+KEY-PAGE-DOWN+
	   #:+KEY-HOME+
	   #:+KEY-END+
	   #:+KEY-CAPS-LOCK+
	   #:+KEY-SCROLL-LOCK+
	   #:+KEY-NUM-LOCK+
	   #:+KEY-PRINT-SCREEN+
	   #:+KEY-PAUSE+
	   #:+KEY-F1+
	   #:+KEY-F2+
	   #:+KEY-F3+
	   #:+KEY-F4+
	   #:+KEY-F5+
	   #:+KEY-F6+
	   #:+KEY-F7+
	   #:+KEY-F8+
	   #:+KEY-F9+
	   #:+KEY-F10+
	   #:+KEY-F11+
	   #:+KEY-F12+
	   #:+KEY-LEFT-SHIFT+
	   #:+KEY-LEFT-CONTROL+
	   #:+KEY-LEFT-ALT+
	   #:+KEY-LEFT-SUPER+
	   #:+KEY-RIGHT-SHIFT+
	   #:+KEY-RIGHT-CONTROL+
	   #:+KEY-RIGHT-ALT+
	   #:+KEY-RIGHT-SUPER+
	   #:+KEY-KB-MENU+
	   #:+KEY-KP-0+
	   #:+KEY-KP-1+
	   #:+KEY-KP-2+
	   #:+KEY-KP-3+
	   #:+KEY-KP-4+
	   #:+KEY-KP-5+
	   #:+KEY-KP-6+
	   #:+KEY-KP-7+
	   #:+KEY-KP-8+
	   #:+KEY-KP-9+
	   #:+KEY-KP-DECIMAL+
	   #:+KEY-KP-DIVIDE+
	   #:+KEY-KP-MULTIPLY+
	   #:+KEY-KP-SUBTRACT+
	   #:+KEY-KP-ADD+
	   #:+KEY-KP-ENTER+
	   #:+KEY-KP-EQUAL+
	   #:+KEY-BACK+
	   #:+KEY-MENU+
	   #:+KEY-VOLUME-UP+
	   #:+KEY-VOLUME-DOWN+

	   #:+MOUSE-BUTTON-LEFT+   ; Mouse button left
	   #:+MOUSE-BUTTON-RIGHT+  ; Mouse button right
	   #:+MOUSE-BUTTON-MIDDLE+ ; Mouse button middle (pressed wheel)
	   #:+MOUSE-BUTTON-SIDE+   ; Mouse button side (advanced mouse device)
	   #:+MOUSE-BUTTON-EXTRA+  ; Mouse button extra (advanced mouse device)
	   #:+MOUSE-BUTTON-FORWARD+ ; Mouse button forward (advanced mouse device)
	   #:+MOUSE-BUTTON-BACK+    ; Mouse button back (advanced mouse device)

	   #:init-window
	   #:close-window
	   #:with-window
	   #:get-screen-width
	   #:get-screen-height
	   #:window-should-close

	   #:set-target-fps
	   #:get-fps
	   #:get-frame-time
	   	   
	   #:begin-drawing
	   #:end-drawing
	   #:with-drawing

	   #:clear-background

	   #:begin-mode-2d
	   #:end-mode-2d
	   #:with-mode-2d
	   	   
	   #:draw-text
	   #:draw-text-pro
	   #:measure-text-ex

	   #:get-mouse-position
	   #:is-mouse-button-down
	   #:is-mouse-button-up
	   #:is-mouse-button-pressed
	   #:is-mouse-button-released

	   #:draw-line
	   #:draw-line-ex
	   #:draw-circle
	   #:draw-circle-v
	   #:draw-rectangle-v
	   #:draw-rectangle-rec
	   #:draw-triangle
	   #:draw-triangle-lines
	   
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


;; /**********************************************************************************************
;; *
;; *   raylib v5.6-dev - A simple and easy-to-use library to enjoy videogames programming (www.raylib.com)
;; *
;; *   FEATURES:
;; *       - NO external dependencies, all required libraries included with raylib
;; *       - Multiplatform: Windows, Linux, FreeBSD, OpenBSD, NetBSD, DragonFly,
;; *                        MacOS, Haiku, Android, Raspberry Pi, DRM native, HTML5.
;; *       - Written in plain C code (C99) in PascalCase/camelCase notation
;; *       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3, 4.3, ES2, ES3 - choose at compile)
;; *       - Unique OpenGL abstraction layer (usable as standalone module): [rlgl]
;; *       - Multiple Fonts formats supported (TTF, OTF, FNT, BDF, Sprite fonts)
;; *       - Outstanding texture formats support, including compressed formats (DXT, ETC, ASTC)
;; *       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
;; *       - Flexible Materials system, supporting classic maps and PBR maps
;; *       - Animated 3D models supported (skeletal bones animation) (IQM, M3D, GLTF)
;; *       - Shaders support, including Model shaders and Postprocessing shaders
;; *       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
;; *       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, QOA, XM, MOD)
;; *       - VR stereo rendering with configurable HMD device parameters
;; *       - Bindings to multiple programming languages available!
;; *
;; *   NOTES:
;; *       - One default Font is loaded on InitWindow()->LoadFontDefault() [core, text]
;; *       - One default Texture2D is loaded on rlglInit(), 1x1 white pixel R8G8B8A8 [rlgl] (OpenGL 3.3 or ES2)
;; *       - One default Shader is loaded on rlglInit()->rlLoadShaderDefault() [rlgl] (OpenGL 3.3 or ES2)
;; *       - One default RenderBatch is loaded on rlglInit()->rlLoadRenderBatch() [rlgl] (OpenGL 3.3 or ES2)
;; *
;; *   DEPENDENCIES (included):
;; *       [rcore][GLFW] rglfw (Camilla Löwy - github.com/glfw/glfw) for window/context management and input
;; *       [rcore][RGFW] rgfw (ColleagueRiley - github.com/ColleagueRiley/RGFW) for window/context management and input
;; *       [rlgl] glad/glad_gles2 (David Herberth - github.com/Dav1dde/glad) for OpenGL 3.3 extensions loading
;; *       [raudio] miniaudio (David Reid - github.com/mackron/miniaudio) for audio device/context management
;; *
;; *   OPTIONAL DEPENDENCIES (included):
;; *       [rcore] msf_gif (Miles Fogle) for GIF recording
;; *       [rcore] sinfl (Micha Mettke) for DEFLATE decompression algorithm
;; *       [rcore] sdefl (Micha Mettke) for DEFLATE compression algorithm
;; *       [rcore] rprand (Ramon Snatamaria) for pseudo-random numbers generation
;; *       [rtextures] qoi (Dominic Szablewski - https://phoboslab.org) for QOI image manage
;; *       [rtextures] stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...)
;; *       [rtextures] stb_image_write (Sean Barret) for image writing (BMP, TGA, PNG, JPG)
;; *       [rtextures] stb_image_resize2 (Sean Barret) for image resizing algorithms
;; *       [rtextures] stb_perlin (Sean Barret) for Perlin Noise image generation
;; *       [rtext] stb_truetype (Sean Barret) for ttf fonts loading
;; *       [rtext] stb_rect_pack (Sean Barret) for rectangles packing
;; *       [rmodels] par_shapes (Philip Rideout) for parametric 3d shapes generation
;; *       [rmodels] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
;; *       [rmodels] cgltf (Johannes Kuhlmann) for models loading (glTF)
;; *       [rmodels] m3d (bzt) for models loading (M3D, https://bztsrc.gitlab.io/model3d)
;; *       [rmodels] vox_loader (Johann Nadalutti) for models loading (VOX)
;; *       [raudio] dr_wav (David Reid) for WAV audio file loading
;; *       [raudio] dr_flac (David Reid) for FLAC audio file loading
;; *       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
;; *       [raudio] stb_vorbis (Sean Barret) for OGG audio loading
;; *       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
;; *       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading
;; *       [raudio] qoa (Dominic Szablewski - https://phoboslab.org) for QOA audio manage
;; *
;; *
;; *   LICENSE: zlib/libpng
;; *
;; *   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;; *   BSD-like license that allows static linking with closed source software:
;; *
;; *   Copyright (c) 2013-2025 Ramon Santamaria (@raysan5)
;; *
;; *   This software is provided "as-is", without any express or implied warranty. In no event
;; *   will the authors be held liable for any damages arising from the use of this software.
;; *
;; *   Permission is granted to anyone to use this software for any purpose, including commercial
;; *   applications, and to alter it and redistribute it freely, subject to the following restrictions:
;; *
;; *     1. The origin of this software must not be misrepresented; you must not claim that you
;; *     wrote the original software. If you use this software in a product, an acknowledgment
;; *     in the product documentation would be appreciated but is not required.
;; *
;; *     2. Altered source versions must be plainly marked as such, and must not be misrepresented
;; *     as being the original software.
;; *
;; *     3. This notice may not be removed or altered from any source distribution.
;; *
;; **********************************************************************************************/

;; #ifndef RAYLIB_H
;; #define RAYLIB_H

;; #include <stdarg.h>     // Required for: va_list - Only used by TraceLogCallback

;; #define RAYLIB_VERSION_MAJOR 5
;; #define RAYLIB_VERSION_MINOR 6
;; #define RAYLIB_VERSION_PATCH 0
;; #define RAYLIB_VERSION  "5.6-dev"

;; // Function specifiers in case library is build/used as a shared library
;; // NOTE: Microsoft specifiers to tell compiler that symbols are imported/exported from a .dll
;; // NOTE: visibility("default") attribute makes symbols "visible" when compiled with -fvisibility=hidden
;; #if defined(_WIN32)
;;     #if defined(__TINYC__)
;;         #define __declspec(x) __attribute__((x))
;;     #endif
;;     #if defined(BUILD_LIBTYPE_SHARED)
;;         #define RLAPI __declspec(dllexport)     // We are building the library as a Win32 shared library (.dll)
;;     #elif defined(USE_LIBTYPE_SHARED)
;;         #define RLAPI __declspec(dllimport)     // We are using the library as a Win32 shared library (.dll)
;;     #endif
;; #else
;;     #if defined(BUILD_LIBTYPE_SHARED)
;;         #define RLAPI __attribute__((visibility("default"))) // We are building as a Unix shared library (.so/.dylib)
;;     #endif
;; #endif

;; #ifndef RLAPI
;;     #define RLAPI       // Functions defined as 'extern' by default (implicit specifiers)
;; #endif

;; //----------------------------------------------------------------------------------
;; // Some basic Defines
;; //----------------------------------------------------------------------------------
;; #ifndef PI
;;     #define PI 3.14159265358979323846f
;; #endif
;; #ifndef DEG2RAD
;;     #define DEG2RAD (PI/180.0f)
;; #endif
;; #ifndef RAD2DEG
;;     #define RAD2DEG (180.0f/PI)
;; #endif

;; // Allow custom memory allocators
;; // NOTE: Require recompiling raylib sources
;; #ifndef RL_MALLOC
;;     #define RL_MALLOC(sz)       malloc(sz)
;; #endif
;; #ifndef RL_CALLOC
;;     #define RL_CALLOC(n,sz)     calloc(n,sz)
;; #endif
;; #ifndef RL_REALLOC
;;     #define RL_REALLOC(ptr,sz)  realloc(ptr,sz)
;; #endif
;; #ifndef RL_FREE
;;     #define RL_FREE(ptr)        free(ptr)
;; #endif

;; // NOTE: MSVC C++ compiler does not support compound literals (C99 feature)
;; // Plain structures in C++ (without constructors) can be initialized with { }
;; // This is called aggregate initialization (C++11 feature)
;; #if defined(__cplusplus)
;;     #define CLITERAL(type)      type
;; #else
;;     #define CLITERAL(type)      (type)
;; #endif

;; // Some compilers (mostly macos clang) default to C++98,
;; // where aggregate initialization can't be used
;; // So, give a more clear error stating how to fix this
;; #if !defined(_MSC_VER) && (defined(__cplusplus) && __cplusplus < 201103L)
;;     #error "C++11 or later is required. Add -std=c++11"
;; #endif

;; // NOTE: We set some defines with some data types declared by raylib
;; // Other modules (raymath, rlgl) also require some of those types, so,
;; // to be able to use those other modules as standalone (not depending on raylib)
;; // this defines are very useful for internal check and avoid type (re)definitions
;; #define RL_COLOR_TYPE
;; #define RL_RECTANGLE_TYPE
;; #define RL_VECTOR2_TYPE
;; #define RL_VECTOR3_TYPE
;; #define RL_VECTOR4_TYPE
;; #define RL_QUATERNION_TYPE
;; #define RL_MATRIX_TYPE

;; // Some Basic Colors
(defstruct color (r :int) (g :int) (b :int) (a :int))

;; // NOTE: Custom raylib color palette for amazing visuals on WHITE background
;; #define LIGHTGRAY  CLITERAL(Color){ 200, 200, 200, 255 }   // Light Gray
(defparameter +lightgray+ (make-color :r 200 :g 200 :b 200 :a 255))

;; #define GRAY       CLITERAL(Color){ 130, 130, 130, 255 }   // Gray
(defparameter +gray+ (make-color :r 130 :g 130 :b 130 :a 255))

;; #define DARKGRAY   CLITERAL(Color){ 80, 80, 80, 255 }      // Dark Gray
(defparameter +darkgray+ (make-color :r 80 :g 80 :b 80 :a 255))

;; #define YELLOW     CLITERAL(Color){ 253, 249, 0, 255 }     // Yellow
(defparameter +yellow+ (make-color :r 253 :g 249 :b 0 :a 255))

;; #define GOLD       CLITERAL(Color){ 255, 203, 0, 255 }     // Gold
(defparameter +gold+ (make-color :r 255 :g 203 :b 0 :a 255))

;; #define ORANGE     CLITERAL(Color){ 255, 161, 0, 255 }     // Orange
(defparameter +orange+ (make-color :r 255 :g 161 :b 0 :a 255))

;; #define PINK       CLITERAL(Color){ 255, 109, 194, 255 }   // Pink
(defparameter +pink+ (make-color :r 255 :g 109 :b 194 :a 255))

;; #define RED        CLITERAL(Color){ 230, 41, 55, 255 }     // Red
(defparameter +red+ (make-color :r 230 :g 41 :b 55 :a 255))

;; #define MAROON     CLITERAL(Color){ 190, 33, 55, 255 }     // Maroon
(defparameter +maroon+ (make-color :r 190 :g 33 :b 55 :a 255))

;; #define GREEN      CLITERAL(Color){ 0, 228, 48, 255 }      // Green
(defparameter +green+ (make-color :r 0 :g 228 :b 48 :a 255))

;; #define LIME       CLITERAL(Color){ 0, 158, 47, 255 }      // Lime
(defparameter +lime+ (make-color :r 0 :g 158 :b 47 :a 255))

;; #define DARKGREEN  CLITERAL(Color){ 0, 117, 44, 255 }      // Dark Green
(defparameter +darkgreen+ (make-color :r 0 :g 117 :b 44 :a 255))

;; #define SKYBLUE    CLITERAL(Color){ 102, 191, 255, 255 }   // Sky Blue
(defparameter +skyblue+ (make-color :r 102 :g 191 :b 255 :a 255))

;; #define BLUE       CLITERAL(Color){ 0, 121, 241, 255 }     // Blue
(defparameter +blue+ (make-color :r 0 :g 121 :b 241 :a 255))

;; #define DARKBLUE   CLITERAL(Color){ 0, 82, 172, 255 }      // Dark Blue
(defparameter +darkblue+ (make-color :r 0 :g 82 :b 172 :a 255))

;; #define PURPLE     CLITERAL(Color){ 200, 122, 255, 255 }   // Purple
(defparameter +purple+ (make-color :r 200 :g 122 :b 255 :a 255))

;; #define VIOLET     CLITERAL(Color){ 135, 60, 190, 255 }    // Violet
(defparameter +violet+ (make-color :r 135 :g 60 :b 190 :a 255))

;; #define DARKPURPLE CLITERAL(Color){ 112, 31, 126, 255 }    // Dark Purple
(defparameter +darkpurple+ (make-color :r 112 :g 31 :b 126 :a 255))

;; #define BEIGE      CLITERAL(Color){ 211, 176, 131, 255 }   // Beige
(defparameter +beige+ (make-color :r 211 :g 176 :b 131 :a 255))

;; #define BROWN      CLITERAL(Color){ 127, 106, 79, 255 }    // Brown
(defparameter +brown+ (make-color :r 127 :g 106 :b 79 :a 255))

;; #define DARKBROWN  CLITERAL(Color){ 76, 63, 47, 255 }      // Dark Brown
(defparameter +darkbrown+ (make-color :r 76 :g 63 :b 47 :a 255))

;; #define WHITE      CLITERAL(Color){ 255, 255, 255, 255 }   // White
(defparameter +white+ (make-color :r 255 :g 255 :b 255 :a 255))

;; #define BLACK      CLITERAL(Color){ 0, 0, 0, 255 }         // Black
(defparameter +black+ (make-color :r 0 :g 0 :b 0 :a 255))

;; #define BLANK      CLITERAL(Color){ 0, 0, 0, 0 }           // Blank (Transparent)
(defparameter +blank+ (make-color :r 0 :g 0 :b 0 :a 0))

;; #define MAGENTA    CLITERAL(Color){ 255, 0, 255, 255 }     // Magenta
(defparameter +magenta+ (make-color :r 255 :g 0 :b 255 :a 255))

;; #define RAYWHITE   CLITERAL(Color){ 245, 245, 245, 255 }   // My own White (raylib logo)
(defparameter +raywhite+ (make-color :r 245 :g 245 :b 245 :a 255))

;; //----------------------------------------------------------------------------------
;; // Structures Definition
;; //----------------------------------------------------------------------------------
;; // Boolean type
;; #if (defined(__STDC__) && __STDC_VERSION__ >= 199901L) || (defined(_MSC_VER) && _MSC_VER >= 1800)
;;     #include <stdbool.h>
;; #elif !defined(__cplusplus) && !defined(bool)
;;     typedef enum bool { false = 0, true = !false } bool;
;;     #define RL_BOOL_TYPE
;; #endif

;; // Vector2, 2 components
;; typedef struct Vector2 {
;;     float x;                // Vector x component
;;     float y;                // Vector y component
;; } Vector2;

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

;; // Vector3, 3 components
;; typedef struct Vector3 {
;;     float x;                // Vector x component
;;     float y;                // Vector y component
;;     float z;                // Vector z component
;; } Vector3;

;; // Vector4, 4 components
;; typedef struct Vector4 {
;;     float x;                // Vector x component
;;     float y;                // Vector y component
;;     float z;                // Vector z component
;;     float w;                // Vector w component
;; } Vector4;

;; // Quaternion, 4 components (Vector4 alias)
;; typedef Vector4 Quaternion;

;; // Matrix, 4x4 components, column major, OpenGL style, right-handed
;; typedef struct Matrix {
;;     float m0, m4, m8, m12;  // Matrix first row (4 components)
;;     float m1, m5, m9, m13;  // Matrix second row (4 components)
;;     float m2, m6, m10, m14; // Matrix third row (4 components)
;;     float m3, m7, m11, m15; // Matrix fourth row (4 components)
;; } Matrix;

;; // Color, 4 components, R8G8B8A8 (32bit)
;; typedef struct Color {
;;     unsigned char r;        // Color red value
;;     unsigned char g;        // Color green value
;;     unsigned char b;        // Color blue value
;;     unsigned char a;        // Color alpha value
;; } Color;

(cffi:defcstruct %color 
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defmethod cffi:translate-into-foreign-memory
    ((value color)
     (type %color-tclass)
     pointer)
  (cffi:with-foreign-slots ((r g b a) pointer (:struct %color))
    (setf r (color-r value))
    (setf g (color-g value))
    (setf b (color-b value))
    (setf a (color-a value))))

;; // Rectangle, 4 components
;; typedef struct Rectangle {
;;     float x;                // Rectangle top-left corner position x
;;     float y;                // Rectangle top-left corner position y
;;     float width;            // Rectangle width
;;     float height;           // Rectangle height
;; } Rectangle;

(cffi:defcstruct %rectangle
  (x :float)
  (y :float)
  (width :float)
  (height :float))

(defstruct rectangle (x :float) (y :float) (width :float) (height :float))

(defmethod cffi:translate-into-foreign-memory
    ((value rectangle)
     (type %rectangle-tclass)
     pointer)
  (cffi:with-foreign-slots ((x y width height) pointer (:struct %rectangle))
    (setf x (float (rectangle-x value)))
    (setf y (float (rectangle-y value)))
    (setf width (float (rectangle-width value)))
    (setf height (float (rectangle-height value)))))

(defmethod cffi:translate-from-foreign 
    (pointer (type %rectangle-tclass))
  (cffi:with-foreign-slots ((x y width height) pointer (:struct %rectangle))
    (make-rectangle :x x :y y :width width :height height)))


;; // Image, pixel data stored in CPU memory (RAM)
;; typedef struct Image {
;;     void *data;             // Image raw data
;;     int width;              // Image base width
;;     int height;             // Image base height
;;     int mipmaps;            // Mipmap levels, 1 by default
;;     int format;             // Data format (PixelFormat type)
;; } Image;
(cffi:defcstruct %image
  (data :pointer)          ; Pointer to raw data
  (width :int)            ; Image base width
  (height :int)           ; Image base height
  (mipmaps :int)          ; Mipmap levels, 1 by default
  (format :int))          ; Data format (PixelFormat type)

;; // Texture, tex data stored in GPU memory (VRAM)
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

;; // Texture2D, same as Texture
;; typedef Texture Texture2D;

;; // TextureCubemap, same as Texture
;; typedef Texture TextureCubemap;

;; // RenderTexture, fbo for texture rendering
;; typedef struct RenderTexture {
;;     unsigned int id;        // OpenGL framebuffer object id
;;     Texture texture;        // Color buffer attachment texture
;;     Texture depth;          // Depth buffer attachment texture
;; } RenderTexture;

;; // RenderTexture2D, same as RenderTexture
;; typedef RenderTexture RenderTexture2D;

;; // NPatchInfo, n-patch layout info
;; typedef struct NPatchInfo {
;;     Rectangle source;       // Texture source rectangle
;;     int left;               // Left border offset
;;     int top;                // Top border offset
;;     int right;              // Right border offset
;;     int bottom;             // Bottom border offset
;;     int layout;             // Layout of the n-patch: 3x3, 1x3 or 3x1
;; } NPatchInfo;

;; // GlyphInfo, font characters glyphs info
;; typedef struct GlyphInfo {
;;     int value;              // Character value (Unicode)
;;     int offsetX;            // Character offset X when drawing
;;     int offsetY;            // Character offset Y when drawing
;;     int advanceX;           // Character advance position X
;;     Image image;            // Character image data
;; } GlyphInfo;
(cffi:defcstruct %glyph-info
  (value :int)            ; Character value (Unicode)
  (offset-x :int)         ; Character offset X when drawing
  (offset-y :int)         ; Character offset Y when drawing
  (advance-x :int)        ; Character advance position X
  (image (:struct %image))) ; Character image data

;; // Font, font texture and GlyphInfo array data
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
  (recs :pointer) ; Assuming recs is a pointer to some structure
  (glyphs (:pointer (:struct %glyph-info)))) ; Assuming glyphs is a pointer to some structure

(defclass font ()
  ((base-size :initarg :base-size :accessor base-size)
   (glyph-count :initarg :glyph-count :accessor glyph-count)
   (glyph-padding :initarg :glyph-padding :accessor glyph-padding)
   (texture :initarg :texture :accessor texture :type texture)
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
      ;;(cffi:convert-into-foreign-memory font-texture '(:struct %texture) (cffi:foreign-slot-pointer pointer '(:struct %font) 'texture))
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


;; // Camera, defines position/orientation in 3d space
;; typedef struct Camera3D {
;;     Vector3 position;       // Camera position
;;     Vector3 target;         // Camera target it looks-at
;;     Vector3 up;             // Camera up vector (rotation over its axis)
;;     float fovy;             // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
;;     int projection;         // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
;; } Camera3D;

;; typedef Camera3D Camera;    // Camera type fallback, defaults to Camera3D

;; // Camera2D, defines position/orientation in 2d space
;; typedef struct Camera2D {
;;     Vector2 offset;         // Camera offset (displacement from target)
;;     Vector2 target;         // Camera target (rotation and zoom origin)
;;     float rotation;         // Camera rotation in degrees
;;     float zoom;             // Camera zoom (scaling), should be 1.0f by default
;; } Camera2D;
(cffi:defcstruct %camera2d
  (offset (:struct %vector2))   ; Camera offset (displacement from target)
  (target (:struct %vector2))   ; Camera target (rotation and zoom origin)
  (rotation :float)             ; Camera rotation in degrees
  (zoom :float))                ; Camera zoom (scaling), should be 1.0f by default

(defstruct camera2d 
  (offset (make-vector2 :x 0.0 :y 0.0)) ; Camera offset (displacement from target)
  (target (make-vector2 :x 0.0 :y 0.0)) ; Camera target (rotation and zoom origin)
  (rotation 0.0)                     ; Camera rotation in degrees
  (zoom 1.0))                         ; Camera zoom (scaling), should be 1.0f by default

(defmethod cffi:translate-into-foreign-memory
	((value camera2d)
	 (type %camera2d-tclass)
	 pointer)
  (cffi:with-foreign-slots ((offset target rotation zoom) pointer (:struct %camera2d))
	(setf offset (cffi:convert-to-foreign (camera2d-offset value) '(:struct %vector2)))
	(setf target (cffi:convert-to-foreign (camera2d-target value) '(:struct %vector2)))
	(setf rotation (float (camera2d-rotation value)))
	(setf zoom (float (camera2d-zoom value)))))

;; // Mesh, vertex data and vao/vbo
;; typedef struct Mesh {
;;     int vertexCount;        // Number of vertices stored in arrays
;;     int triangleCount;      // Number of triangles stored (indexed or not)

;;     // Vertex attributes data
;;     float *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
;;     float *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
;;     float *texcoords2;      // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
;;     float *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
;;     float *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
;;     unsigned char *colors;      // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
;;     unsigned short *indices;    // Vertex indices (in case vertex data comes indexed)

;;     // Animation vertex data
;;     float *animVertices;    // Animated vertex positions (after bones transformations)
;;     float *animNormals;     // Animated normals (after bones transformations)
;;     unsigned char *boneIds; // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning) (shader-location = 6)
;;     float *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
;;     Matrix *boneMatrices;   // Bones animated transformation matrices
;;     int boneCount;          // Number of bones

;;     // OpenGL identifiers
;;     unsigned int vaoId;     // OpenGL Vertex Array Object id
;;     unsigned int *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
;; } Mesh;

;; // Shader
;; typedef struct Shader {
;;     unsigned int id;        // Shader program id
;;     int *locs;              // Shader locations array (RL_MAX_SHADER_LOCATIONS)
;; } Shader;

;; // MaterialMap
;; typedef struct MaterialMap {
;;     Texture2D texture;      // Material map texture
;;     Color color;            // Material map color
;;     float value;            // Material map value
;; } MaterialMap;

;; // Material, includes shader and maps
;; typedef struct Material {
;;     Shader shader;          // Material shader
;;     MaterialMap *maps;      // Material maps array (MAX_MATERIAL_MAPS)
;;     float params[4];        // Material generic parameters (if required)
;; } Material;

;; // Transform, vertex transformation data
;; typedef struct Transform {
;;     Vector3 translation;    // Translation
;;     Quaternion rotation;    // Rotation
;;     Vector3 scale;          // Scale
;; } Transform;

;; // Bone, skeletal animation bone
;; typedef struct BoneInfo {
;;     char name[32];          // Bone name
;;     int parent;             // Bone parent
;; } BoneInfo;

;; // Model, meshes, materials and animation data
;; typedef struct Model {
;;     Matrix transform;       // Local transform matrix

;;     int meshCount;          // Number of meshes
;;     int materialCount;      // Number of materials
;;     Mesh *meshes;           // Meshes array
;;     Material *materials;    // Materials array
;;     int *meshMaterial;      // Mesh material number

;;     // Animation data
;;     int boneCount;          // Number of bones
;;     BoneInfo *bones;        // Bones information (skeleton)
;;     Transform *bindPose;    // Bones base transformation (pose)
;; } Model;

;; // ModelAnimation
;; typedef struct ModelAnimation {
;;     int boneCount;          // Number of bones
;;     int frameCount;         // Number of animation frames
;;     BoneInfo *bones;        // Bones information (skeleton)
;;     Transform **framePoses; // Poses array by frame
;;     char name[32];          // Animation name
;; } ModelAnimation;

;; // Ray, ray for raycasting
;; typedef struct Ray {
;;     Vector3 position;       // Ray position (origin)
;;     Vector3 direction;      // Ray direction (normalized)
;; } Ray;

;; // RayCollision, ray hit information
;; typedef struct RayCollision {
;;     bool hit;               // Did the ray hit something?
;;     float distance;         // Distance to the nearest hit
;;     Vector3 point;          // Point of the nearest hit
;;     Vector3 normal;         // Surface normal of hit
;; } RayCollision;

;; // BoundingBox
;; typedef struct BoundingBox {
;;     Vector3 min;            // Minimum vertex box-corner
;;     Vector3 max;            // Maximum vertex box-corner
;; } BoundingBox;

;; // Wave, audio wave data
;; typedef struct Wave {
;;     unsigned int frameCount;    // Total number of frames (considering channels)
;;     unsigned int sampleRate;    // Frequency (samples per second)
;;     unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
;;     unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
;;     void *data;                 // Buffer data pointer
;; } Wave;

;; // Opaque structs declaration
;; // NOTE: Actual structs are defined internally in raudio module
;; typedef struct rAudioBuffer rAudioBuffer;
;; typedef struct rAudioProcessor rAudioProcessor;

;; // AudioStream, custom audio stream
;; typedef struct AudioStream {
;;     rAudioBuffer *buffer;       // Pointer to internal data used by the audio system
;;     rAudioProcessor *processor; // Pointer to internal data processor, useful for audio effects

;;     unsigned int sampleRate;    // Frequency (samples per second)
;;     unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
;;     unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
;; } AudioStream;

;; // Sound
;; typedef struct Sound {
;;     AudioStream stream;         // Audio stream
;;     unsigned int frameCount;    // Total number of frames (considering channels)
;; } Sound;

;; // Music, audio stream, anything longer than ~10 seconds should be streamed
;; typedef struct Music {
;;     AudioStream stream;         // Audio stream
;;     unsigned int frameCount;    // Total number of frames (considering channels)
;;     bool looping;               // Music looping enable

;;     int ctxType;                // Type of music context (audio filetype)
;;     void *ctxData;              // Audio context data, depends on type
;; } Music;

;; // VrDeviceInfo, Head-Mounted-Display device parameters
;; typedef struct VrDeviceInfo {
;;     int hResolution;                // Horizontal resolution in pixels
;;     int vResolution;                // Vertical resolution in pixels
;;     float hScreenSize;              // Horizontal size in meters
;;     float vScreenSize;              // Vertical size in meters
;;     float eyeToScreenDistance;      // Distance between eye and display in meters
;;     float lensSeparationDistance;   // Lens separation distance in meters
;;     float interpupillaryDistance;   // IPD (distance between pupils) in meters
;;     float lensDistortionValues[4];  // Lens distortion constant parameters
;;     float chromaAbCorrection[4];    // Chromatic aberration correction parameters
;; } VrDeviceInfo;

;; // VrStereoConfig, VR stereo rendering configuration for simulator
;; typedef struct VrStereoConfig {
;;     Matrix projection[2];           // VR projection matrices (per eye)
;;     Matrix viewOffset[2];           // VR view offset matrices (per eye)
;;     float leftLensCenter[2];        // VR left lens center
;;     float rightLensCenter[2];       // VR right lens center
;;     float leftScreenCenter[2];      // VR left screen center
;;     float rightScreenCenter[2];     // VR right screen center
;;     float scale[2];                 // VR distortion scale
;;     float scaleIn[2];               // VR distortion scale in
;; } VrStereoConfig;

;; // File path list
;; typedef struct FilePathList {
;;     unsigned int capacity;          // Filepaths max entries
;;     unsigned int count;             // Filepaths entries count
;;     char **paths;                   // Filepaths entries
;; } FilePathList;

;; // Automation event
;; typedef struct AutomationEvent {
;;     unsigned int frame;             // Event frame
;;     unsigned int type;              // Event type (AutomationEventType)
;;     int params[4];                  // Event parameters (if required)
;; } AutomationEvent;

;; // Automation event list
;; typedef struct AutomationEventList {
;;     unsigned int capacity;          // Events max entries (MAX_AUTOMATION_EVENTS)
;;     unsigned int count;             // Events entries count
;;     AutomationEvent *events;        // Events entries
;; } AutomationEventList;

;; //----------------------------------------------------------------------------------
;; // Enumerators Definition
;; //----------------------------------------------------------------------------------
;; // System/Window config flags
;; // NOTE: Every bit registers one state (use it with bit masks)
;; // By default all flags are set to 0
;; typedef enum {
;;     FLAG_VSYNC_HINT         = 0x00000040,   // Set to try enabling V-Sync on GPU
(defparameter +FLAG-VSYNC-HINT+          #x00000040)

;;     FLAG_FULLSCREEN_MODE    = 0x00000002,   // Set to run program in fullscreen
(defparameter +FLAG-FULLSCREEN-MODE+     #x00000002)

;;     FLAG_WINDOW_RESIZABLE   = 0x00000004,   // Set to allow resizable window
(defparameter +FLAG-WINDOW-RESIZABLE+    #x00000004)

;;     FLAG_WINDOW_UNDECORATED = 0x00000008,   // Set to disable window decoration (frame and buttons)
(defparameter +FLAG-WINDOW-UNDECORATED+  #x00000008)

;;     FLAG_WINDOW_HIDDEN      = 0x00000080,   // Set to hide window
(defparameter +FLAG-WINDOW-HIDDEN+       #x00000080)

;;     FLAG_WINDOW_MINIMIZED   = 0x00000200,   // Set to minimize window (iconify)
(defparameter +FLAG-WINDOW-MINIMIZED+    #x00000200)

;;     FLAG_WINDOW_MAXIMIZED   = 0x00000400,   // Set to maximize window (expanded to monitor)
(defparameter +FLAG-WINDOW-MAXIMIZED+    #x00000400)

;;     FLAG_WINDOW_UNFOCUSED   = 0x00000800,   // Set to window non focused
(defparameter +FLAG-WINDOW-UNFOCUSED+    #x00000800)

;;     FLAG_WINDOW_TOPMOST     = 0x00001000,   // Set to window always on top
(defparameter +FLAG-WINDOW-TOPMOST+      #x00001000)

;;     FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   // Set to allow windows running while minimized
(defparameter +FLAG-WINDOW-ALWAYS-RUN+   #x00000100)

;;     FLAG_WINDOW_TRANSPARENT = 0x00000010,   // Set to allow transparent framebuffer
(defparameter +FLAG-WINDOW-TRANSPARENT+  #x00000010)

;;     FLAG_WINDOW_HIGHDPI     = 0x00002000,   // Set to support HighDPI
(defparameter +FLAG-WINDOW-HIGHDPI+      #x00002000)

;;     FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
(defparameter +FLAG-WINDOW-MOUSE-PASSTHROUGH+  #x00004000)

;;     FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, // Set to run program in borderless windowed mode
(defparameter +FLAG-BORDERLESS-WINDOWED-MODE+  #x00008000)

;;     FLAG_MSAA_4X_HINT       = 0x00000020,   // Set to try enabling MSAA 4X
(defparameter +FLAG-MSAA-4X-HINT+              #x00000020)

;;     FLAG_INTERLACED_HINT    = 0x00010000    // Set to try enabling interlaced video format (for V3D)
;; } ConfigFlags;
(defparameter +FLAG-INTERLACED-HINT+           #x00010000)

;; // Trace log level
;; // NOTE: Organized by priority level
;; typedef enum {
;;     LOG_ALL = 0,        // Display all logs
;;     LOG_TRACE,          // Trace logging, intended for internal use only
;;     LOG_DEBUG,          // Debug logging, used for internal debugging, it should be disabled on release builds
;;     LOG_INFO,           // Info logging, used for program execution info
;;     LOG_WARNING,        // Warning logging, used on recoverable failures
;;     LOG_ERROR,          // Error logging, used on unrecoverable failures
;;     LOG_FATAL,          // Fatal logging, used to abort program: exit(EXIT_FAILURE)
;;     LOG_NONE            // Disable logging
;; } TraceLogLevel;

;; // Keyboard keys (US keyboard layout)
;; // NOTE: Use GetKeyPressed() to allow redefining
;; // required keys for alternative layouts
;; typedef enum {
;;     KEY_NULL            = 0,        // Key: NULL, used for no key pressed
(defparameter +KEY-NULL+ 0)
;;     // Alphanumeric keys
;;     KEY_APOSTROPHE      = 39,       // Key: '
(defparameter +KEY-APOSTROPHE+ 39)
;;     KEY_COMMA           = 44,       // Key: ,
(defparameter +KEY-COMMA+ 44)
;;     KEY_MINUS           = 45,       // Key: -
(defparameter +KEY-MINUS+ 45)
;;     KEY_PERIOD          = 46,       // Key: .
(defparameter +KEY-PERIOD+ 46)
;;     KEY_SLASH           = 47,       // Key: /
(defparameter +KEY-SLASH+ 47)
;;     KEY_ZERO            = 48,       // Key: 0
(defparameter +KEY-ZERO+ 48)
;;     KEY_ONE             = 49,       // Key: 1
(defparameter +KEY-ONE+ 49)
;;     KEY_TWO             = 50,       // Key: 2
(defparameter +KEY-TWO+ 50)
;;     KEY_THREE           = 51,       // Key: 3
(defparameter +KEY-THREE+ 51)
;;     KEY_FOUR            = 52,       // Key: 4
(defparameter +KEY-FOUR+ 52)
;;     KEY_FIVE            = 53,       // Key: 5
(defparameter +KEY-FIVE+ 53)
;;     KEY_SIX             = 54,       // Key: 6
(defparameter +KEY-SIX+ 54)
;;     KEY_SEVEN           = 55,       // Key: 7
(defparameter +KEY-SEVEN+ 55)
;;     KEY_EIGHT           = 56,       // Key: 8
(defparameter +KEY-EIGHT+ 56)
;;     KEY_NINE            = 57,       // Key: 9
(defparameter +KEY-NINE+ 57)
;;     KEY_SEMICOLON       = 59,       // Key: ;
(defparameter +KEY-SEMICOLON+ 59)
;;     KEY_EQUAL           = 61,       // Key: =
(defparameter +KEY-EQUAL+ 61)
;;     KEY_A               = 65,       // Key: A | a
(defparameter +KEY-A+ 65)
;;     KEY_B               = 66,       // Key: B | b
(defparameter +KEY-B+ 66)
;;     KEY_C               = 67,       // Key: C | c
(defparameter +KEY-C+ 67)
;;     KEY_D               = 68,       // Key: D | d
(defparameter +KEY-D+ 68)
;;     KEY_E               = 69,       // Key: E | e
(defparameter +KEY-E+ 69)
;;     KEY_F               = 70,       // Key: F | f
(defparameter +KEY-F+ 70)
;;     KEY_G               = 71,       // Key: G | g
(defparameter +KEY-G+ 71)
;;     KEY_H               = 72,       // Key: H | h
(defparameter +KEY-H+ 72)
;;     KEY_I               = 73,       // Key: I | i
(defparameter +KEY-I+ 73)
;;     KEY_J               = 74,       // Key: J | j
(defparameter +KEY-J+ 74)
;;     KEY_K               = 75,       // Key: K | k
(defparameter +KEY-K+ 75)
;;     KEY_L               = 76,       // Key: L | l
(defparameter +KEY-L+ 76)
;;     KEY_M               = 77,       // Key: M | m
(defparameter +KEY-M+ 77)
;;     KEY_N               = 78,       // Key: N | n
(defparameter +KEY-N+ 78)
;;     KEY_O               = 79,       // Key: O | o
(defparameter +KEY-O+ 79)
;;     KEY_P               = 80,       // Key: P | p
(defparameter +KEY-P+ 80)
;;     KEY_Q               = 81,       // Key: Q | q
(defparameter +KEY-Q+ 81)
;;     KEY_R               = 82,       // Key: R | r
(defparameter +KEY-R+ 82)
;;     KEY_S               = 83,       // Key: S | s
(defparameter +KEY-S+ 83)
;;     KEY_T               = 84,       // Key: T | t
(defparameter +KEY-T+ 84)
;;     KEY_U               = 85,       // Key: U | u
(defparameter +KEY-U+ 85)
;;     KEY_V               = 86,       // Key: V | v
(defparameter +KEY-V+ 86)
;;     KEY_W               = 87,       // Key: W | w
(defparameter +KEY-W+ 87)
;;     KEY_X               = 88,       // Key: X | x
(defparameter +KEY-X+ 88)
;;     KEY_Y               = 89,       // Key: Y | y
(defparameter +KEY-Y+ 89)
;;     KEY_Z               = 90,       // Key: Z | z
(defparameter +KEY-Z+ 90)
;;     KEY_LEFT_BRACKET    = 91,       // Key: [
(defparameter +KEY-LEFT-BRACKET+ 91)
;;     KEY_BACKSLASH       = 92,       // Key: '\'
(defparameter +KEY-BACKSLASH+ 92)
;;     KEY_RIGHT_BRACKET   = 93,       // Key: ]
(defparameter +KEY-RIGHT-BRACKET+ 93)
;;     KEY_GRAVE           = 96,       // Key: `
(defparameter +KEY-GRAVE+ 96)
;;     // Function keys
;;     KEY_SPACE           = 32,       // Key: Space
(defparameter +KEY-SPACE+ 32)
;;     KEY_ESCAPE          = 256,      // Key: Esc
(defparameter +KEY-ESCAPE+ 256)
;;     KEY_ENTER           = 257,      // Key: Enter
(defparameter +KEY-ENTER+ 257)
;;     KEY_TAB             = 258,      // Key: Tab
(defparameter +KEY-TAB+ 258)
;;     KEY_BACKSPACE       = 259,      // Key: Backspace
(defparameter +KEY-BACKSPACE+ 259)
;;     KEY_INSERT          = 260,      // Key: Ins
(defparameter +KEY-INSERT+ 260)
;;     KEY_DELETE          = 261,      // Key: Del
(defparameter +KEY-DELETE+ 261)
;;     KEY_RIGHT           = 262,      // Key: Cursor right
(defparameter +KEY-RIGHT+ 262)
;;     KEY_LEFT            = 263,      // Key: Cursor left
(defparameter +KEY-LEFT+ 263)
;;     KEY_DOWN            = 264,      // Key: Cursor down
(defparameter +KEY-DOWN+ 264)
;;     KEY_UP              = 265,      // Key: Cursor up
(defparameter +KEY-UP+ 265)
;;     KEY_PAGE_UP         = 266,      // Key: Page up
(defparameter +KEY-PAGE-UP+ 266)
;;     KEY_PAGE_DOWN       = 267,      // Key: Page down
(defparameter +KEY-PAGE-DOWN+ 267)
;;     KEY_HOME            = 268,      // Key: Home
(defparameter +KEY-HOME+ 268)
;;     KEY_END             = 269,      // Key: End
(defparameter +KEY-END+ 269)
;;     KEY_CAPS_LOCK       = 280,      // Key: Caps lock
(defparameter +KEY-CAPS-LOCK+ 280)
;;     KEY_SCROLL_LOCK     = 281,      // Key: Scroll down
(defparameter +KEY-SCROLL-LOCK+ 281)
;;     KEY_NUM_LOCK        = 282,      // Key: Num lock
(defparameter +KEY-NUM-LOCK+ 282)
;;     KEY_PRINT_SCREEN    = 283,      // Key: Print screen
(defparameter +KEY-PRINT-SCREEN+ 283)
;;     KEY_PAUSE           = 284,      // Key: Pause
(defparameter +KEY-PAUSE+ 284)
;;     KEY_F1              = 290,      // Key: F1
(defparameter +KEY-F1+ 290)
;;     KEY_F2              = 291,      // Key: F2
(defparameter +KEY-F2+ 291)
;;     KEY_F3              = 292,      // Key: F3
(defparameter +KEY-F3+ 292)
;;     KEY_F4              = 293,      // Key: F4
(defparameter +KEY-F4+ 293)
;;     KEY_F5              = 294,      // Key: F5
(defparameter +KEY-F5+ 294)
;;     KEY_F6              = 295,      // Key: F6
(defparameter +KEY-F6+ 295)
;;     KEY_F7              = 296,      // Key: F7
(defparameter +KEY-F7+ 296)
;;     KEY_F8              = 297,      // Key: F8
(defparameter +KEY-F8+ 297)
;;     KEY_F9              = 298,      // Key: F9
(defparameter +KEY-F9+ 298)
;;     KEY_F10             = 299,      // Key: F10
(defparameter +KEY-F10+ 299)
;;     KEY_F11             = 300,      // Key: F11
(defparameter +KEY-F11+ 300)
;;     KEY_F12             = 301,      // Key: F12
(defparameter +KEY-F12+ 301)
;;     KEY_LEFT_SHIFT      = 340,      // Key: Shift left
(defparameter +KEY-LEFT-SHIFT+ 340)
;;     KEY_LEFT_CONTROL    = 341,      // Key: Control left
(defparameter +KEY-LEFT-CONTROL+ 341)
;;     KEY_LEFT_ALT        = 342,      // Key: Alt left
(defparameter +KEY-LEFT-ALT+ 342)
;;     KEY_LEFT_SUPER      = 343,      // Key: Super left
(defparameter +KEY-LEFT-SUPER+ 343)
;;     KEY_RIGHT_SHIFT     = 344,      // Key: Shift right
(defparameter +KEY-RIGHT-SHIFT+ 344)
;;     KEY_RIGHT_CONTROL   = 345,      // Key: Control right
(defparameter +KEY-RIGHT-CONTROL+ 345)
;;     KEY_RIGHT_ALT       = 346,      // Key: Alt right
(defparameter +KEY-RIGHT-ALT+ 346)
;;     KEY_RIGHT_SUPER     = 347,      // Key: Super right
(defparameter +KEY-RIGHT-SUPER+ 347)
;;     KEY_KB_MENU         = 348,      // Key: KB menu
(defparameter +KEY-KB-MENU+ 348)
;;     // Keypad keys
;;     KEY_KP_0            = 320,      // Key: Keypad 0
(defparameter +KEY-KP-0+ 320)
;;     KEY_KP_1            = 321,      // Key: Keypad 1
(defparameter +KEY-KP-1+ 321)
;;     KEY_KP_2            = 322,      // Key: Keypad 2
(defparameter +KEY-KP-2+ 322)
;;     KEY_KP_3            = 323,      // Key: Keypad 3
(defparameter +KEY-KP-3+ 323)
;;     KEY_KP_4            = 324,      // Key: Keypad 4
(defparameter +KEY-KP-4+ 324)
;;     KEY_KP_5            = 325,      // Key: Keypad 5
(defparameter +KEY-KP-5+ 325)
;;     KEY_KP_6            = 326,      // Key: Keypad 6
(defparameter +KEY-KP-6+ 326)
;;     KEY_KP_7            = 327,      // Key: Keypad 7
(defparameter +KEY-KP-7+ 327)
;;     KEY_KP_8            = 328,      // Key: Keypad 8
(defparameter +KEY-KP-8+ 328)
;;     KEY_KP_9            = 329,      // Key: Keypad 9
(defparameter +KEY-KP-9+ 329)
;;     KEY_KP_DECIMAL      = 330,      // Key: Keypad .
(defparameter +KEY-KP-DECIMAL+ 330)
;;     KEY_KP_DIVIDE       = 331,      // Key: Keypad /
(defparameter +KEY-KP-DIVIDE+ 331)
;;     KEY_KP_MULTIPLY     = 332,      // Key: Keypad *
(defparameter +KEY-KP-MULTIPLY+ 332)
;;     KEY_KP_SUBTRACT     = 333,      // Key: Keypad -
(defparameter +KEY-KP-SUBTRACT+ 333)
;;     KEY_KP_ADD          = 334,      // Key: Keypad +
(defparameter +KEY-KP-ADD+ 334)
;;     KEY_KP_ENTER        = 335,      // Key: Keypad Enter
(defparameter +KEY-KP-ENTER+ 335)
;;     KEY_KP_EQUAL        = 336,      // Key: Keypad =
(defparameter +KEY-KP-EQUAL+ 336)
;;     // Android key buttons
;;     KEY_BACK            = 4,        // Key: Android back button
(defparameter +KEY-BACK+ 4)
;;     KEY_MENU            = 5,        // Key: Android menu button
(defparameter +KEY-MENU+ 5)
;;     KEY_VOLUME_UP       = 24,       // Key: Android volume up button
(defparameter +KEY-VOLUME-UP+ 24)
;;     KEY_VOLUME_DOWN     = 25        // Key: Android volume down button
(defparameter +KEY-VOLUME-DOWN+ 25)
;; } KeyboardKey;

;; // Add backwards compatibility support for deprecated names
;; #define MOUSE_LEFT_BUTTON   MOUSE_BUTTON_LEFT
;; #define MOUSE_RIGHT_BUTTON  MOUSE_BUTTON_RIGHT
;; #define MOUSE_MIDDLE_BUTTON MOUSE_BUTTON_MIDDLE

;; // Mouse buttons
;; typedef enum {
;;     MOUSE_BUTTON_LEFT    = 0,       // Mouse button left
(defparameter +MOUSE-BUTTON-LEFT+ 0)   ; Mouse button left
;;     MOUSE_BUTTON_RIGHT   = 1,       // Mouse button right
(defparameter +MOUSE-BUTTON-RIGHT+ 1)  ; Mouse button right
;;     MOUSE_BUTTON_MIDDLE  = 2,       // Mouse button middle (pressed wheel)
(defparameter +MOUSE-BUTTON-MIDDLE+ 2) ; Mouse button middle (pressed wheel)
;;     MOUSE_BUTTON_SIDE    = 3,       // Mouse button side (advanced mouse device)
(defparameter +MOUSE-BUTTON-SIDE+ 3)   ; Mouse button side (advanced mouse device)
;;     MOUSE_BUTTON_EXTRA   = 4,       // Mouse button extra (advanced mouse device)
(defparameter +MOUSE-BUTTON-EXTRA+ 4)  ; Mouse button extra (advanced mouse device)
;;     MOUSE_BUTTON_FORWARD = 5,       // Mouse button forward (advanced mouse device)
(defparameter +MOUSE-BUTTON-FORWARD+ 5) ; Mouse button forward (advanced mouse device)
;;     MOUSE_BUTTON_BACK    = 6,       // Mouse button back (advanced mouse device)
(defparameter +MOUSE-BUTTON-BACK+ 6)    ; Mouse button back (advanced mouse device)
;; } MouseButton;

;; // Mouse cursor
;; typedef enum {
;;     MOUSE_CURSOR_DEFAULT       = 0,     // Default pointer shape
;;     MOUSE_CURSOR_ARROW         = 1,     // Arrow shape
;;     MOUSE_CURSOR_IBEAM         = 2,     // Text writing cursor shape
;;     MOUSE_CURSOR_CROSSHAIR     = 3,     // Cross shape
;;     MOUSE_CURSOR_POINTING_HAND = 4,     // Pointing hand cursor
;;     MOUSE_CURSOR_RESIZE_EW     = 5,     // Horizontal resize/move arrow shape
;;     MOUSE_CURSOR_RESIZE_NS     = 6,     // Vertical resize/move arrow shape
;;     MOUSE_CURSOR_RESIZE_NWSE   = 7,     // Top-left to bottom-right diagonal resize/move arrow shape
;;     MOUSE_CURSOR_RESIZE_NESW   = 8,     // The top-right to bottom-left diagonal resize/move arrow shape
;;     MOUSE_CURSOR_RESIZE_ALL    = 9,     // The omnidirectional resize/move cursor shape
;;     MOUSE_CURSOR_NOT_ALLOWED   = 10     // The operation-not-allowed shape
;; } MouseCursor;

;; // Gamepad buttons
;; typedef enum {
;;     GAMEPAD_BUTTON_UNKNOWN = 0,         // Unknown button, just for error checking
;;     GAMEPAD_BUTTON_LEFT_FACE_UP,        // Gamepad left DPAD up button
;;     GAMEPAD_BUTTON_LEFT_FACE_RIGHT,     // Gamepad left DPAD right button
;;     GAMEPAD_BUTTON_LEFT_FACE_DOWN,      // Gamepad left DPAD down button
;;     GAMEPAD_BUTTON_LEFT_FACE_LEFT,      // Gamepad left DPAD left button
;;     GAMEPAD_BUTTON_RIGHT_FACE_UP,       // Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
;;     GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,    // Gamepad right button right (i.e. PS3: Circle, Xbox: B)
;;     GAMEPAD_BUTTON_RIGHT_FACE_DOWN,     // Gamepad right button down (i.e. PS3: Cross, Xbox: A)
;;     GAMEPAD_BUTTON_RIGHT_FACE_LEFT,     // Gamepad right button left (i.e. PS3: Square, Xbox: X)
;;     GAMEPAD_BUTTON_LEFT_TRIGGER_1,      // Gamepad top/back trigger left (first), it could be a trailing button
;;     GAMEPAD_BUTTON_LEFT_TRIGGER_2,      // Gamepad top/back trigger left (second), it could be a trailing button
;;     GAMEPAD_BUTTON_RIGHT_TRIGGER_1,     // Gamepad top/back trigger right (first), it could be a trailing button
;;     GAMEPAD_BUTTON_RIGHT_TRIGGER_2,     // Gamepad top/back trigger right (second), it could be a trailing button
;;     GAMEPAD_BUTTON_MIDDLE_LEFT,         // Gamepad center buttons, left one (i.e. PS3: Select)
;;     GAMEPAD_BUTTON_MIDDLE,              // Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
;;     GAMEPAD_BUTTON_MIDDLE_RIGHT,        // Gamepad center buttons, right one (i.e. PS3: Start)
;;     GAMEPAD_BUTTON_LEFT_THUMB,          // Gamepad joystick pressed button left
;;     GAMEPAD_BUTTON_RIGHT_THUMB          // Gamepad joystick pressed button right
;; } GamepadButton;

;; // Gamepad axes
;; typedef enum {
;;     GAMEPAD_AXIS_LEFT_X        = 0,     // Gamepad left stick X axis
;;     GAMEPAD_AXIS_LEFT_Y        = 1,     // Gamepad left stick Y axis
;;     GAMEPAD_AXIS_RIGHT_X       = 2,     // Gamepad right stick X axis
;;     GAMEPAD_AXIS_RIGHT_Y       = 3,     // Gamepad right stick Y axis
;;     GAMEPAD_AXIS_LEFT_TRIGGER  = 4,     // Gamepad back trigger left, pressure level: [1..-1]
;;     GAMEPAD_AXIS_RIGHT_TRIGGER = 5      // Gamepad back trigger right, pressure level: [1..-1]
;; } GamepadAxis;

;; // Material map index
;; typedef enum {
;;     MATERIAL_MAP_ALBEDO = 0,        // Albedo material (same as: MATERIAL_MAP_DIFFUSE)
;;     MATERIAL_MAP_METALNESS,         // Metalness material (same as: MATERIAL_MAP_SPECULAR)
;;     MATERIAL_MAP_NORMAL,            // Normal material
;;     MATERIAL_MAP_ROUGHNESS,         // Roughness material
;;     MATERIAL_MAP_OCCLUSION,         // Ambient occlusion material
;;     MATERIAL_MAP_EMISSION,          // Emission material
;;     MATERIAL_MAP_HEIGHT,            // Heightmap material
;;     MATERIAL_MAP_CUBEMAP,           // Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
;;     MATERIAL_MAP_IRRADIANCE,        // Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
;;     MATERIAL_MAP_PREFILTER,         // Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
;;     MATERIAL_MAP_BRDF               // Brdf material
;; } MaterialMapIndex;

;; #define MATERIAL_MAP_DIFFUSE      MATERIAL_MAP_ALBEDO
;; #define MATERIAL_MAP_SPECULAR     MATERIAL_MAP_METALNESS

;; // Shader location index
;; typedef enum {
;;     SHADER_LOC_VERTEX_POSITION = 0, // Shader location: vertex attribute: position
;;     SHADER_LOC_VERTEX_TEXCOORD01,   // Shader location: vertex attribute: texcoord01
;;     SHADER_LOC_VERTEX_TEXCOORD02,   // Shader location: vertex attribute: texcoord02
;;     SHADER_LOC_VERTEX_NORMAL,       // Shader location: vertex attribute: normal
;;     SHADER_LOC_VERTEX_TANGENT,      // Shader location: vertex attribute: tangent
;;     SHADER_LOC_VERTEX_COLOR,        // Shader location: vertex attribute: color
;;     SHADER_LOC_MATRIX_MVP,          // Shader location: matrix uniform: model-view-projection
;;     SHADER_LOC_MATRIX_VIEW,         // Shader location: matrix uniform: view (camera transform)
;;     SHADER_LOC_MATRIX_PROJECTION,   // Shader location: matrix uniform: projection
;;     SHADER_LOC_MATRIX_MODEL,        // Shader location: matrix uniform: model (transform)
;;     SHADER_LOC_MATRIX_NORMAL,       // Shader location: matrix uniform: normal
;;     SHADER_LOC_VECTOR_VIEW,         // Shader location: vector uniform: view
;;     SHADER_LOC_COLOR_DIFFUSE,       // Shader location: vector uniform: diffuse color
;;     SHADER_LOC_COLOR_SPECULAR,      // Shader location: vector uniform: specular color
;;     SHADER_LOC_COLOR_AMBIENT,       // Shader location: vector uniform: ambient color
;;     SHADER_LOC_MAP_ALBEDO,          // Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
;;     SHADER_LOC_MAP_METALNESS,       // Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
;;     SHADER_LOC_MAP_NORMAL,          // Shader location: sampler2d texture: normal
;;     SHADER_LOC_MAP_ROUGHNESS,       // Shader location: sampler2d texture: roughness
;;     SHADER_LOC_MAP_OCCLUSION,       // Shader location: sampler2d texture: occlusion
;;     SHADER_LOC_MAP_EMISSION,        // Shader location: sampler2d texture: emission
;;     SHADER_LOC_MAP_HEIGHT,          // Shader location: sampler2d texture: height
;;     SHADER_LOC_MAP_CUBEMAP,         // Shader location: samplerCube texture: cubemap
;;     SHADER_LOC_MAP_IRRADIANCE,      // Shader location: samplerCube texture: irradiance
;;     SHADER_LOC_MAP_PREFILTER,       // Shader location: samplerCube texture: prefilter
;;     SHADER_LOC_MAP_BRDF,            // Shader location: sampler2d texture: brdf
;;     SHADER_LOC_VERTEX_BONEIDS,      // Shader location: vertex attribute: boneIds
;;     SHADER_LOC_VERTEX_BONEWEIGHTS,  // Shader location: vertex attribute: boneWeights
;;     SHADER_LOC_BONE_MATRICES,       // Shader location: array of matrices uniform: boneMatrices
;;     SHADER_LOC_VERTEX_INSTANCE_TX   // Shader location: vertex attribute: instanceTransform
;; } ShaderLocationIndex;

;; #define SHADER_LOC_MAP_DIFFUSE      SHADER_LOC_MAP_ALBEDO
;; #define SHADER_LOC_MAP_SPECULAR     SHADER_LOC_MAP_METALNESS

;; // Shader uniform data type
;; typedef enum {
;;     SHADER_UNIFORM_FLOAT = 0,       // Shader uniform type: float
;;     SHADER_UNIFORM_VEC2,            // Shader uniform type: vec2 (2 float)
;;     SHADER_UNIFORM_VEC3,            // Shader uniform type: vec3 (3 float)
;;     SHADER_UNIFORM_VEC4,            // Shader uniform type: vec4 (4 float)
;;     SHADER_UNIFORM_INT,             // Shader uniform type: int
;;     SHADER_UNIFORM_IVEC2,           // Shader uniform type: ivec2 (2 int)
;;     SHADER_UNIFORM_IVEC3,           // Shader uniform type: ivec3 (3 int)
;;     SHADER_UNIFORM_IVEC4,           // Shader uniform type: ivec4 (4 int)
;;     SHADER_UNIFORM_UINT,            // Shader uniform type: unsigned int
;;     SHADER_UNIFORM_UIVEC2,          // Shader uniform type: uivec2 (2 unsigned int)
;;     SHADER_UNIFORM_UIVEC3,          // Shader uniform type: uivec3 (3 unsigned int)
;;     SHADER_UNIFORM_UIVEC4,          // Shader uniform type: uivec4 (4 unsigned int)
;;     SHADER_UNIFORM_SAMPLER2D        // Shader uniform type: sampler2d
;; } ShaderUniformDataType;

;; // Shader attribute data types
;; typedef enum {
;;     SHADER_ATTRIB_FLOAT = 0,        // Shader attribute type: float
;;     SHADER_ATTRIB_VEC2,             // Shader attribute type: vec2 (2 float)
;;     SHADER_ATTRIB_VEC3,             // Shader attribute type: vec3 (3 float)
;;     SHADER_ATTRIB_VEC4              // Shader attribute type: vec4 (4 float)
;; } ShaderAttributeDataType;

;; // Pixel formats
;; // NOTE: Support depends on OpenGL version and platform
;; typedef enum {
;;     PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1, // 8 bit per pixel (no alpha)
;;     PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,    // 8*2 bpp (2 channels)
;;     PIXELFORMAT_UNCOMPRESSED_R5G6B5,        // 16 bpp
;;     PIXELFORMAT_UNCOMPRESSED_R8G8B8,        // 24 bpp
;;     PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,      // 16 bpp (1 bit alpha)
;;     PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,      // 16 bpp (4 bit alpha)
;;     PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,      // 32 bpp
;;     PIXELFORMAT_UNCOMPRESSED_R32,           // 32 bpp (1 channel - float)
;;     PIXELFORMAT_UNCOMPRESSED_R32G32B32,     // 32*3 bpp (3 channels - float)
;;     PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,  // 32*4 bpp (4 channels - float)
;;     PIXELFORMAT_UNCOMPRESSED_R16,           // 16 bpp (1 channel - half float)
;;     PIXELFORMAT_UNCOMPRESSED_R16G16B16,     // 16*3 bpp (3 channels - half float)
;;     PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,  // 16*4 bpp (4 channels - half float)
;;     PIXELFORMAT_COMPRESSED_DXT1_RGB,        // 4 bpp (no alpha)
;;     PIXELFORMAT_COMPRESSED_DXT1_RGBA,       // 4 bpp (1 bit alpha)
;;     PIXELFORMAT_COMPRESSED_DXT3_RGBA,       // 8 bpp
;;     PIXELFORMAT_COMPRESSED_DXT5_RGBA,       // 8 bpp
;;     PIXELFORMAT_COMPRESSED_ETC1_RGB,        // 4 bpp
;;     PIXELFORMAT_COMPRESSED_ETC2_RGB,        // 4 bpp
;;     PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,   // 8 bpp
;;     PIXELFORMAT_COMPRESSED_PVRT_RGB,        // 4 bpp
;;     PIXELFORMAT_COMPRESSED_PVRT_RGBA,       // 4 bpp
;;     PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,   // 8 bpp
;;     PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA    // 2 bpp
;; } PixelFormat;

;; // Texture parameters: filter mode
;; // NOTE 1: Filtering considers mipmaps if available in the texture
;; // NOTE 2: Filter is accordingly set for minification and magnification
;; typedef enum {
;;     TEXTURE_FILTER_POINT = 0,               // No filter, just pixel approximation
;;     TEXTURE_FILTER_BILINEAR,                // Linear filtering
;;     TEXTURE_FILTER_TRILINEAR,               // Trilinear filtering (linear with mipmaps)
;;     TEXTURE_FILTER_ANISOTROPIC_4X,          // Anisotropic filtering 4x
;;     TEXTURE_FILTER_ANISOTROPIC_8X,          // Anisotropic filtering 8x
;;     TEXTURE_FILTER_ANISOTROPIC_16X,         // Anisotropic filtering 16x
;; } TextureFilter;

;; // Texture parameters: wrap mode
;; typedef enum {
;;     TEXTURE_WRAP_REPEAT = 0,                // Repeats texture in tiled mode
;;     TEXTURE_WRAP_CLAMP,                     // Clamps texture to edge pixel in tiled mode
;;     TEXTURE_WRAP_MIRROR_REPEAT,             // Mirrors and repeats the texture in tiled mode
;;     TEXTURE_WRAP_MIRROR_CLAMP               // Mirrors and clamps to border the texture in tiled mode
;; } TextureWrap;

;; // Cubemap layouts
;; typedef enum {
;;     CUBEMAP_LAYOUT_AUTO_DETECT = 0,         // Automatically detect layout type
;;     CUBEMAP_LAYOUT_LINE_VERTICAL,           // Layout is defined by a vertical line with faces
;;     CUBEMAP_LAYOUT_LINE_HORIZONTAL,         // Layout is defined by a horizontal line with faces
;;     CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,     // Layout is defined by a 3x4 cross with cubemap faces
;;     CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE     // Layout is defined by a 4x3 cross with cubemap faces
;; } CubemapLayout;

;; // Font type, defines generation method
;; typedef enum {
;;     FONT_DEFAULT = 0,               // Default font generation, anti-aliased
;;     FONT_BITMAP,                    // Bitmap font generation, no anti-aliasing
;;     FONT_SDF                        // SDF font generation, requires external shader
;; } FontType;

;; // Color blending modes (pre-defined)
;; typedef enum {
;;     BLEND_ALPHA = 0,                // Blend textures considering alpha (default)
;;     BLEND_ADDITIVE,                 // Blend textures adding colors
;;     BLEND_MULTIPLIED,               // Blend textures multiplying colors
;;     BLEND_ADD_COLORS,               // Blend textures adding colors (alternative)
;;     BLEND_SUBTRACT_COLORS,          // Blend textures subtracting colors (alternative)
;;     BLEND_ALPHA_PREMULTIPLY,        // Blend premultiplied textures considering alpha
;;     BLEND_CUSTOM,                   // Blend textures using custom src/dst factors (use rlSetBlendFactors())
;;     BLEND_CUSTOM_SEPARATE           // Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
;; } BlendMode;

;; // Gesture
;; // NOTE: Provided as bit-wise flags to enable only desired gestures
;; typedef enum {
;;     GESTURE_NONE        = 0,        // No gesture
;;     GESTURE_TAP         = 1,        // Tap gesture
;;     GESTURE_DOUBLETAP   = 2,        // Double tap gesture
;;     GESTURE_HOLD        = 4,        // Hold gesture
;;     GESTURE_DRAG        = 8,        // Drag gesture
;;     GESTURE_SWIPE_RIGHT = 16,       // Swipe right gesture
;;     GESTURE_SWIPE_LEFT  = 32,       // Swipe left gesture
;;     GESTURE_SWIPE_UP    = 64,       // Swipe up gesture
;;     GESTURE_SWIPE_DOWN  = 128,      // Swipe down gesture
;;     GESTURE_PINCH_IN    = 256,      // Pinch in gesture
;;     GESTURE_PINCH_OUT   = 512       // Pinch out gesture
;; } Gesture;

;; // Camera system modes
;; typedef enum {
;;     CAMERA_CUSTOM = 0,              // Camera custom, controlled by user (UpdateCamera() does nothing)
;;     CAMERA_FREE,                    // Camera free mode
;;     CAMERA_ORBITAL,                 // Camera orbital, around target, zoom supported
;;     CAMERA_FIRST_PERSON,            // Camera first person
;;     CAMERA_THIRD_PERSON             // Camera third person
;; } CameraMode;

;; // Camera projection
;; typedef enum {
;;     CAMERA_PERSPECTIVE = 0,         // Perspective projection
;;     CAMERA_ORTHOGRAPHIC             // Orthographic projection
;; } CameraProjection;

;; // N-patch layout
;; typedef enum {
;;     NPATCH_NINE_PATCH = 0,          // Npatch layout: 3x3 tiles
;;     NPATCH_THREE_PATCH_VERTICAL,    // Npatch layout: 1x3 tiles
;;     NPATCH_THREE_PATCH_HORIZONTAL   // Npatch layout: 3x1 tiles
;; } NPatchLayout;

;; // Callbacks to hook some internal functions
;; // WARNING: These callbacks are intended for advanced users
;; typedef void (*TraceLogCallback)(int logLevel, const char *text, va_list args);  // Logging: Redirect trace log messages
;; typedef unsigned char *(*LoadFileDataCallback)(const char *fileName, int *dataSize);    // FileIO: Load binary data
;; typedef bool (*SaveFileDataCallback)(const char *fileName, void *data, int dataSize);   // FileIO: Save binary data
;; typedef char *(*LoadFileTextCallback)(const char *fileName);            // FileIO: Load text data
;; typedef bool (*SaveFileTextCallback)(const char *fileName, const char *text); // FileIO: Save text data

;; //------------------------------------------------------------------------------------
;; // Global Variables Definition
;; //------------------------------------------------------------------------------------
;; // It's lonely here...

;; //------------------------------------------------------------------------------------
;; // Window and Graphics Device Functions (Module: core)
;; //------------------------------------------------------------------------------------

;; #if defined(__cplusplus)
;; extern "C" {            // Prevents name mangling of functions
;; #endif

;; // Window-related functions
;; RLAPI void InitWindow(int width, int height, const char *title);  // Initialize window and OpenGL context
(cffi:defcfun ("InitWindow" init-window) :void
  (width :int)
  (height :int)
  (title :string))

;; RLAPI void CloseWindow(void);                                     // Close window and unload OpenGL context
(cffi:defcfun ("CloseWindow" close-window) :void)

(defmacro with-window ((width height title &key (fps 60)) &body body)
  `(progn
     (set-target-fps ,fps)
     (init-window ,width ,height ,title)
     (unwind-protect
	  (progn ,@body)
       (close-window))))


;; RLAPI bool WindowShouldClose(void);                               // Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
(cffi:defcfun ("WindowShouldClose" window-should-close) :bool)

;; RLAPI bool IsWindowReady(void);                                   // Check if window has been initialized successfully
;; RLAPI bool IsWindowFullscreen(void);                              // Check if window is currently fullscreen
;; RLAPI bool IsWindowHidden(void);                                  // Check if window is currently hidden
;; RLAPI bool IsWindowMinimized(void);                               // Check if window is currently minimized
;; RLAPI bool IsWindowMaximized(void);                               // Check if window is currently maximized
;; RLAPI bool IsWindowFocused(void);                                 // Check if window is currently focused
;; RLAPI bool IsWindowResized(void);                                 // Check if window has been resized last frame
;; RLAPI bool IsWindowState(unsigned int flag);                      // Check if one specific window flag is enabled
;; RLAPI void SetWindowState(unsigned int flags);                    // Set window configuration state using flags
;; RLAPI void ClearWindowState(unsigned int flags);                  // Clear window configuration state flags
;; RLAPI void ToggleFullscreen(void);                                // Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
;; RLAPI void ToggleBorderlessWindowed(void);                        // Toggle window state: borderless windowed, resizes window to match monitor resolution
;; RLAPI void MaximizeWindow(void);                                  // Set window state: maximized, if resizable
;; RLAPI void MinimizeWindow(void);                                  // Set window state: minimized, if resizable
;; RLAPI void RestoreWindow(void);                                   // Restore window from being minimized/maximized
;; RLAPI void SetWindowIcon(Image image);                            // Set icon for window (single image, RGBA 32bit)
;; RLAPI void SetWindowIcons(Image *images, int count);              // Set icon for window (multiple images, RGBA 32bit)
;; RLAPI void SetWindowTitle(const char *title);                     // Set title for window
;; RLAPI void SetWindowPosition(int x, int y);                       // Set window position on screen
;; RLAPI void SetWindowMonitor(int monitor);                         // Set monitor for the current window
;; RLAPI void SetWindowMinSize(int width, int height);               // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
;; RLAPI void SetWindowMaxSize(int width, int height);               // Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
;; RLAPI void SetWindowSize(int width, int height);                  // Set window dimensions
;; RLAPI void SetWindowOpacity(float opacity);                       // Set window opacity [0.0f..1.0f]
;; RLAPI void SetWindowFocused(void);                                // Set window focused
;; RLAPI void *GetWindowHandle(void);                                // Get native window handle
;; RLAPI int GetScreenWidth(void);                                   // Get current screen width
(cffi:defcfun ("GetScreenWidth" get-screen-width) :int)

;; RLAPI int GetScreenHeight(void);                                  // Get current screen height
(cffi:defcfun ("GetScreenHeight" get-screen-height) :int)

;; RLAPI int GetRenderWidth(void);                                   // Get current render width (it considers HiDPI)
;; RLAPI int GetRenderHeight(void);                                  // Get current render height (it considers HiDPI)
;; RLAPI int GetMonitorCount(void);                                  // Get number of connected monitors
;; RLAPI int GetCurrentMonitor(void);                                // Get current monitor where window is placed
;; RLAPI Vector2 GetMonitorPosition(int monitor);                    // Get specified monitor position
;; RLAPI int GetMonitorWidth(int monitor);                           // Get specified monitor width (current video mode used by monitor)
;; RLAPI int GetMonitorHeight(int monitor);                          // Get specified monitor height (current video mode used by monitor)
;; RLAPI int GetMonitorPhysicalWidth(int monitor);                   // Get specified monitor physical width in millimetres
;; RLAPI int GetMonitorPhysicalHeight(int monitor);                  // Get specified monitor physical height in millimetres
;; RLAPI int GetMonitorRefreshRate(int monitor);                     // Get specified monitor refresh rate
;; RLAPI Vector2 GetWindowPosition(void);                            // Get window position XY on monitor
;; RLAPI Vector2 GetWindowScaleDPI(void);                            // Get window scale DPI factor
;; RLAPI const char *GetMonitorName(int monitor);                    // Get the human-readable, UTF-8 encoded name of the specified monitor
;; RLAPI void SetClipboardText(const char *text);                    // Set clipboard text content
;; RLAPI const char *GetClipboardText(void);                         // Get clipboard text content
;; RLAPI Image GetClipboardImage(void);                              // Get clipboard image content
;; RLAPI void EnableEventWaiting(void);                              // Enable waiting for events on EndDrawing(), no automatic event polling
;; RLAPI void DisableEventWaiting(void);                             // Disable waiting for events on EndDrawing(), automatic events polling

;; // Cursor-related functions
;; RLAPI void ShowCursor(void);                                      // Shows cursor
;; RLAPI void HideCursor(void);                                      // Hides cursor
;; RLAPI bool IsCursorHidden(void);                                  // Check if cursor is not visible
;; RLAPI void EnableCursor(void);                                    // Enables cursor (unlock cursor)
;; RLAPI void DisableCursor(void);                                   // Disables cursor (lock cursor)
;; RLAPI bool IsCursorOnScreen(void);                                // Check if cursor is on the screen

;; // Drawing-related functions

;; RLAPI void ClearBackground(Color color);                          // Set background color (framebuffer clear color)
(cffi:defcfun ("ClearBackground" clear-background) :void
  (color (:struct %color)))


;; RLAPI void BeginDrawing(void);                                    // Setup canvas (framebuffer) to start drawing
(cffi:defcfun ("BeginDrawing" begin-drawing) :void)

;; RLAPI void EndDrawing(void);                                      // End canvas drawing and swap buffers (double buffering)
(cffi:defcfun ("EndDrawing" end-drawing) :void)

(defmacro with-drawing (() &body body)
  `(progn
     (begin-drawing)
     (unwind-protect
	  (progn ,@body)
       (end-drawing))))

;; RLAPI void BeginMode2D(Camera2D camera);                          // Begin 2D mode with custom camera (2D)
(cffi:defcfun ("BeginMode2D" begin-mode-2d) :void
  (camera (:struct %camera2d)))

;; RLAPI void EndMode2D(void);                                       // Ends 2D mode with custom camera
(cffi:defcfun ("EndMode2D" end-mode-2d) :void)

(defmacro with-mode-2d ((camera) &body body)
  `(progn
     (begin-mode-2d ,camera)
     (unwind-protect
	  (progn ,@body)
       (end-mode-2d))))

;; RLAPI void BeginMode3D(Camera3D camera);                          // Begin 3D mode with custom camera (3D)
;; RLAPI void EndMode3D(void);                                       // Ends 3D mode and returns to default 2D orthographic mode
;; RLAPI void BeginTextureMode(RenderTexture2D target);              // Begin drawing to render texture
;; RLAPI void EndTextureMode(void);                                  // Ends drawing to render texture
;; RLAPI void BeginShaderMode(Shader shader);                        // Begin custom shader drawing
;; RLAPI void EndShaderMode(void);                                   // End custom shader drawing (use default shader)
;; RLAPI void BeginBlendMode(int mode);                              // Begin blending mode (alpha, additive, multiplied, subtract, custom)
;; RLAPI void EndBlendMode(void);                                    // End blending mode (reset to default: alpha blending)
;; RLAPI void BeginScissorMode(int x, int y, int width, int height); // Begin scissor mode (define screen area for following drawing)
;; RLAPI void EndScissorMode(void);                                  // End scissor mode
;; RLAPI void BeginVrStereoMode(VrStereoConfig config);              // Begin stereo rendering (requires VR simulator)
;; RLAPI void EndVrStereoMode(void);                                 // End stereo rendering (requires VR simulator)

;; // VR stereo config functions for VR simulator
;; RLAPI VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);     // Load VR stereo config for VR simulator device parameters
;; RLAPI void UnloadVrStereoConfig(VrStereoConfig config);           // Unload VR stereo config

;; // Shader management functions
;; // NOTE: Shader functionality is not available on OpenGL 1.1
;; RLAPI Shader LoadShader(const char *vsFileName, const char *fsFileName);   // Load shader from files and bind default locations
;; RLAPI Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode); // Load shader from code strings and bind default locations
;; RLAPI bool IsShaderValid(Shader shader);                                   // Check if a shader is valid (loaded on GPU)
;; RLAPI int GetShaderLocation(Shader shader, const char *uniformName);       // Get shader uniform location
;; RLAPI int GetShaderLocationAttrib(Shader shader, const char *attribName);  // Get shader attribute location
;; RLAPI void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);               // Set shader uniform value
;; RLAPI void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count);   // Set shader uniform value vector
;; RLAPI void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);         // Set shader uniform value (matrix 4x4)
;; RLAPI void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture); // Set shader uniform value and bind the texture (sampler2d)
;; RLAPI void UnloadShader(Shader shader);                                    // Unload shader from GPU memory (VRAM)

;; // Screen-space-related functions
;; #define GetMouseRay GetScreenToWorldRay     // Compatibility hack for previous raylib versions
;; RLAPI Ray GetScreenToWorldRay(Vector2 position, Camera camera);         // Get a ray trace from screen position (i.e mouse)
;; RLAPI Ray GetScreenToWorldRayEx(Vector2 position, Camera camera, int width, int height); // Get a ray trace from screen position (i.e mouse) in a viewport
;; RLAPI Vector2 GetWorldToScreen(Vector3 position, Camera camera);        // Get the screen space position for a 3d world space position
;; RLAPI Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height); // Get size position for a 3d world space position
;; RLAPI Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);    // Get the screen space position for a 2d camera world space position
;; RLAPI Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);    // Get the world space position for a 2d camera screen space position
;; RLAPI Matrix GetCameraMatrix(Camera camera);                            // Get camera transform matrix (view matrix)
;; RLAPI Matrix GetCameraMatrix2D(Camera2D camera);                        // Get camera 2d transform matrix

;; // Timing-related functions
;; RLAPI void SetTargetFPS(int fps);                                 // Set target FPS (maximum)
(cffi:defcfun ("SetTargetFPS" set-target-fps) :void
  (fps :int))


;; RLAPI float GetFrameTime(void);                                   // Get time in seconds for last frame drawn (delta time)
(cffi:defcfun ("GetFrameTime" get-frame-time) :float)



;; RLAPI double GetTime(void);                                       // Get elapsed time in seconds since InitWindow()

;; RLAPI int GetFPS(void);                                           // Get current FPS
(cffi:defcfun ("GetFPS" get-fps) :int)

;; // Custom frame control functions
;; // NOTE: Those functions are intended for advanced users that want full control over the frame processing
;; // By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
;; // To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
;; RLAPI void SwapScreenBuffer(void);                                // Swap back buffer with front buffer (screen drawing)
;; RLAPI void PollInputEvents(void);                                 // Register all input events
;; RLAPI void WaitTime(double seconds);                              // Wait for some time (halt program execution)

;; // Random values generation functions
;; RLAPI void SetRandomSeed(unsigned int seed);                      // Set the seed for the random number generator
;; RLAPI int GetRandomValue(int min, int max);                       // Get a random value between min and max (both included)
;; RLAPI int *LoadRandomSequence(unsigned int count, int min, int max); // Load random values sequence, no values repeated
;; RLAPI void UnloadRandomSequence(int *sequence);                   // Unload random values sequence

;; // Misc. functions
;; RLAPI void TakeScreenshot(const char *fileName);                  // Takes a screenshot of current screen (filename extension defines format)

;; RLAPI void SetConfigFlags(unsigned int flags);                    // Setup init configuration flags (view FLAGS)
(cffi:defcfun ("SetConfigFlags" set-config-flags) :void
  (flags :uint))

;; RLAPI void OpenURL(const char *url);                              // Open URL with default system browser (if available)

;; // NOTE: Following functions implemented in module [utils]
;; //------------------------------------------------------------------
;; RLAPI void TraceLog(int logLevel, const char *text, ...);         // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
;; RLAPI void SetTraceLogLevel(int logLevel);                        // Set the current threshold (minimum) log level
;; RLAPI void *MemAlloc(unsigned int size);                          // Internal memory allocator
;; RLAPI void *MemRealloc(void *ptr, unsigned int size);             // Internal memory reallocator
;; RLAPI void MemFree(void *ptr);                                    // Internal memory free

;; // Set custom callbacks
;; // WARNING: Callbacks setup is intended for advanced users
;; RLAPI void SetTraceLogCallback(TraceLogCallback callback);         // Set custom trace log
;; RLAPI void SetLoadFileDataCallback(LoadFileDataCallback callback); // Set custom file binary data loader
;; RLAPI void SetSaveFileDataCallback(SaveFileDataCallback callback); // Set custom file binary data saver
;; RLAPI void SetLoadFileTextCallback(LoadFileTextCallback callback); // Set custom file text data loader
;; RLAPI void SetSaveFileTextCallback(SaveFileTextCallback callback); // Set custom file text data saver

;; // Files management functions
;; RLAPI unsigned char *LoadFileData(const char *fileName, int *dataSize); // Load file data as byte array (read)
;; RLAPI void UnloadFileData(unsigned char *data);                   // Unload file data allocated by LoadFileData()
;; RLAPI bool SaveFileData(const char *fileName, void *data, int dataSize); // Save data to file from byte array (write), returns true on success
;; RLAPI bool ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName); // Export data to code (.h), returns true on success
;; RLAPI char *LoadFileText(const char *fileName);                   // Load text data from file (read), returns a '\0' terminated string
;; RLAPI void UnloadFileText(char *text);                            // Unload file text data allocated by LoadFileText()
;; RLAPI bool SaveFileText(const char *fileName, const char *text);  // Save text data to file (write), string must be '\0' terminated, returns true on success
;; //------------------------------------------------------------------

;; // File system functions
;; RLAPI bool FileExists(const char *fileName);                      // Check if file exists
;; RLAPI bool DirectoryExists(const char *dirPath);                  // Check if a directory path exists
;; RLAPI bool IsFileExtension(const char *fileName, const char *ext); // Check file extension (including point: .png, .wav)
;; RLAPI int GetFileLength(const char *fileName);                    // Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
;; RLAPI const char *GetFileExtension(const char *fileName);         // Get pointer to extension for a filename string (includes dot: '.png')
;; RLAPI const char *GetFileName(const char *filePath);              // Get pointer to filename for a path string
;; RLAPI const char *GetFileNameWithoutExt(const char *filePath);    // Get filename string without extension (uses static string)
;; RLAPI const char *GetDirectoryPath(const char *filePath);         // Get full path for a given fileName with path (uses static string)
;; RLAPI const char *GetPrevDirectoryPath(const char *dirPath);      // Get previous directory path for a given path (uses static string)
;; RLAPI const char *GetWorkingDirectory(void);                      // Get current working directory (uses static string)
;; RLAPI const char *GetApplicationDirectory(void);                  // Get the directory of the running application (uses static string)
;; RLAPI int MakeDirectory(const char *dirPath);                     // Create directories (including full path requested), returns 0 on success
;; RLAPI bool ChangeDirectory(const char *dir);                      // Change working directory, return true on success
;; RLAPI bool IsPathFile(const char *path);                          // Check if a given path is a file or a directory
;; RLAPI bool IsFileNameValid(const char *fileName);                 // Check if fileName is valid for the platform/OS
;; RLAPI FilePathList LoadDirectoryFiles(const char *dirPath);       // Load directory filepaths
;; RLAPI FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs); // Load directory filepaths with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result
;; RLAPI void UnloadDirectoryFiles(FilePathList files);              // Unload filepaths
;; RLAPI bool IsFileDropped(void);                                   // Check if a file has been dropped into window
;; RLAPI FilePathList LoadDroppedFiles(void);                        // Load dropped filepaths
;; RLAPI void UnloadDroppedFiles(FilePathList files);                // Unload dropped filepaths
;; RLAPI long GetFileModTime(const char *fileName);                  // Get file modification time (last write time)

;; // Compression/Encoding functionality
;; RLAPI unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize);        // Compress data (DEFLATE algorithm), memory must be MemFree()
;; RLAPI unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize);  // Decompress data (DEFLATE algorithm), memory must be MemFree()
;; RLAPI char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize);               // Encode data to Base64 string (includes NULL terminator), memory must be MemFree()
;; RLAPI unsigned char *DecodeDataBase64(const char *text, int *outputSize);                             // Decode Base64 string (expected NULL terminated), memory must be MemFree()
;; RLAPI unsigned int ComputeCRC32(unsigned char *data, int dataSize);  // Compute CRC32 hash code
;; RLAPI unsigned int *ComputeMD5(unsigned char *data, int dataSize);   // Compute MD5 hash code, returns static int[4] (16 bytes)
;; RLAPI unsigned int *ComputeSHA1(unsigned char *data, int dataSize);  // Compute SHA1 hash code, returns static int[5] (20 bytes)

;; // Automation events functionality
;; RLAPI AutomationEventList LoadAutomationEventList(const char *fileName); // Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
;; RLAPI void UnloadAutomationEventList(AutomationEventList list);   // Unload automation events list from file
;; RLAPI bool ExportAutomationEventList(AutomationEventList list, const char *fileName); // Export automation events list as text file
;; RLAPI void SetAutomationEventList(AutomationEventList *list);     // Set automation event list to record to
;; RLAPI void SetAutomationEventBaseFrame(int frame);                // Set automation event internal base frame to start recording
;; RLAPI void StartAutomationEventRecording(void);                   // Start recording automation events (AutomationEventList must be set)
;; RLAPI void StopAutomationEventRecording(void);                    // Stop recording automation events
;; RLAPI void PlayAutomationEvent(AutomationEvent event);            // Play a recorded automation event

;; //------------------------------------------------------------------------------------
;; // Input Handling Functions (Module: core)
;; //------------------------------------------------------------------------------------

;; // Input-related functions: keyboard
;; RLAPI bool IsKeyPressed(int key);                             // Check if a key has been pressed once
(cffi:defcfun ("IsKeyPressed" is-key-pressed) :bool
  (key :int))

;; RLAPI bool IsKeyPressedRepeat(int key);                       // Check if a key has been pressed again
(cffi:defcfun ("IsKeyPressedRepeat" is-key-pressed-repeat) :bool
  (key :int))

;; RLAPI bool IsKeyDown(int key);                                // Check if a key is being pressed
(cffi:defcfun ("IsKeyDown" is-key-down) :bool
  (key :int))

;; RLAPI bool IsKeyReleased(int key);                            // Check if a key has been released once
(cffi:defcfun ("IsKeyReleased" is-key-released) :bool
  (key :int))

;; RLAPI bool IsKeyUp(int key);                                  // Check if a key is NOT being pressed
(cffi:defcfun ("IsKeyUp" is-key-up) :bool
  (key :int))

;; RLAPI int GetKeyPressed(void);                                // Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
(cffi:defcfun ("GetKeyPressed" get-key-pressed) :int)

;; RLAPI int GetCharPressed(void);                               // Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
(cffi:defcfun ("GetCharPressed" get-char-pressed) :int)

;; RLAPI const char *GetKeyName(int key);                        // Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
(cffi:defcfun ("GetKeyName" get-key-name) :string
  (key :int))

;; RLAPI void SetExitKey(int key);                               // Set a custom key to exit program (default is ESC)
(cffi:defcfun ("SetExitKey" set-exit-key) :void
  (key :int))

;; // Input-related functions: gamepads
;; RLAPI bool IsGamepadAvailable(int gamepad);                   // Check if a gamepad is available
;; RLAPI const char *GetGamepadName(int gamepad);                // Get gamepad internal name id
;; RLAPI bool IsGamepadButtonPressed(int gamepad, int button);   // Check if a gamepad button has been pressed once
;; RLAPI bool IsGamepadButtonDown(int gamepad, int button);      // Check if a gamepad button is being pressed
;; RLAPI bool IsGamepadButtonReleased(int gamepad, int button);  // Check if a gamepad button has been released once
;; RLAPI bool IsGamepadButtonUp(int gamepad, int button);        // Check if a gamepad button is NOT being pressed
;; RLAPI int GetGamepadButtonPressed(void);                      // Get the last gamepad button pressed
;; RLAPI int GetGamepadAxisCount(int gamepad);                   // Get axis count for a gamepad
;; RLAPI float GetGamepadAxisMovement(int gamepad, int axis);    // Get movement value for a gamepad axis
;; RLAPI int SetGamepadMappings(const char *mappings);           // Set internal gamepad mappings (SDL_GameControllerDB)
;; RLAPI void SetGamepadVibration(int gamepad, float leftMotor, float rightMotor, float duration); // Set gamepad vibration for both motors (duration in seconds)

;; // Input-related functions: mouse
;; RLAPI bool IsMouseButtonPressed(int button);                  // Check if a mouse button has been pressed once
(cffi:defcfun ("IsMouseButtonPressed" is-mouse-button-pressed) :bool
  (button :int))

;; RLAPI bool IsMouseButtonDown(int button);                     // Check if a mouse button is being pressed
(cffi:defcfun ("IsMouseButtonDown" is-mouse-button-down) :bool
  (button :int))

;; RLAPI bool IsMouseButtonReleased(int button);                 // Check if a mouse button has been released once
(cffi:defcfun ("IsMouseButtonReleased" is-mouse-button-released) :bool
  (button :int))

;; RLAPI bool IsMouseButtonUp(int button);                       // Check if a mouse button is NOT being pressed
(cffi:defcfun ("IsMouseButtonUp" is-mouse-button-up) :bool
  (button :int))

;; RLAPI int GetMouseX(void);                                    // Get mouse position X
;; RLAPI int GetMouseY(void);                                    // Get mouse position Y

;; RLAPI Vector2 GetMousePosition(void);                         // Get mouse position XY
(cffi:defcfun ("GetMousePosition" get-mouse-position) (:struct %vector2))

;; RLAPI Vector2 GetMouseDelta(void);                            // Get mouse delta between frames
;; RLAPI void SetMousePosition(int x, int y);                    // Set mouse position XY
;; RLAPI void SetMouseOffset(int offsetX, int offsetY);          // Set mouse offset
;; RLAPI void SetMouseScale(float scaleX, float scaleY);         // Set mouse scaling
;; RLAPI float GetMouseWheelMove(void);                          // Get mouse wheel movement for X or Y, whichever is larger
;; RLAPI Vector2 GetMouseWheelMoveV(void);                       // Get mouse wheel movement for both X and Y
;; RLAPI void SetMouseCursor(int cursor);                        // Set mouse cursor

;; // Input-related functions: touch
;; RLAPI int GetTouchX(void);                                    // Get touch position X for touch point 0 (relative to screen size)
;; RLAPI int GetTouchY(void);                                    // Get touch position Y for touch point 0 (relative to screen size)
;; RLAPI Vector2 GetTouchPosition(int index);                    // Get touch position XY for a touch point index (relative to screen size)
;; RLAPI int GetTouchPointId(int index);                         // Get touch point identifier for given index
;; RLAPI int GetTouchPointCount(void);                           // Get number of touch points

;; //------------------------------------------------------------------------------------
;; // Gestures and Touch Handling Functions (Module: rgestures)
;; //------------------------------------------------------------------------------------
;; RLAPI void SetGesturesEnabled(unsigned int flags);            // Enable a set of gestures using flags
;; RLAPI bool IsGestureDetected(unsigned int gesture);           // Check if a gesture have been detected
;; RLAPI int GetGestureDetected(void);                           // Get latest detected gesture
;; RLAPI float GetGestureHoldDuration(void);                     // Get gesture hold time in seconds
;; RLAPI Vector2 GetGestureDragVector(void);                     // Get gesture drag vector
;; RLAPI float GetGestureDragAngle(void);                        // Get gesture drag angle
;; RLAPI Vector2 GetGesturePinchVector(void);                    // Get gesture pinch delta
;; RLAPI float GetGesturePinchAngle(void);                       // Get gesture pinch angle

;; //------------------------------------------------------------------------------------
;; // Camera System Functions (Module: rcamera)
;; //------------------------------------------------------------------------------------
;; RLAPI void UpdateCamera(Camera *camera, int mode);            // Update camera position for selected mode
;; RLAPI void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom); // Update camera movement/rotation

;; //------------------------------------------------------------------------------------
;; // Basic Shapes Drawing Functions (Module: shapes)
;; //------------------------------------------------------------------------------------
;; // Set texture and rectangle to be used on shapes drawing
;; // NOTE: It can be useful when using basic shapes and one single font,
;; // defining a font char white rectangle would allow drawing everything in a single draw call
;; RLAPI void SetShapesTexture(Texture2D texture, Rectangle source); // Set texture and rectangle to be used on shapes drawing
;; RLAPI Texture2D GetShapesTexture(void);                 // Get texture that is used for shapes drawing
;; RLAPI Rectangle GetShapesTextureRectangle(void);        // Get texture source rectangle that is used for shapes drawing

;; // Basic shapes drawing functions
;; RLAPI void DrawPixel(int posX, int posY, Color color);                                                   // Draw a pixel using geometry [Can be slow, use with care]
;; RLAPI void DrawPixelV(Vector2 position, Color color);                                                    // Draw a pixel using geometry (Vector version) [Can be slow, use with care]

;; RLAPI void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);                // Draw a line
(cffi:defcfun ("DrawLine" draw-line) :void
  (start-pos-x :int)
  (start-pos-y :int)
  (end-pos-x :int)
  (end-pos-y :int)
  (color (:struct %color)))

;; RLAPI void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);                                     // Draw a line (using gl lines)

;; RLAPI void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);                       // Draw a line (using triangles/quads)
(cffi:defcfun ("DrawLineEx" draw-line-ex) :void
  (start-pos (:struct %vector2))
  (end-pos (:struct %vector2))
  (thick :float)
  (color (:struct %color)))

;; RLAPI void DrawLineStrip(const Vector2 *points, int pointCount, Color color);                            // Draw lines sequence (using gl lines)

;; RLAPI void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);                   // Draw line segment cubic-bezier in-out interpolation

;; RLAPI void DrawCircle(int centerX, int centerY, float radius, Color color);                              // Draw a color-filled circle
(cffi:defcfun ("DrawCircle" draw-circle) :void
  (center-x :int)
  (center-y :int)
  (radius :float)
  (color (:struct %color)))

;; RLAPI void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);      // Draw a piece of a circle
;; RLAPI void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color); // Draw circle sector outline
;; RLAPI void DrawCircleGradient(int centerX, int centerY, float radius, Color inner, Color outer);         // Draw a gradient-filled circle
;; RLAPI void DrawCircleV(Vector2 center, float radius, Color color);                                       // Draw a color-filled circle (Vector version)
(cffi:defcfun ("DrawCircleV" draw-circle-v) :void
  (center (:struct %vector2))
  (radius :float)
  (color (:struct %color)))

;; RLAPI void DrawCircleLines(int centerX, int centerY, float radius, Color color);                         // Draw circle outline
;; RLAPI void DrawCircleLinesV(Vector2 center, float radius, Color color);                                  // Draw circle outline (Vector version)
;; RLAPI void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);             // Draw ellipse
;; RLAPI void DrawEllipseV(Vector2 center, float radiusH, float radiusV, Color color);                      // Draw ellipse (Vector version)
;; RLAPI void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);        // Draw ellipse outline
;; RLAPI void DrawEllipseLinesV(Vector2 center, float radiusH, float radiusV, Color color);                 // Draw ellipse outline (Vector version)
;; RLAPI void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color); // Draw ring
;; RLAPI void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);    // Draw ring outline
;; RLAPI void DrawRectangle(int posX, int posY, int width, int height, Color color);                        // Draw a color-filled rectangle

;; RLAPI void DrawRectangleV(Vector2 position, Vector2 size, Color color);                                  // Draw a color-filled rectangle (Vector version)

(cffi:defcfun ("DrawRectangleV" draw-rectangle-v) :void
  (position (:struct %vector2))
  (size (:struct %vector2))
  (color (:struct %color)))

;; RLAPI void DrawRectangleRec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle
(cffi:defcfun ("DrawRectangleRec" draw-rectangle-rec) :void
  (rec (:struct %rectangle)) ; Assuming Rectangle is defined as %rectangle
  (color (:struct %color)))

;; RLAPI void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
;; RLAPI void DrawRectangleGradientV(int posX, int posY, int width, int height, Color top, Color bottom);   // Draw a vertical-gradient-filled rectangle
;; RLAPI void DrawRectangleGradientH(int posX, int posY, int width, int height, Color left, Color right);   // Draw a horizontal-gradient-filled rectangle
;; RLAPI void DrawRectangleGradientEx(Rectangle rec, Color topLeft, Color bottomLeft, Color bottomRight, Color topRight); // Draw a gradient-filled rectangle with custom vertex colors
;; RLAPI void DrawRectangleLines(int posX, int posY, int width, int height, Color color);                   // Draw rectangle outline
;; RLAPI void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);                            // Draw rectangle outline with extended parameters
;; RLAPI void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);              // Draw rectangle with rounded edges
;; RLAPI void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, Color color);         // Draw rectangle lines with rounded edges
;; RLAPI void DrawRectangleRoundedLinesEx(Rectangle rec, float roundness, int segments, float lineThick, Color color); // Draw rectangle with rounded edges outline

;; RLAPI void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                // Draw a color-filled triangle (vertex in coun1ter-clockwise order!)
(cffi:defcfun ("DrawTriangle" draw-triangle) :void
  (v1 (:struct %vector2))
  (v2 (:struct %vector2))
  (v3 (:struct %vector2))
  (color (:struct %color)))

;; RLAPI void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline (vertex in counter-clockwise order!)
(cffi:defcfun ("DrawTriangleLines" draw-triangle-lines) :void
  (v1 (:struct %vector2))
  (v2 (:struct %vector2))
  (v3 (:struct %vector2))
  (color (:struct %color)))

;; RLAPI void DrawTriangleFan(const Vector2 *points, int pointCount, Color color);                          // Draw a triangle fan defined by points (first vertex is the center)
;; RLAPI void DrawTriangleStrip(const Vector2 *points, int pointCount, Color color);                        // Draw a triangle strip defined by points
;; RLAPI void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);               // Draw a regular polygon (Vector version)
;; RLAPI void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides
;; RLAPI void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color); // Draw a polygon outline of n sides with extended parameters

;; // Splines drawing functions
;; RLAPI void DrawSplineLinear(const Vector2 *points, int pointCount, float thick, Color color);            // Draw spline: Linear, minimum 2 points
;; RLAPI void DrawSplineBasis(const Vector2 *points, int pointCount, float thick, Color color);             // Draw spline: B-Spline, minimum 4 points
;; RLAPI void DrawSplineCatmullRom(const Vector2 *points, int pointCount, float thick, Color color);        // Draw spline: Catmull-Rom, minimum 4 points
;; RLAPI void DrawSplineBezierQuadratic(const Vector2 *points, int pointCount, float thick, Color color);   // Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
;; RLAPI void DrawSplineBezierCubic(const Vector2 *points, int pointCount, float thick, Color color);       // Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
;; RLAPI void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color);                    // Draw spline segment: Linear, 2 points
;; RLAPI void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color); // Draw spline segment: B-Spline, 4 points
;; RLAPI void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color); // Draw spline segment: Catmull-Rom, 4 points
;; RLAPI void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color); // Draw spline segment: Quadratic Bezier, 2 points, 1 control point
;; RLAPI void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color); // Draw spline segment: Cubic Bezier, 2 points, 2 control points

;; // Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]
;; RLAPI Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t);                           // Get (evaluate) spline point: Linear
;; RLAPI Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);              // Get (evaluate) spline point: B-Spline
;; RLAPI Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);         // Get (evaluate) spline point: Catmull-Rom
;; RLAPI Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t);                     // Get (evaluate) spline point: Quadratic Bezier
;; RLAPI Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t);        // Get (evaluate) spline point: Cubic Bezier

;; // Basic shapes collision detection functions
;; RLAPI bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);                                           // Check collision between two rectangles
;; RLAPI bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);        // Check collision between two circles
;; RLAPI bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);                         // Check collision between circle and rectangle
;; RLAPI bool CheckCollisionCircleLine(Vector2 center, float radius, Vector2 p1, Vector2 p2);               // Check if circle collides with a line created betweeen two points [p1] and [p2]
;; RLAPI bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle
;; RLAPI bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);                       // Check if point is inside circle
;; RLAPI bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle
;; RLAPI bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);                // Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
;; RLAPI bool CheckCollisionPointPoly(Vector2 point, const Vector2 *points, int pointCount);                // Check if point is within a polygon described by array of vertices
;; RLAPI bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference
;; RLAPI Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);                                         // Get collision rectangle for two rectangles collision

;; //------------------------------------------------------------------------------------
;; // Texture Loading and Drawing Functions (Module: textures)
;; //------------------------------------------------------------------------------------

;; // Image loading functions
;; // NOTE: These functions do not require GPU access
;; RLAPI Image LoadImage(const char *fileName);                                                             // Load image from file into CPU memory (RAM)
;; RLAPI Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);       // Load image from RAW file data
;; RLAPI Image LoadImageAnim(const char *fileName, int *frames);                                            // Load image sequence from file (frames appended to image.data)
;; RLAPI Image LoadImageAnimFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int *frames); // Load image sequence from memory buffer
;; RLAPI Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize);      // Load image from memory buffer, fileType refers to extension: i.e. '.png'
;; RLAPI Image LoadImageFromTexture(Texture2D texture);                                                     // Load image from GPU texture data
;; RLAPI Image LoadImageFromScreen(void);                                                                   // Load image from screen buffer and (screenshot)
;; RLAPI bool IsImageValid(Image image);                                                                    // Check if an image is valid (data and parameters)
;; RLAPI void UnloadImage(Image image);                                                                     // Unload image from CPU memory (RAM)
;; RLAPI bool ExportImage(Image image, const char *fileName);                                               // Export image data to file, returns true on success
;; RLAPI unsigned char *ExportImageToMemory(Image image, const char *fileType, int *fileSize);              // Export image to memory buffer
;; RLAPI bool ExportImageAsCode(Image image, const char *fileName);                                         // Export image as code file defining an array of bytes, returns true on success

;; // Image generation functions
;; RLAPI Image GenImageColor(int width, int height, Color color);                                           // Generate image: plain color
;; RLAPI Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end);        // Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
;; RLAPI Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);      // Generate image: radial gradient
;; RLAPI Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer);      // Generate image: square gradient
;; RLAPI Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);    // Generate image: checked
;; RLAPI Image GenImageWhiteNoise(int width, int height, float factor);                                     // Generate image: white noise
;; RLAPI Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);           // Generate image: perlin noise
;; RLAPI Image GenImageCellular(int width, int height, int tileSize);                                       // Generate image: cellular algorithm, bigger tileSize means bigger cells
;; RLAPI Image GenImageText(int width, int height, const char *text);                                       // Generate image: grayscale image from text data

;; // Image manipulation functions
;; RLAPI Image ImageCopy(Image image);                                                                      // Create an image duplicate (useful for transformations)
;; RLAPI Image ImageFromImage(Image image, Rectangle rec);                                                  // Create an image from another image piece
;; RLAPI Image ImageFromChannel(Image image, int selectedChannel);                                          // Create an image from a selected channel of another image (GRAYSCALE)
;; RLAPI Image ImageText(const char *text, int fontSize, Color color);                                      // Create an image from text (default font)
;; RLAPI Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);         // Create an image from text (custom sprite font)
;; RLAPI void ImageFormat(Image *image, int newFormat);                                                     // Convert image data to desired format
;; RLAPI void ImageToPOT(Image *image, Color fill);                                                         // Convert image to POT (power-of-two)
;; RLAPI void ImageCrop(Image *image, Rectangle crop);                                                      // Crop an image to a defined rectangle
;; RLAPI void ImageAlphaCrop(Image *image, float threshold);                                                // Crop image depending on alpha value
;; RLAPI void ImageAlphaClear(Image *image, Color color, float threshold);                                  // Clear alpha channel to desired color
;; RLAPI void ImageAlphaMask(Image *image, Image alphaMask);                                                // Apply alpha mask to image
;; RLAPI void ImageAlphaPremultiply(Image *image);                                                          // Premultiply alpha channel
;; RLAPI void ImageBlurGaussian(Image *image, int blurSize);                                                // Apply Gaussian blur using a box blur approximation
;; RLAPI void ImageKernelConvolution(Image *image, const float *kernel, int kernelSize);                    // Apply custom square convolution kernel to image
;; RLAPI void ImageResize(Image *image, int newWidth, int newHeight);                                       // Resize image (Bicubic scaling algorithm)
;; RLAPI void ImageResizeNN(Image *image, int newWidth, int newHeight);                                     // Resize image (Nearest-Neighbor scaling algorithm)
;; RLAPI void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill); // Resize canvas and fill with color
;; RLAPI void ImageMipmaps(Image *image);                                                                   // Compute all mipmap levels for a provided image
;; RLAPI void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);                            // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
;; RLAPI void ImageFlipVertical(Image *image);                                                              // Flip image vertically
;; RLAPI void ImageFlipHorizontal(Image *image);                                                            // Flip image horizontally
;; RLAPI void ImageRotate(Image *image, int degrees);                                                       // Rotate image by input angle in degrees (-359 to 359)
;; RLAPI void ImageRotateCW(Image *image);                                                                  // Rotate image clockwise 90deg
;; RLAPI void ImageRotateCCW(Image *image);                                                                 // Rotate image counter-clockwise 90deg
;; RLAPI void ImageColorTint(Image *image, Color color);                                                    // Modify image color: tint
;; RLAPI void ImageColorInvert(Image *image);                                                               // Modify image color: invert
;; RLAPI void ImageColorGrayscale(Image *image);                                                            // Modify image color: grayscale
;; RLAPI void ImageColorContrast(Image *image, float contrast);                                             // Modify image color: contrast (-100 to 100)
;; RLAPI void ImageColorBrightness(Image *image, int brightness);                                           // Modify image color: brightness (-255 to 255)
;; RLAPI void ImageColorReplace(Image *image, Color color, Color replace);                                  // Modify image color: replace color
;; RLAPI Color *LoadImageColors(Image image);                                                               // Load color data from image as a Color array (RGBA - 32bit)
;; RLAPI Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount);                         // Load colors palette from image as a Color array (RGBA - 32bit)
;; RLAPI void UnloadImageColors(Color *colors);                                                             // Unload color data loaded with LoadImageColors()
;; RLAPI void UnloadImagePalette(Color *colors);                                                            // Unload colors palette loaded with LoadImagePalette()
;; RLAPI Rectangle GetImageAlphaBorder(Image image, float threshold);                                       // Get image alpha border rectangle
;; RLAPI Color GetImageColor(Image image, int x, int y);                                                    // Get image pixel color at (x, y) position

;; // Image drawing functions
;; // NOTE: Image software-rendering functions (CPU)
;; RLAPI void ImageClearBackground(Image *dst, Color color);                                                // Clear image background with given color
;; RLAPI void ImageDrawPixel(Image *dst, int posX, int posY, Color color);                                  // Draw pixel within an image
;; RLAPI void ImageDrawPixelV(Image *dst, Vector2 position, Color color);                                   // Draw pixel within an image (Vector version)
;; RLAPI void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color); // Draw line within an image
;; RLAPI void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);                          // Draw line within an image (Vector version)
;; RLAPI void ImageDrawLineEx(Image *dst, Vector2 start, Vector2 end, int thick, Color color);              // Draw a line defining thickness within an image
;; RLAPI void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);               // Draw a filled circle within an image
;; RLAPI void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);                        // Draw a filled circle within an image (Vector version)
;; RLAPI void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color);          // Draw circle outline within an image
;; RLAPI void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color);                   // Draw circle outline within an image (Vector version)
;; RLAPI void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);       // Draw rectangle within an image
;; RLAPI void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);                 // Draw rectangle within an image (Vector version)
;; RLAPI void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);                                // Draw rectangle within an image
;; RLAPI void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);                   // Draw rectangle lines within an image
;; RLAPI void ImageDrawTriangle(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color);               // Draw triangle within an image
;; RLAPI void ImageDrawTriangleEx(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3); // Draw triangle with interpolated colors within an image
;; RLAPI void ImageDrawTriangleLines(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color);          // Draw triangle outline within an image
;; RLAPI void ImageDrawTriangleFan(Image *dst, const Vector2 *points, int pointCount, Color color);               // Draw a triangle fan defined by points within an image (first vertex is the center)
;; RLAPI void ImageDrawTriangleStrip(Image *dst, const Vector2 *points, int pointCount, Color color);             // Draw a triangle strip defined by points within an image
;; RLAPI void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);             // Draw a source image within a destination image (tint applied to source)
;; RLAPI void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color);   // Draw text (using default font) within an image (destination)
;; RLAPI void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint); // Draw text (custom sprite font) within an image (destination)

;; // Texture loading functions
;; // NOTE: These functions require GPU access
;; RLAPI Texture2D LoadTexture(const char *fileName);                                                       // Load texture from file into GPU memory (VRAM)
;; RLAPI Texture2D LoadTextureFromImage(Image image);                                                       // Load texture from image data
;; RLAPI TextureCubemap LoadTextureCubemap(Image image, int layout);                                        // Load cubemap from image, multiple image cubemap layouts supported
;; RLAPI RenderTexture2D LoadRenderTexture(int width, int height);                                          // Load texture for rendering (framebuffer)
;; RLAPI bool IsTextureValid(Texture2D texture);                                                            // Check if a texture is valid (loaded in GPU)
;; RLAPI void UnloadTexture(Texture2D texture);                                                             // Unload texture from GPU memory (VRAM)
;; RLAPI bool IsRenderTextureValid(RenderTexture2D target);                                                 // Check if a render texture is valid (loaded in GPU)
;; RLAPI void UnloadRenderTexture(RenderTexture2D target);                                                  // Unload render texture from GPU memory (VRAM)
;; RLAPI void UpdateTexture(Texture2D texture, const void *pixels);                                         // Update GPU texture with new data (pixels should be able to fill texture)
;; RLAPI void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels);                       // Update GPU texture rectangle with new data (pixels and rec should fit in texture)

;; // Texture configuration functions
;; RLAPI void GenTextureMipmaps(Texture2D *texture);                                                        // Generate GPU mipmaps for a texture
;; RLAPI void SetTextureFilter(Texture2D texture, int filter);                                              // Set texture scaling filter mode
;; RLAPI void SetTextureWrap(Texture2D texture, int wrap);                                                  // Set texture wrapping mode

;; // Texture drawing functions
;; RLAPI void DrawTexture(Texture2D texture, int posX, int posY, Color tint);                               // Draw a Texture2D
;; RLAPI void DrawTextureV(Texture2D texture, Vector2 position, Color tint);                                // Draw a Texture2D with position defined as Vector2
;; RLAPI void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);  // Draw a Texture2D with extended parameters
;; RLAPI void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);            // Draw a part of a texture defined by a rectangle
;; RLAPI void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint); // Draw a part of a texture defined by a rectangle with 'pro' parameters
;; RLAPI void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint); // Draws a texture (or part of it) that stretches or shrinks nicely

;; // Color/pixel related functions
;; RLAPI bool ColorIsEqual(Color col1, Color col2);                            // Check if two colors are equal
;; RLAPI Color Fade(Color color, float alpha);                                 // Get color with alpha applied, alpha goes from 0.0f to 1.0f
;; RLAPI int ColorToInt(Color color);                                          // Get hexadecimal value for a Color (0xRRGGBBAA)
;; RLAPI Vector4 ColorNormalize(Color color);                                  // Get Color normalized as float [0..1]
;; RLAPI Color ColorFromNormalized(Vector4 normalized);                        // Get Color from normalized values [0..1]
;; RLAPI Vector3 ColorToHSV(Color color);                                      // Get HSV values for a Color, hue [0..360], saturation/value [0..1]
;; RLAPI Color ColorFromHSV(float hue, float saturation, float value);         // Get a Color from HSV values, hue [0..360], saturation/value [0..1]
;; RLAPI Color ColorTint(Color color, Color tint);                             // Get color multiplied with another color
;; RLAPI Color ColorBrightness(Color color, float factor);                     // Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
;; RLAPI Color ColorContrast(Color color, float contrast);                     // Get color with contrast correction, contrast values between -1.0f and 1.0f
;; RLAPI Color ColorAlpha(Color color, float alpha);                           // Get color with alpha applied, alpha goes from 0.0f to 1.0f
;; RLAPI Color ColorAlphaBlend(Color dst, Color src, Color tint);              // Get src alpha-blended into dst color with tint
;; RLAPI Color ColorLerp(Color color1, Color color2, float factor);            // Get color lerp interpolation between two colors, factor [0.0f..1.0f]

;; RLAPI Color GetColor(unsigned int hexValue);                                // Get Color structure from hexadecimal value
(cffi:defcfun ("GetColor" get-color) (:struct %color)
  (hex-value :int))


;; RLAPI Color GetPixelColor(void *srcPtr, int format);                        // Get Color from a source pixel pointer of certain format
;; RLAPI void SetPixelColor(void *dstPtr, Color color, int format);            // Set color formatted into destination pixel pointer
;; RLAPI int GetPixelDataSize(int width, int height, int format);              // Get pixel data size in bytes for certain format

;; //------------------------------------------------------------------------------------
;; // Font Loading and Text Drawing Functions (Module: text)
;; //------------------------------------------------------------------------------------

;; // Font loading/unloading functions
;; RLAPI Font GetFontDefault(void);                                                            // Get the default Font
(cffi:defcfun ("GetFontDefault" get-font-default) (:struct %font))

;; RLAPI Font LoadFont(const char *fileName);                                                  // Load font from file into GPU memory (VRAM)
(cffi:defcfun ("LoadFont" load-font) (:struct %font)
  (file-name :string))

;; RLAPI Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointCount); // Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
(cffi:defcfun ("LoadFontEx" load-font-ex) (:struct %font)
  (file-name :string)
  (font-size :int)
  (codepoints (:pointer :int))
  (codepoint-count :int)) 

;; RLAPI Font LoadFontFromImage(Image image, Color key, int firstChar);                        // Load font from Image (XNA style)
;; RLAPI Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount); // Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
;; RLAPI bool IsFontValid(Font font);                                                          // Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
;; RLAPI GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount, int type); // Load font data for further use
;; RLAPI Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod); // Generate image font atlas using chars info
;; RLAPI void UnloadFontData(GlyphInfo *glyphs, int glyphCount);                               // Unload font chars info data (RAM)

;; RLAPI void UnloadFont(Font font);                                                           // Unload font from GPU memory (VRAM)
(cffi:defcfun ("UnloadFont" unload-font) :void
  (font (:struct %font)))

(defmacro with-font ((font file-name &optional size (codepoints (cffi:null-pointer)) (codepoint-count 0)) &body body)
  (alexandria:once-only (file-name size codepoints codepoint-count)
    `(let ((,font (if ,size
		      (load-font-ex ,file-name  ,size ,codepoints ,codepoint-count)
		      (load-font ,file-name))))
       (unwind-protect
	    (progn ,@body)
	 (unload-font ,font)))))

;; RLAPI bool ExportFontAsCode(Font font, const char *fileName);                               // Export font as code file, returns true on success

;; // Text drawing functions
;; RLAPI void DrawFPS(int posX, int posY);                                                     // Draw current FPS

;; RLAPI void DrawText(const char *text, int posX, int posY, int fontSize, Color color);       // Draw text (using default font)
(cffi:defcfun ("DrawText" draw-text) :void
  (text :string)
  (x :int)
  (y :int)
  (font-size :int)
  (color (:struct %color)))

;; RLAPI void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint); // Draw text using font and additional parameters

;; RLAPI void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint); // Draw text using Font and pro parameters (rotation)
(cffi:defcfun ("DrawTextPro" draw-text-pro) :void
  (font (:struct %font)) ; Assuming Font is a pointer type
  (text :string)
  (position (:struct %vector2))
  (origin (:struct %vector2)) 
  (rotation :float)
  (font-size :float)
  (spacing :float)
  (tint (:struct %color)))

;; RLAPI void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint); // Draw one character (codepoint)

;; RLAPI void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint); // Draw multiple character (codepoint)

;; // Text font info functions
;; RLAPI void SetTextLineSpacing(int spacing);                                                 // Set vertical line spacing when drawing with line-breaks
;; RLAPI int MeasureText(const char *text, int fontSize);                                      // Measure string width for default font

;; RLAPI Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);    // Measure string size for Font
(cffi:defcfun ("MeasureTextEx" measure-text-ex) (:struct %vector2)
  (font (:struct %font))
  (text :string)
  (font-size :float)
  (spacing :float))    

;; RLAPI int GetGlyphIndex(Font font, int codepoint);                                          // Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
;; RLAPI GlyphInfo GetGlyphInfo(Font font, int codepoint);                                     // Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
;; RLAPI Rectangle GetGlyphAtlasRec(Font font, int codepoint);                                 // Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found

;; // Text codepoints management functions (unicode characters)
;; RLAPI char *LoadUTF8(const int *codepoints, int length);                                    // Load UTF-8 text encoded from codepoints array
;; RLAPI void UnloadUTF8(char *text);                                                          // Unload UTF-8 text encoded from codepoints array
;; RLAPI int *LoadCodepoints(const char *text, int *count);                                    // Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
;; RLAPI void UnloadCodepoints(int *codepoints);                                               // Unload codepoints data from memory
;; RLAPI int GetCodepointCount(const char *text);                                              // Get total number of codepoints in a UTF-8 encoded string
;; RLAPI int GetCodepoint(const char *text, int *codepointSize);                               // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
;; RLAPI int GetCodepointNext(const char *text, int *codepointSize);                           // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
;; RLAPI int GetCodepointPrevious(const char *text, int *codepointSize);                       // Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
;; RLAPI const char *CodepointToUTF8(int codepoint, int *utf8Size);                            // Encode one codepoint into UTF-8 byte array (array length returned as parameter)

;; // Text strings management functions (no UTF-8 strings, only byte chars)
;; // WARNING 1: Most of these functions use internal static buffers, it's recommended to store returned data on user-side for re-use
;; // WARNING 2: Some strings allocate memory internally for the returned strings, those strings must be free by user using MemFree()
;; RLAPI int TextCopy(char *dst, const char *src);                                             // Copy one string to another, returns bytes copied
;; RLAPI bool TextIsEqual(const char *text1, const char *text2);                               // Check if two text string are equal
;; RLAPI unsigned int TextLength(const char *text);                                            // Get text length, checks for '\0' ending
;; RLAPI const char *TextFormat(const char *text, ...);                                        // Text formatting with variables (sprintf() style)
;; RLAPI const char *TextSubtext(const char *text, int position, int length);                  // Get a piece of a text string
;; RLAPI char *TextReplace(const char *text, const char *replace, const char *by);             // Replace text string (WARNING: memory must be freed!)
;; RLAPI char *TextInsert(const char *text, const char *insert, int position);                 // Insert text in a position (WARNING: memory must be freed!)
;; RLAPI char *TextJoin(char **textList, int count, const char *delimiter);                    // Join text strings with delimiter
;; RLAPI char **TextSplit(const char *text, char delimiter, int *count);                       // Split text into multiple strings, using MAX_TEXTSPLIT_COUNT static strings
;; RLAPI void TextAppend(char *text, const char *append, int *position);                       // Append text at specific position and move cursor!
;; RLAPI int TextFindIndex(const char *text, const char *find);                                // Find first text occurrence within a string, -1 if not found
;; RLAPI char *TextToUpper(const char *text);                                                  // Get upper case version of provided string
;; RLAPI char *TextToLower(const char *text);                                                  // Get lower case version of provided string
;; RLAPI char *TextToPascal(const char *text);                                                 // Get Pascal case notation version of provided string
;; RLAPI char *TextToSnake(const char *text);                                                  // Get Snake case notation version of provided string
;; RLAPI char *TextToCamel(const char *text);                                                  // Get Camel case notation version of provided string

;; RLAPI int TextToInteger(const char *text);                                                  // Get integer value from text
;; RLAPI float TextToFloat(const char *text);                                                  // Get float value from text

;; //------------------------------------------------------------------------------------
;; // Basic 3d Shapes Drawing Functions (Module: models)
;; //------------------------------------------------------------------------------------

;; // Basic geometric 3D shapes drawing functions
;; RLAPI void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);                                    // Draw a line in 3D world space
;; RLAPI void DrawPoint3D(Vector3 position, Color color);                                                   // Draw a point in 3D space, actually a small line
;; RLAPI void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color); // Draw a circle in 3D world space
;; RLAPI void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);                              // Draw a color-filled triangle (vertex in counter-clockwise order!)
;; RLAPI void DrawTriangleStrip3D(const Vector3 *points, int pointCount, Color color);                      // Draw a triangle strip defined by points
;; RLAPI void DrawCube(Vector3 position, float width, float height, float length, Color color);             // Draw cube
;; RLAPI void DrawCubeV(Vector3 position, Vector3 size, Color color);                                       // Draw cube (Vector version)
;; RLAPI void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);        // Draw cube wires
;; RLAPI void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);                                  // Draw cube wires (Vector version)
;; RLAPI void DrawSphere(Vector3 centerPos, float radius, Color color);                                     // Draw sphere
;; RLAPI void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);            // Draw sphere with extended parameters
;; RLAPI void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);         // Draw sphere wires
;; RLAPI void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color); // Draw a cylinder/cone
;; RLAPI void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color); // Draw a cylinder with base at startPos and top at endPos
;; RLAPI void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color); // Draw a cylinder/cone wires
;; RLAPI void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color); // Draw a cylinder wires with base at startPos and top at endPos
;; RLAPI void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color); // Draw a capsule with the center of its sphere caps at startPos and endPos
;; RLAPI void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color); // Draw capsule wireframe with the center of its sphere caps at startPos and endPos
;; RLAPI void DrawPlane(Vector3 centerPos, Vector2 size, Color color);                                      // Draw a plane XZ
;; RLAPI void DrawRay(Ray ray, Color color);                                                                // Draw a ray line
;; RLAPI void DrawGrid(int slices, float spacing);                                                          // Draw a grid (centered at (0, 0, 0))

;; //------------------------------------------------------------------------------------
;; // Model 3d Loading and Drawing Functions (Module: models)
;; //------------------------------------------------------------------------------------

;; // Model management functions
;; RLAPI Model LoadModel(const char *fileName);                                                // Load model from files (meshes and materials)
;; RLAPI Model LoadModelFromMesh(Mesh mesh);                                                   // Load model from generated mesh (default material)
;; RLAPI bool IsModelValid(Model model);                                                       // Check if a model is valid (loaded in GPU, VAO/VBOs)
;; RLAPI void UnloadModel(Model model);                                                        // Unload model (including meshes) from memory (RAM and/or VRAM)
;; RLAPI BoundingBox GetModelBoundingBox(Model model);                                         // Compute model bounding box limits (considers all meshes)

;; // Model drawing functions
;; RLAPI void DrawModel(Model model, Vector3 position, float scale, Color tint);               // Draw a model (with texture if set)
;; RLAPI void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model with extended parameters
;; RLAPI void DrawModelWires(Model model, Vector3 position, float scale, Color tint);          // Draw a model wires (with texture if set)
;; RLAPI void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model wires (with texture if set) with extended parameters
;; RLAPI void DrawModelPoints(Model model, Vector3 position, float scale, Color tint); // Draw a model as points
;; RLAPI void DrawModelPointsEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model as points with extended parameters
;; RLAPI void DrawBoundingBox(BoundingBox box, Color color);                                   // Draw bounding box (wires)
;; RLAPI void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float scale, Color tint);   // Draw a billboard texture
;; RLAPI void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint); // Draw a billboard texture defined by source
;; RLAPI void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint); // Draw a billboard texture defined by source and rotation

;; // Mesh management functions
;; RLAPI void UploadMesh(Mesh *mesh, bool dynamic);                                            // Upload mesh vertex data in GPU and provide VAO/VBO ids
;; RLAPI void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset); // Update mesh vertex data in GPU for a specific buffer index
;; RLAPI void UnloadMesh(Mesh mesh);                                                           // Unload mesh data from CPU and GPU
;; RLAPI void DrawMesh(Mesh mesh, Material material, Matrix transform);                        // Draw a 3d mesh with material and transform
;; RLAPI void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances); // Draw multiple mesh instances with material and different transforms
;; RLAPI BoundingBox GetMeshBoundingBox(Mesh mesh);                                            // Compute mesh bounding box limits
;; RLAPI void GenMeshTangents(Mesh *mesh);                                                     // Compute mesh tangents
;; RLAPI bool ExportMesh(Mesh mesh, const char *fileName);                                     // Export mesh data to file, returns true on success
;; RLAPI bool ExportMeshAsCode(Mesh mesh, const char *fileName);                               // Export mesh as code file (.h) defining multiple arrays of vertex attributes

;; // Mesh generation functions
;; RLAPI Mesh GenMeshPoly(int sides, float radius);                                            // Generate polygonal mesh
;; RLAPI Mesh GenMeshPlane(float width, float length, int resX, int resZ);                     // Generate plane mesh (with subdivisions)
;; RLAPI Mesh GenMeshCube(float width, float height, float length);                            // Generate cuboid mesh
;; RLAPI Mesh GenMeshSphere(float radius, int rings, int slices);                              // Generate sphere mesh (standard sphere)
;; RLAPI Mesh GenMeshHemiSphere(float radius, int rings, int slices);                          // Generate half-sphere mesh (no bottom cap)
;; RLAPI Mesh GenMeshCylinder(float radius, float height, int slices);                         // Generate cylinder mesh
;; RLAPI Mesh GenMeshCone(float radius, float height, int slices);                             // Generate cone/pyramid mesh
;; RLAPI Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);                   // Generate torus mesh
;; RLAPI Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);                    // Generate trefoil knot mesh
;; RLAPI Mesh GenMeshHeightmap(Image heightmap, Vector3 size);                                 // Generate heightmap mesh from image data
;; RLAPI Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);                               // Generate cubes-based map mesh from image data

;; // Material loading/unloading functions
;; RLAPI Material *LoadMaterials(const char *fileName, int *materialCount);                    // Load materials from model file
;; RLAPI Material LoadMaterialDefault(void);                                                   // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
;; RLAPI bool IsMaterialValid(Material material);                                              // Check if a material is valid (shader assigned, map textures loaded in GPU)
;; RLAPI void UnloadMaterial(Material material);                                               // Unload material from GPU memory (VRAM)
;; RLAPI void SetMaterialTexture(Material *material, int mapType, Texture2D texture);          // Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
;; RLAPI void SetModelMeshMaterial(Model *model, int meshId, int materialId);                  // Set material for a mesh

;; // Model animations loading/unloading functions
;; RLAPI ModelAnimation *LoadModelAnimations(const char *fileName, int *animCount);            // Load model animations from file
;; RLAPI void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);               // Update model animation pose (CPU)
;; RLAPI void UpdateModelAnimationBones(Model model, ModelAnimation anim, int frame);          // Update model animation mesh bone matrices (GPU skinning)
;; RLAPI void UnloadModelAnimation(ModelAnimation anim);                                       // Unload animation data
;; RLAPI void UnloadModelAnimations(ModelAnimation *animations, int animCount);                // Unload animation array data
;; RLAPI bool IsModelAnimationValid(Model model, ModelAnimation anim);                         // Check model animation skeleton match

;; // Collision detection functions
;; RLAPI bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2); // Check collision between two spheres
;; RLAPI bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);                         // Check collision between two bounding boxes
;; RLAPI bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);          // Check collision between box and sphere
;; RLAPI RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius);            // Get collision info between ray and sphere
;; RLAPI RayCollision GetRayCollisionBox(Ray ray, BoundingBox box);                            // Get collision info between ray and box
;; RLAPI RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);               // Get collision info between ray and mesh
;; RLAPI RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);    // Get collision info between ray and triangle
;; RLAPI RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4); // Get collision info between ray and quad

;; //------------------------------------------------------------------------------------
;; // Audio Loading and Playing Functions (Module: audio)
;; //------------------------------------------------------------------------------------
;; typedef void (*AudioCallback)(void *bufferData, unsigned int frames);

;; // Audio device management functions
;; RLAPI void InitAudioDevice(void);                                     // Initialize audio device and context
;; RLAPI void CloseAudioDevice(void);                                    // Close the audio device and context
;; RLAPI bool IsAudioDeviceReady(void);                                  // Check if audio device has been initialized successfully
;; RLAPI void SetMasterVolume(float volume);                             // Set master volume (listener)
;; RLAPI float GetMasterVolume(void);                                    // Get master volume (listener)

;; // Wave/Sound loading/unloading functions
;; RLAPI Wave LoadWave(const char *fileName);                            // Load wave data from file
;; RLAPI Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize); // Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
;; RLAPI bool IsWaveValid(Wave wave);                                    // Checks if wave data is valid (data loaded and parameters)
;; RLAPI Sound LoadSound(const char *fileName);                          // Load sound from file
;; RLAPI Sound LoadSoundFromWave(Wave wave);                             // Load sound from wave data
;; RLAPI Sound LoadSoundAlias(Sound source);                             // Create a new sound that shares the same sample data as the source sound, does not own the sound data
;; RLAPI bool IsSoundValid(Sound sound);                                 // Checks if a sound is valid (data loaded and buffers initialized)
;; RLAPI void UpdateSound(Sound sound, const void *data, int sampleCount); // Update sound buffer with new data (data and frame count should fit in sound)
;; RLAPI void UnloadWave(Wave wave);                                     // Unload wave data
;; RLAPI void UnloadSound(Sound sound);                                  // Unload sound
;; RLAPI void UnloadSoundAlias(Sound alias);                             // Unload a sound alias (does not deallocate sample data)
;; RLAPI bool ExportWave(Wave wave, const char *fileName);               // Export wave data to file, returns true on success
;; RLAPI bool ExportWaveAsCode(Wave wave, const char *fileName);         // Export wave sample data to code (.h), returns true on success

;; // Wave/Sound management functions
;; RLAPI void PlaySound(Sound sound);                                    // Play a sound
;; RLAPI void StopSound(Sound sound);                                    // Stop playing a sound
;; RLAPI void PauseSound(Sound sound);                                   // Pause a sound
;; RLAPI void ResumeSound(Sound sound);                                  // Resume a paused sound
;; RLAPI bool IsSoundPlaying(Sound sound);                               // Check if a sound is currently playing
;; RLAPI void SetSoundVolume(Sound sound, float volume);                 // Set volume for a sound (1.0 is max level)
;; RLAPI void SetSoundPitch(Sound sound, float pitch);                   // Set pitch for a sound (1.0 is base level)
;; RLAPI void SetSoundPan(Sound sound, float pan);                       // Set pan for a sound (0.5 is center)
;; RLAPI Wave WaveCopy(Wave wave);                                       // Copy a wave to a new wave
;; RLAPI void WaveCrop(Wave *wave, int initFrame, int finalFrame);       // Crop a wave to defined frames range
;; RLAPI void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels); // Convert wave data to desired format
;; RLAPI float *LoadWaveSamples(Wave wave);                              // Load samples data from wave as a 32bit float data array
;; RLAPI void UnloadWaveSamples(float *samples);                         // Unload samples data loaded with LoadWaveSamples()

;; // Music management functions
;; RLAPI Music LoadMusicStream(const char *fileName);                    // Load music stream from file
;; RLAPI Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize); // Load music stream from data
;; RLAPI bool IsMusicValid(Music music);                                 // Checks if a music stream is valid (context and buffers initialized)
;; RLAPI void UnloadMusicStream(Music music);                            // Unload music stream
;; RLAPI void PlayMusicStream(Music music);                              // Start music playing
;; RLAPI bool IsMusicStreamPlaying(Music music);                         // Check if music is playing
;; RLAPI void UpdateMusicStream(Music music);                            // Updates buffers for music streaming
;; RLAPI void StopMusicStream(Music music);                              // Stop music playing
;; RLAPI void PauseMusicStream(Music music);                             // Pause music playing
;; RLAPI void ResumeMusicStream(Music music);                            // Resume playing paused music
;; RLAPI void SeekMusicStream(Music music, float position);              // Seek music to a position (in seconds)
;; RLAPI void SetMusicVolume(Music music, float volume);                 // Set volume for music (1.0 is max level)
;; RLAPI void SetMusicPitch(Music music, float pitch);                   // Set pitch for a music (1.0 is base level)
;; RLAPI void SetMusicPan(Music music, float pan);                       // Set pan for a music (0.5 is center)
;; RLAPI float GetMusicTimeLength(Music music);                          // Get music time length (in seconds)
;; RLAPI float GetMusicTimePlayed(Music music);                          // Get current music time played (in seconds)

;; // AudioStream management functions
;; RLAPI AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels); // Load audio stream (to stream raw audio pcm data)
;; RLAPI bool IsAudioStreamValid(AudioStream stream);                    // Checks if an audio stream is valid (buffers initialized)
;; RLAPI void UnloadAudioStream(AudioStream stream);                     // Unload audio stream and free memory
;; RLAPI void UpdateAudioStream(AudioStream stream, const void *data, int frameCount); // Update audio stream buffers with data
;; RLAPI bool IsAudioStreamProcessed(AudioStream stream);                // Check if any audio stream buffers requires refill
;; RLAPI void PlayAudioStream(AudioStream stream);                       // Play audio stream
;; RLAPI void PauseAudioStream(AudioStream stream);                      // Pause audio stream
;; RLAPI void ResumeAudioStream(AudioStream stream);                     // Resume audio stream
;; RLAPI bool IsAudioStreamPlaying(AudioStream stream);                  // Check if audio stream is playing
;; RLAPI void StopAudioStream(AudioStream stream);                       // Stop audio stream
;; RLAPI void SetAudioStreamVolume(AudioStream stream, float volume);    // Set volume for audio stream (1.0 is max level)
;; RLAPI void SetAudioStreamPitch(AudioStream stream, float pitch);      // Set pitch for audio stream (1.0 is base level)
;; RLAPI void SetAudioStreamPan(AudioStream stream, float pan);          // Set pan for audio stream (0.5 is centered)
;; RLAPI void SetAudioStreamBufferSizeDefault(int size);                 // Default size for new audio streams
;; RLAPI void SetAudioStreamCallback(AudioStream stream, AudioCallback callback); // Audio thread callback to request new data

;; RLAPI void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Attach audio stream processor to stream, receives frames x 2 samples as 'float' (stereo)
;; RLAPI void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Detach audio stream processor from stream

;; RLAPI void AttachAudioMixedProcessor(AudioCallback processor); // Attach audio stream processor to the entire audio pipeline, receives frames x 2 samples as 'float' (stereo)
;; RLAPI void DetachAudioMixedProcessor(AudioCallback processor); // Detach audio stream processor from the entire audio pipeline

;; #if defined(__cplusplus)
;; }
;; #endif

;; #endif // RAYLIB_H

