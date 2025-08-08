(require :asdf)

(asdf:initialize-source-registry
   `(:source-registry
     (:directory ,(uiop:getcwd))
     :ignore-inherited-configuration))

(asdf:load-system "slynk")
(slynk:create-server :dont-close t)

(asdf:load-system :gamebits)
(in-package #:cl-user)
(use-package 'gamebits )
(use-package 'gamebits/examples)

(defmacro run-game-with-restarts (&body body)
  `(loop while t
	 do (restart-case (progn
			    (asdf:load-system :gamebits)
			    ,@body
			    (error "game ended")
			    )
      
	      (continue ()
		:report "restart the game")
	      (quit-lisp () :report "quit lisp"
		(format t "Continuing lisp...~%")
		(slynk:quit-lisp)
		(uiop:quit)))))

(run-game-with-restarts
  (buttons))
