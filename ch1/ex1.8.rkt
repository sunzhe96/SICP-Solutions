#lang sicp

;; Exercise 1.8 Newton's Method for Cube Roots

(define (cube-iter guess x)
  (if (good-enough-cube? guess x)
     guess
     (cube-iter (improve guess x) x)))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (good-enough-cube? guess x)
  (<= (abs (- (cube guess) x)) 0.001))


(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))

(cube-iter 1.0 -75)
