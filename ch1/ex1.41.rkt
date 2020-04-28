#lang sicp

;; Exercise 1.41

(define (doubles g)
  (lambda (x)
    (g (g x))))

(define (inc x) (+ x 1))

((doubles inc) 1)

;; 21, apply inc 16 times
(((doubles (doubles doubles)) inc) 5)
