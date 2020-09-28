#lang sicp

;; Exercise 1.46

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? (improve guess))
        (guess)
        ((iterative-improve good-enough? improve) (improve guess)))))

(define (good-enough? v1 v2 torlerance)
  (< (abs (- v1 v2)) torlerance))

(define (sqrt x)

  (define (average (/ (+ x y) 2)))
  
  (define (fixed-point f guess)
    ((iterative-improve
      (lambda (guess)
        (good-enough? guess (f guess)))
      (lambda (y)
        (average y (/ x y)))) guess))

  (fixed-point square 1.0))

(sqrt 4)
