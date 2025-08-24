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
			     (:file "physics2d")
			     (:file "gamebits")))
	       (:module "examples"
		:components ((:file "spinning-text")
			     (:file "buttons")
			     (:file "physics-1")
			     (:file "examples"))))
  :in-order-to ((test-op (test-op :gamebits/test))))

(asdf:defsystem #:gamebits/test
  :description "Test suite for gamebits"
  :author "Your Name <"
  :depends-on (#:gamebits
	       #:fiveam)
  :serial t
  :components ((:module "test"
		:components ((:file "test")
			     (:file "vector-math-test"))))
  :perform (test-op (op c)
		    (symbol-call :fiveam 'run!
				 (find-symbol* :gamebits-test :gamebits/test))))
