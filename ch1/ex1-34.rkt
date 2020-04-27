#lang sicp

(define (square x) (* x x))
(define (f g) (g 2))
(f square)

(f (lambda (z) (* z (+ z 1))))

;; rackey sicp lang return error:
;; application: not a procedure;
;  expected a procedure that can be applied to arguments
(f f)
