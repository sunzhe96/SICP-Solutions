#lang sicp

;; Exercise 1.31

;; higher-order product

;; recursive process
;; (define (product term a next b)
;;   (if (> a b)
;;       1
;;       (* (term a)
;;          (product term (next a) next b))))

;; iterative process
(define (product term a next b)
  
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
    
    (iter a 1))

;; define factorial using higher-order product
(define (factorial n)
  
  (define (identity x) x)
  (define (inc x) (+ x 1))
  
  (product identity 1 inc n))

;; testing
(factorial 4)


;; compute approxiamtions to pi

(define (pi-approx n)

  (define (is-even? x) (= (remainder x 2) 0))
  
  (define (pi-term x)
    (if (is-even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  
  (define (inc x) (+ x 1))
  
  (* 4 (product pi-term 1.0 inc n)))

;; pi == 3.141593
(pi-approx 100.0)
(pi-approx 1000.0)
(pi-approx 10000.0)
(pi-approx 100000.0)
;; five digits correct
(pi-approx 1000000.0)
