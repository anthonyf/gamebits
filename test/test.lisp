(uiop:define-package #:gamebits/test
  (:use #:cl)
  (:mix #:fiveam)
  (:export #:gamebits-test))

(in-package #:gamebits/test)

(def-suite* gamebits-test)
