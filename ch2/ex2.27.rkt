#lang sicp

;; Exercise 2.27

;; reverse (iterative process)
(define (reverse term)
  
  (define (iter new-list term)
    (if (null? term)
        new-list
        (iter (cons (car term) new-list) (cdr term))))
  
  (iter nil term))

;; deep reverse (recursive process)
(define (deep-reverse item)
  (if (pair? item)
      (append (deep-reverse (cdr item))
              (list (deep-reverse (car item))))
      item))

;; testing
(define x 
  (list (list 1 2 (list 3 4 5)) (list 5 6)))
x
(reverse x)
(deep-reverse x)
