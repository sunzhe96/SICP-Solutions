#lang sicp

;; Exercise 3.1

(define (make-accumulator init)
  (lambda (add)
    (begin (set! init (+ init add))
           init)))

(define A (make-accumulator 5))

;; testing
(A 10)
(A 10)
