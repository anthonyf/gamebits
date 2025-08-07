(uiop:define-package #:gamebits/examples
  (:use #:cl)
  (:mix #:gamebits)
  (:mix-reexport #:gamebits/examples/spinning-text
		 #:gamebits/examples/buttons
		 )
  (:export ))

(in-package #:gamebits/examples)
