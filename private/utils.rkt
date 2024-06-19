#lang racket

(define (call-with-read-accept-reader value fn)
  (let ([previous (read-accept-reader)])
    (read-accept-reader value)
    (let ([result (fn)])
      (read-accept-reader previous)
      result)))

(define (read-syntax-file name)
  (call-with-read-accept-reader #t
    (lambda ()
      (call-with-input-file name
        (lambda (file)
          (read-syntax name file))))))

(provide read-syntax-file)
