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
  :components ((:file "macros")
	       (:file "context")
	       (:file "gamebits")))

(asdf:defsystem #:gamebits/raylib
  :description "Raylib context for gamebits"
  :author "Your Name <"
  :depends-on (#:gamebits
	       #:uiop
	       #:cffi
	       #:cffi-libffi)
  :components ((:file "raylib")
	       (:file "raylib-context")
	       (:file "example-1")))
