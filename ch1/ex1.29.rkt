#lang sicp

;; Exercise 1.29

;; this solution modified higher-order procedure
;; not recommend here, because we don't want to modify the procedure itself
;; check ex1.29-2.rkt for modifying "term" version

;; higher-order summation
(define (sum term a next b)
  ;; check odd/even
  (define (is-even? x) (= (remainder x 2) 0))
  
  (cond ((> a b) 0)
        ((is-even? a)
         (+ (* 4 (term a))
            (sum term (next a) next b)))
        (else (+ (* 2 (term a))
                 (sum term (next a) next b)))))

;; cube
(define (cube x) (* x x x))

;; inc
(define (inc x) (+ x 1))

;; Simpson's Rule
(define (simpson-integrals f a b n)

  ;; define h
  (define h (/ (- b a) n))

  ;; define y
  (define (y k) (f (+ a (* k h))))
  
  (* (/ h 3)
     (+ (y 0)
        (sum y 1 inc n))))

;; testing procedure
(simpson-integrals cube 0 1.0 100.0)
(simpson-integrals cube 0 1.0 1000.0)

;; testing accuracy
(- (simpson-integrals cube 0 1.0 100.0) 0.25)
(- (simpson-integrals cube 0 1.0 1000.0) 0.25)
