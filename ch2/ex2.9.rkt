#lang sicp

;; Exercise 2.9

(define (make-interval x y) (cons x y))

(define (upper-bound z) (max (car z) (cdr z)))
(define (lower-bound z) (min (car z) (cdr z)))

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
               (upper-bound y))))
  (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (width z)
 (* 0.5 (- (upper-bound z) (lower-bound z))))

(define a (make-interval 2 4))
(define b (make-interval 5 9))

(width a)
(width b)
;;
(+ (width a) (width b))
(width (add-interval a b))

;;
(* (width a) (width b))
(width (mul-interval a b)) 
