;;;; gamebits.asd

(asdf:defsystem #:gamebits
  :description "Describe gamebits here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:uiop
	       #:float-features
	       #:trivial-main-thread
	       #:livesupport)
  :components ((:module "src" :components ((:file "color")
					   (:file "macros")
					   (:file "context")
					   (:file "imgui")
					   (:file "gamebits")))))

(asdf:defsystem #:gamebits/raylib
  :description "Raylib context for gamebits"
  :author "Your Name <"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:gamebits
	       #:uiop
	       #:cffi
	       #:cffi-libffi)
  :components ((:module "raylib"
		:components ((:file "raylib")
			     (:file "raylib-context")))))

(asdf:defsystem #:gamebits/examples
  :description "Examples for gamebits"
  :author "Your Name <"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:gamebits/raylib)
  :components ((:module "examples"
		:components ((:file "spinning-text")
			     (:file "buttons")
			     (:file "examples")))))
