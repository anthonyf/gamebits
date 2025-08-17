(uiop:define-package #:gamebits/test
  (:use #:cl)
  (:mix #:fiveam)
  (:mix-reexport #:gamebits/vector-math-test)
  (:export #:gamebits-test))

(in-package #:gamebits/test)

(def-suite* gamebits-test)
