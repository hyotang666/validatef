; vim: ft=lisp et
(in-package :asdf)
(defsystem "validatef.test"
  :version
  "0.0.0"
  :depends-on
  (:jingoh "validatef")
  :components
  ((:file "validatef"))
  :perform
  (test-op (o c) (declare (special args))
   (apply #'symbol-call :jingoh :examine :validatef args)))