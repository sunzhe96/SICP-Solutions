#lang sicp

;; Exercise 1.3
(define (>= x y) (not (< x y)))
(define (<= x y) (not (> x y)))
(define (squar x) (* x x))
(define (sum-of-squares x y) (+ (squar x) (squar y)))
(define (sum-of-squares-two-larger-numbers x y z)
  (cond ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        ((and (>= y x) (>= z x)) (sum-of-squares y z))))
testing code for 1.3
(sum-of-squares-two-larger-numbers 1 2 3)
(sum-of-squares-two-larger-numbers 2 1 3)
(sum-of-squares-two-larger-numbers 3 2 1)
(sum-of-squares-two-larger-numbers 3 1 1)
(sum-of-squares-two-larger-numbers 1 1 3)
(sum-of-squares-two-larger-numbers 1 3 1)
(sum-of-squares-two-larger-numbers 3 3 1)
(sum-of-squares-two-larger-numbers 3 1 3)
(sum-of-squares-two-larger-numbers 1 3 3)
