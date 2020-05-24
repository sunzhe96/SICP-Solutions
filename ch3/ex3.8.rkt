#lang sicp

;; Exercise 3.8

(define f
  (let ((m 1))
    (lambda (x) (begin (set! m (* m x))
                       m))))
