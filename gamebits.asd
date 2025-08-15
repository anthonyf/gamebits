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
	       #:livesupport
	       #:cffi
	       #:cffi-libffi)
  :components ((:module "raylib"
		:components ((:file "raylib")
			     (:file "raygui")
			     (:file "rlgl")))
	       (:module "src"
		:components ((:file "vector-math")
			     (:file "gamebits")))
	       (:module "examples"
		:components ((:file "spinning-text")
			     (:file "buttons")
			     (:file "examples")))))
