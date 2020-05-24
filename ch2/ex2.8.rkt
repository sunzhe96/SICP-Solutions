#lang sicp

;; Exercise 2.8

(define (sub-interval m n)
   (add-interval m
                 (make-interval (- lower-bound n)
                                (- upper-bound n))))
