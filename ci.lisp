(uiop:define-package #:gamebits/ci
  (:use #:cl)
  (:mix #:40ants-ci
	#:40ants-ci/workflow
	#:40ants-ci/steps/sh
	#:40ants-ci/steps/action
	#:40ants-ci/jobs/linter
	#:40ants-ci/jobs/run-tests
	#:40ants-ci/jobs/docs))

(in-package #:gamebits/ci)


(defparameter *lib-steps*
  (list (sh "Install raylib..."
	    "sudo add-apt-repository ppa:texus/raylib && sudo apt-get update && sudo apt-get install -y libraylib5-dev")
	(sh "install libgl-dev"
	    "sudo apt-get install libgl-dev")
	(action "checkout raygui"
		"actions/checkout@v4"
		:repository "raysan5/raygui"
		:path "raygui"
		:ref "master")
	(sh "compile raygui lib"
	    "cd raygui 
             mv src/raygui.h src/raygui.c 
             gcc -o raygui.so src/raygui.c -shared -fpic -DRAYGUI_IMPLEMENTATION -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 
             sudo cp raygui.so /usr/lib/ 
             mv src/raygui.c src/raygui.h")))

(defworkflow ci
  :on-pull-request t
  :jobs (;; Linter and critic jobs do not work yet because they need a hook
	 ;; to install and build the raylib dependencies like the run-tests
	 ;; job does.
	 ;;(40ants-ci/jobs/linter:linter :steps-before *lib-steps*)
         ;;(40ants-ci/jobs/critic:critic)
	 (40ants-ci/jobs/run-tests:run-tests
	  :steps-before *lib-steps*
          :coverage t)))
