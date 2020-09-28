#lang sicp

;; Exercise 2.6

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


;; one
(define one (lambda (f) (lambda (x) (f x)))) 

;; two
(define two (lambda (f) (lambda (x) (f (f x)))))

;; +
(define (add m n)
    (lambda (f)
      (lambda (x) ((m f) (n f) x))))
