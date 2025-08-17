;;; Load SB-COVER
(require :sb-cover)

;;; Turn on generation of code coverage instrumentation
;;; in the compiler
(declaim (optimize sb-cover:store-coverage-data))

;;; Load some code, ensuring that it's recompiled
;;; with the new optimization policy.
(asdf:oos 'asdf:load-op :gamebits :force t)
;;(asdf:oos 'asdf:load-op :gamebits/test :force t)

;;; Run the test suite.
(fiveam:run! 'gamebits/test:gamebits-test)

(sb-cover:report (asdf:system-relative-pathname :gamebits/test "coverage/"))

(declaim (optimize (sb-cover:store-coverage-data 0)))
