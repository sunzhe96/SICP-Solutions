#lang sicp

;; Exercise 1.30

;; iterative process

(define (sum term a next b)
    ;; define iterative procedure
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  ;; return this procedure
  (iter a 0))

;; testing
;; define cube sum
(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (cube-sum a b)
  (sum cube a inc b))
