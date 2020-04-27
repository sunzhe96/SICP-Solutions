#lang sicp

;; Exercise 1.29

;; modify "term" version

;; higher-order summation
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; cube
(define (cube x) (* x x x))

;; inc
(define (inc x) (+ x 1))

;; Simpson's Rule
(define (simpson-integrals f a b n)

  ;; define h
  (define h (/ (- b a) n))

  ;; check odd/even
  (define (is-even? x)
    (= (remainder x 2) 0))

  ;; define y
  (define (y k) (f (+ a (* k h))))
  
  ;; define simpson-term
  (define (simpson-term k)
     (if (is-even? k)
        (* 4 (y k))
        (* 2 (y k))))
  
  ;; retrun value
  (* (/ h 3)
     (+ (y 0)
        (sum simpson-term 1 inc n))))

;; testing procedure
(simpson-integrals cube 0 1.0 100.0)
(simpson-integrals cube 0 1.0 1000.0)

;; testing accuracy
(- (simpson-integrals cube 0 1.0 100.0) 0.25)
(- (simpson-integrals cube 0 1.0 1000.0) 0.25)
