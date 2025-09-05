;;;; gamebits.asd

(asdf:defsystem #:gamebits
  :description "Describe gamebits here"
  :author "Anthony Fairchild <fairchild.anthony@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:uiop
	       #:float-features
	       #:trivial-main-thread
	       #:livesupport
	       #:cffi
	       #:cffi-libffi)
  :components ((:module "src"
		:components ((:module "raylib"
			      :components ((:file "raylib")
					   (:file "raygui")
					   (:file "rlgl")))
			     (:file "vector-math")
			     (:file "physics2d")
			     (:file "gamebits"))))
  :in-order-to ((test-op (test-op :gamebits/test))))


(asdf:defsystem #:gamebits/examples
  :description "Examples for gamebits"
  :author "Anthony Fairchild <fairchild.anthony@gmail.com>"
  :license "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:gamebits)
  :components ((:module "examples"
		:components ((:file "spinning-text")
			     (:file "buttons")
			     (:file "physics-1")
			     (:file "transforms")
			     (:file "examples")))))

(asdf:defsystem #:gamebits/test
  :description "Test suite for gamebits"
  :author "Anthony Fairchild <fairchild.anthony@gmail.com>"
  :license "Specify license here"
  :version "0.0.1"
  :depends-on (#:gamebits
	       #:fiveam)
  :serial t
  :components ((:module "test"
		:components ((:file "test")
			     (:file "vector-math-test"))))
  :perform (test-op (op c)
		    (symbol-call :fiveam 'run!
				 (find-symbol* :gamebits-test :gamebits/test))))
