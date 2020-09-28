#lang sicp

;; Exercise 2.11

;; constructor
(define (make-interval x y) (cons x y))

;; selector
(define (upper-bound z) (max (car z) (cdr z)))
(define (lower-bound z) (min (car z) (cdr z)))

(define (positive-interval? x)
  (and (>= (lower-bound x) 0)
       (> (upper-bound x) 0)))

(define (negative-interval? x)
  (and (< (lower-bound x) 0)
       (<= (upper-bound x) 0)))

(define (opposite-interval? x)
  (< (* (lower-bound x)
        (upper-bound x)) 0))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
                (lower-bound y)))
         (p2 (* (lower-bound x) 
                (upper-bound y)))
         (p3 (* (upper-bound x) 
                (lower-bound y)))
         (p4 (* (upper-bound x) 
                (upper-bound y))))
    (cond ((positive-interval? x)
           (cond ((positive-interval? y)
                  (make-interval p1 p4))
                 ((negative-interval? y)
                  (make-interval p3 p2))
                 ((opposite-interval? y)
                  (make-interval p3, p2))))
          ((negative-interval? x)
           (cond ((positive-interval? y)
                  (make-interval p2, p3))
                 ((negative-interval? y)
                  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))
                 ((opposite-interval? y)
                  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))))
          ((opposite-interval? x)
           (cond ((positive-interval? y)
                  (make-interval p2 p3))
                 ((negative-interval? y)
                  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))
                 ((opposite-interval? y) (min p1 p2 p3 p4) (max p1 p2 p3 p4)))))))
