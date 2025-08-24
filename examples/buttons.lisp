(uiop:define-package #:gamebits/examples/buttons
  (:use #:cl)
  (:mix #:gamebits)
  (:export #:buttons))

(in-package #:gamebits/examples/buttons)


(let ((toggled nil))
 (defun update ()
   (with-drawing ()
     (clear-background (get-color (gui-get-style +DEFAULT+ +BACKGROUND-COLOR+)))
       (when (gui-button (make-rectangle :x 100.0 :y 100.0 :width 200.0 :height 80.0) "Click Me!")
	 (format t "Button Clicked!~%"))
       (when (gui-checkbox (make-rectangle :x 100 :y 250 :width 20 :height 20) "Check Me!" toggled)
	 (format t "Checkbox Toggled! ~A~%" toggled)))))

(defun buttons()
  (with-window (800 600 "Buttons Example")
    (gui-set-font (get-font-default))
    (gui-set-style +DEFAULT+ +TEXT-SIZE+ 20)
    (loop :until (window-should-close)
	  do (livesupport:continuable
	       (funcall 'update)))))
