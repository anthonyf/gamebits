(uiop:define-package #:gamebits/raygui
  (:use #:cl)
  (:mix #:gamebits/raylib)
  (:import-from #:cffi)
  (:export #:gui-enable
	   #:gui-disable
	   #:with-gui
	   #:gui-lock
	   #:gui-unlock
	   #:with-gui-lock
	   #:gui-is-locked
	   #:gui-set-alpha
	   #:gui-set-state
	   #:gui-get-state
	   #:gui-set-font
	   #:gui-get-font
	   #:gui-set-style	   
	   #:gui-get-style
	   #:+DEFAULT+
	   #:+BACKGROUND-COLOR+
	   #:gui-button
	   #:gui-checkbox)
  )

(in-package #:gamebits/raygui)


(cffi:define-foreign-library raygui
  (:darwin "/opt/homebrew/opt/raylib/lib/raygui.dynlib")
  (:unix "raygui.so")
  (:windows "raygui.dll")
  )


(cffi:use-foreign-library raygui)

;; void GuiEnable(void)
(cffi:defcfun ("GuiEnable" gui-enable) :void)

;; RAYGUIAPI void GuiDisable(void);                                // Disable gui controls (global state)
(cffi:defcfun ("GuiDisable" gui-disable) :void)

(defmacro with-gui (() &body body)
  `(progn
     (gui-enable)
     (unwind-protect
	  ,@body
       (gui-disable))))


;; RAYGUIAPI void GuiLock(void);                                   // Lock gui controls (global state)
(cffi:defcfun ("GuiLock" gui-lock) :void)

;; RAYGUIAPI void GuiUnlock(void);                                 // Unlock gui controls (global state)
(cffi:defcfun ("GuiUnlock" gui-unlock) :void)

(defmacro with-gui-lock (() &body body)
  `(progn
     (gui-lock)
     (unwind-protect
	  ,@body
       (gui-unlock))))

;; RAYGUIAPI bool GuiIsLocked(void);                               // Check if gui is locked (global state)
(cffi:defcfun ("GuiIsLocked" gui-is-locked) :bool)

;; RAYGUIAPI void GuiSetAlpha(float alpha);                        // Set gui controls alpha (global state), alpha goes
(cffi:defcfun ("GuiSetAlpha" gui-set-alpha) :void
  (alpha :float))

;; RAYGUIAPI void GuiSetState(int state);                          // Set gui state (global state)
(cffi:defcfun ("GuiSetState" gui-set-state) :void
  (state :int))

;; RAYGUIAPI int GuiGetState(void);                                // Get gui state (global state)
(cffi:defcfun ("GuiGetState" gui-get-state) :int)

;; // Font set/get functions
;; RAYGUIAPI void GuiSetFont(Font font);                           // Set gui custom font (global state)
(cffi:defcfun ("GuiSetFont" gui-set-font) :void
  (font (:struct %font)))

;; RAYGUIAPI Font GuiGetFont(void);                                // Get gui custom font (global state)
(cffi:defcfun ("GuiGetFont" gui-get-font) (:struct %font))

;; // Style set/get functions
;; RAYGUIAPI void GuiSetStyle(int control, int property, int value); // Set one style property
(cffi:defcfun ("GuiSetStyle" gui-set-style) :void
  (control :int)
  (property :int)
  (value :int))

;; RAYGUIAPI int GuiGetStyle(int control, int property);           // Get one style property
(cffi:defcfun ("GuiGetStyle" gui-get-style) :int
  (control :int)
  (property :int))

(defparameter +DEFAULT+ 0)
(defparameter +BACKGROUND-COLOR+ 16)

;; RAYGUIAPI int GuiButton(Rectangle bounds, const char *text);                                           // Button control, returns true when clicked

(cffi:defcfun ("GuiButton" gui-button) :bool
  (bounds (:struct %rectangle))
  (text :string))

;; RAYGUIAPI int GuiCheckBox(Rectangle bounds, const char *text, bool *checked);                          // Check Box control, returns true when active
(cffi:defcfun ("GuiCheckBox" %gui-checkbox) :bool
  (bounds (:struct %rectangle))
  (text :string)
  (checked (:pointer :bool)))

(defmacro gui-checkbox (bounds text checked)
  `(cffi:with-foreign-object (checked-ptr :bool)
     (setf (cffi:mem-aref checked-ptr :bool 0) ,checked)
     (let ((result (%gui-checkbox ,bounds ,text checked-ptr)))
       (setf ,checked (cffi:mem-aref checked-ptr :bool 0))
       result)))
