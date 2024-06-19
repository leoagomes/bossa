#lang info
(define collection "bossa")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/bossa.scrbl" ())))
(define pkg-desc "A Scheme-based language that compiles to the HVM.")
(define version "0.0")
(define pkg-authors '(leoagomes))
(define license '(MIT))
