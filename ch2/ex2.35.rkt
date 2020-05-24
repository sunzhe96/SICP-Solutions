#lang sicp

;; Exercise 2.35

;; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (node) (if (pair? node)
                                          (count-leaves node)
                                          1)) t)))

(define a (list 1 2 (list 3 4 (list 4 9))))

(count-leaves a)
