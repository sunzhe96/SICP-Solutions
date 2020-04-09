#lang sicp

;; Exercise 1.29

;; higher order summation (sigma notation in mathematic)
(define (sum a b next term)
  (if (> a b)
      0
      (+ (term a)
         (sum (next a) b next term))))

;; check an interger whether it is an even number
(define (even? x) (= (remainder x 2) 0))

;; define simpson's method of integration
(define (simpson-integral a b f n)
  
  (define h
    (/ (- b a) n))

  (define (y-k k f)
    (f (+ a (* k h))))

  (define (y-term k)
    (if (even? k)
       (* 4 (y-k (+ k 1) f))
       (* 2 (y-k (+ k 1) f))))

  (define (inc n) (+ n 1))

  (* (/ h 3) (sum 0 n inc y-term)))

(define (cube n) (* n n n))

;; testing
(simpson-integral 0 1.0 cube 100)
(simpson-integral 0 1.0 cube 1000)
