(asdf:initialize-source-registry
   `(:source-registry
     (:tree ,(uiop:getcwd))
     :ignore-inherited-configuration))

(asdf:load-system "slynk")
(slynk:create-server :port 4005 :dont-close t)

(asdf:load-system :gamebits)

(in-package #:cl-user)
(use-package 'gamebits)
(use-package 'gamebits/examples)
