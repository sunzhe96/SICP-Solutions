#lang sicp

;; Exercise 2.30

(define (square x) (* x x))

;; recursion
;; (define (square-tree tree)
;;   (cond ((null? tree) nil)
;;         ((not (pair? tree)) (square tree))
;;         (else (cons (square-tree (car tree))
;;                     (square-tree (cdr tree))))))

;; mapping
(define (square-tree tree order)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree order)
             (order sub-tree)))
       tree))

(define a
  (list 1
        (list 2
              (list 3 4) 5)3
        (list 6 7)))
a
(square-tree a square)
