#lang sicp

;; Exercise 2.54

(define (my-equal? list1 list2)
  (cond ((and (not (pair? list1)) (not (pair? list2)))
         (eq? list1 list2))
        ((and (pair? list1) (pair? list2))
         (and (my-equal? (car list1) (car list2))
              (my-equal? (cdr list1) (cdr list2))))
        (else #f)))
        
;; testing
(equal? '(this is a list) 
        '(this is a list))

(my-equal? '(this is a list) 
           '(this is a list))

(equal? '(this is a list) 
        '(this (is a) list))

(my-equal? '(this is a list) 
           '(this (is a) list))

(my-equal? (list (list 1 2) 3) (list (list 1 2) 3))
