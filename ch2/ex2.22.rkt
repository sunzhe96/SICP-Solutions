#lang sicp

;; Exercise 2.22

(define (square x) (* x x))

;; correct version
(define (square-list items)
  (define (iter new-items items)
    (if (null? items)
        new-items
        (iter (append new-items
                      (list (square (car items))))
              (cdr items))))
  (iter nil items))

(square-list (list 1 2 3 4))
