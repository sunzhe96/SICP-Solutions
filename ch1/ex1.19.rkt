#lang sicp

;; Exercise 1.19

;; Searching for divisors

(define (smallest-divisor n)
  
  (define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
         ((= (remainder n test-divisor) 0) test-divisor)
         (else (find-divisor n (+ 1 test-divisor)))))
  
  (define (square x) (* x x))

  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))
