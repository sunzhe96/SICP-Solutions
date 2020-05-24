#lang sicp

;; Exercise 2.18

;; iterative process
(define (reverse term)
  
  (define (iter new-list term)
    (if (null? term)
        new-list
        (iter (cons (car term) new-list) (cdr term))))
  
  (iter nil term))

;; recursive process
;; (define (reverse term)
;;   (if (null? term)
;;       nil
;;       (append (reverse (cdr term)) (list (car term)))))


(define a (list 1 2 3))
(reverse a)