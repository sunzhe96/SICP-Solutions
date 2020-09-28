#lang sicp

;; Exercise 2.3


;; point libary
;; constructor
(define (make-point x y) (cons x y))
;; selector
(define (x-point point) (car point))
(define (y-point point) (cdr point))

;; segment library
;; constructor
(define (make-segment start end) (cons start end))
;; selector
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

;; rectangle library
;; constructor
(define (make-rectangle width height) (cons width height))
;; selector
(define (select-width rectangle) (car rectangle))
(define (select-height rectangle) (cdr rectangle))


;; arithmetic library

;; point distance
;; compute fixed point of a function
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

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (sqrt x)
  (fixed-point
   (average-damp
    (lambda (y) (/ x y)))
   1.0))

(define (square x) (* x x))

(define (point-distance a b)
  (let ((xa (x-point a))
        (xb (x-point b))
        (ya (y-point a))
        (yb (y-point b)))
    (sqrt (+ (square (- yb ya))
             (square (- xb xa))))))

(define (length segment)
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (point-distance a b)))

;; perimeter
(define (perimeter rectangle)
  (let ((width (select-width rectangle))
        (height (select-height rectangle)))
   (+ (* 2 (length width))
      (* 2 (length height)))))

;; area
(define (area rectangle)
  (let ((width (select-width rectangle))
        (height (select-height rectangle)))
    (* (length width)
       (length height))))

;; testing
(define a (make-point 1 1))
(define b (make-point 4 1))
(define c (make-point 4 3))
(define d (make-point 1 3))

(define width (make-segment a b))
(define height (make-segment b c))

(define rec (make-rectangle width height))

(perimeter rec)
(area rec)
