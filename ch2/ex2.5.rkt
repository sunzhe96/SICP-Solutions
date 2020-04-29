#lang sicp

;; Exercise 2.5

;; order
(define (make-order-pair a b) (cons a b))
(define (select-first order-pair) (car order-pair))
(define (select-second order-pair) (cdr order-pair))


;; compute integer product with corresponding order

;; expoentiation
(define (exp base times)
  (define (iter product n)
    (if (= n 1)
        product
        (iter (* base product) (- n 1))))
  (iter base times))

(define (pair-product order-pair)
  (let ((a (select-first order-pair))
        (b (select-second order-pair)))
    (* (exp 2 a) (exp 3 b))))

;; testing
(pair-product (make-order-pair 2 3))
(exp 2 2)
