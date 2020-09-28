#lang sicp

;; Exercise 2.1

;; computing greatest common factor
(define (gcd v1 v2)
  (if (= v2 0)
      v1
      (gcd v2 (remainder v1 v2))))

;; constructor
(define (make-rat n d)
  (let ((factor (gcd n d)))
    (let ((numer (/ n factor))
          (denom (/ d factor)))
      ;; postive rat
      (if (or (and (> numer 0) (> denom 0))
              (and (< numer 0) (< denom 0)))
          (cons numer denom)
          ;; negative rat
          (cons (- (abs numer)) (abs denom))))))

;; selector
(define (numer x) (car x))
(define (denom x) (cdr x))

;; print rat number
(define (print-rat x)
  (newline)
  (display (numer x))
  ;; if denom is 1 then don't print it
  (cond ((= (denom x) 1) (display ""))
        (else
         (display "/")
         (display (denom x)))))

;; testing
;; both positive
(print-rat (make-rat 2 4))
;; numer positive
(print-rat (make-rat 2 -4))
;; denom positive
(print-rat (make-rat -2 4))
;; both negative
(print-rat (make-rat -2 -4))
