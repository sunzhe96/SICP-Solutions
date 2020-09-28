#lang sicp

;; Exercise 1.35

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  
  (define (close-enough? v1 v2)
    (< (abs(- v1 v2))
       tolerance))
  
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  
  (try first-guess))

;; golden ratio φ satisfies this equation
;; φ^2 = φ + 1
;; divide φ both sides
;; φ = 1 + 1 / φ
;; φ is the  fixed point of equation 1 + 1 / φ

;; to compute φ using the procedure provided in sicp
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
