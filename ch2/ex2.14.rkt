#lang sicp

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (upper-bound interval)
                     (max (car interval) (cdr interval)))
(define (lower-bound interval)
                     (min (car interval) (cdr interval)))


(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (center interval)
  (/ (+ (upper-bound interval)
        (lower-bound interval)) 2))

;; percent = width / center
(define (percent interval)
  (/ (/ (- (upper-bound interval)
           (lower-bound interval)) 2)
     (center interval)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

(define A (make-center-percent 5 0.01))
(define B (make-center-percent 8 0.05))

;; the result are not equal to 1.0
(div-interval A A)
(div-interval B B)
