#lang sicp

;; 2.1.1 Example: Arithmetic Operations for Rational Numbers

;; computing greatest common factor
(define (gcd v1 v2)
  (if (= v2 0)
      v1
      (gcd v2 (remainder v1 v2))))

;; constructor
(define (make-rat n d)
  (let ((factor (gcd n d)))
    (cons (/ n factor) (/ d factor))))

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

;; computation rules for rat numbers
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (eqaul-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

;; testing
(print-rat (make-rat 10 10))

(print-rat (add-rat (make-rat 1 2) (make-rat 3 4)))

;; 2.1.4

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y)))))
  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
