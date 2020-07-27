#lang sicp

(define (make-interval lower-bound upper-bound))

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
