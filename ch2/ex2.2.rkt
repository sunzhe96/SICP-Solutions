#lang sicp

;; Exercise 2.2

;; constructor
;; point
(define (make-point x y) (cons x y))
;; segment
(define (make-segment start end) (cons start end))

;; selector
;; point
(define (x-point point) (car point))
(define (y-point point) (cdr point))

;; segment
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

;; midpoint
(define (midpoint segment)
  (let ((start-point (start-segment segment))
        (end-point (end-segment segment)))
    (make-point (/ (+ (x-point start-point) (x-point end-point)) 2)
                (/ (+ (y-point start-point) (y-point end-point)) 2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define a (make-point 1 5))
(define b (make-point 3 1))
(define seg1 (make-segment a b))
(print-point (midpoint seg1))
