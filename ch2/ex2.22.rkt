#lang sicp

;; Exercise 2.22
(define (square x) (* x x))

(define (square-list items)
  (define (iter new-items items)
    (if (null? items)
        new-items
        (iter (cons new-items
                   (square (car items)))
              (cdr items))))
  (iter nil items))

(square-list (list 1 2 3 4))

(cons 1 (list 1 2))

