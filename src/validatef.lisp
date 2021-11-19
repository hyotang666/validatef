(in-package :cl-user)

(defpackage :validatef
  (:use :cl)
  (:export #:validatef))

(in-package :validatef)

(defmacro validatef (&body clauses)
  `(progn
    ,@(loop :for (place key on-fail) :on clauses :by #'cdddr
            :with symbol := (gensym "VALUE")
            :collect `(handler-case (values ,key)
                        (error ()
                          ,on-fail)
                        ,@(when place
                            `((:no-error (,symbol) (setf ,place ,symbol))))))))

(defun pprint-validatef (stream exp)
  (setf stream (or stream *standard-output*))
  (funcall (formatter "~:<~W~^~1I ~_~@{~W~^ ~:I~W~^ ~:_~W~^ ~1I~_~}~:>") stream
           exp))

