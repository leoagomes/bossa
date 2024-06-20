#lang at-exp racket

;; limitations:
;; - no require
;; - no keyword arguments

;; no when yet

;; TODO: fail with better error message on unsupported syntax

(define-syntax-rule (B-define (name arg ...) body-1 body-rest ...)
  (define (name arg ...)
    body-1
    body-rest ...))

(define-syntax B-let-values
  (syntax-rules ()
    [(_ ([(id) expr] ...) body ...)
     ((lambda (id ...) body ...) expr ...)]))
(define-syntax B-let
  (syntax-rules ()
    [(_ ([id expr] ...) body ...)
     (B-let-values ([(id) expr] ...) body ...)]))

(define-syntax (B-cond stx)
  (syntax-case stx (=> else)
    [(_)
     (raise-syntax-error #f "bad syntax: empty cond")]
    [(_ [else => else-expr])
     #'else-expr]
    [(_ [test-expr => then-expr] rest ...)
     #'(if test-expr
           then-expr
           (B-cond rest ...))]))
(define-syntax (B-case stx)
  (syntax-case stx (=> else)
    [(_)
     (raise-syntax-error #f "bad syntax: empty case")]
    [(_ _)
     (raise-syntax-error #f "bad syntax: case requires at least one clause")]
    [(_ key [(value) => then-expr] ... [else => else-expr])
    ;; memoize key with B-let, expand clauses with B-cond
     #'(B-let ([k key])
         (B-cond [(equal? k value) => then-expr] ...
                 [else => else-expr]))]))

(provide #%plain-app
         #%top
        ;  #%top-interaction ; todo!
         #%module-begin
         #%datum
         lambda
         if and or not
         else
         =>
         + - * / modulo equal? < > <= >= bitwise-and bitwise-ior bitwise-xor
         zero?)
(provide (rename-out [#%plain-app #%app]))
(provide (rename-out [B-define define]
                     [B-let let]
                     [B-let-values let-values]
                     [B-cond cond]
                     [B-case case]))


; to support:

;         <Operation> ::=
; | "+"
; | "-"
; | "*"
; | "/"
; | "%"
; | "="
; | "!"
; | "<"
; | ">"
; | "&"
; | "|"
; | "^"
; | ">>"  -- (SHR)
; | "<<"  -- (SHL)
; | ":-"  -- (FP_SUB)
; | ":/"  -- (FP_DIV)
; | ":%"  -- (FP_REM)
; | ":>>" -- (FP_SHR)
; | ":<<" -- (FP_SHL)
