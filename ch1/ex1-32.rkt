#lang sicp

;; Exercise 1.32

;; recursive process
;; (define (accumulate combiner null-value term a next b)

;;   (if (> a b)
;;       null-value
;;       (combiner (term a)
;;                 (accumulate combiner null-value term (next a) next b))))

;; iterative process

(define (accumulate combiner null-value term a next b)

  (define (iter a result)
    (if (> a b)
        result
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))

  (iter a null-value))

;; summation
(define (sum term a next b)
  (accumulate + 0 term a next b))

;; testing
(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (cube-sum a b)
  (sum cube a inc b))

(cube-sum 2 4)

;; multiplication
(define (product term a next b)
  (accumulate * 1 term a next b))

;; testing by factorial definition
(define (factorial n)
  
  (define (identity x) x)
  (define (inc x) (+ x 1))
  
  (product identity 1 inc n))

(factorial 4)




