#lang sicp

;; Exercise 2.23

(define (for-each items proc)
  (cond ((null? items) #t)
        (else (proc (car items))
              (for-each (cdr items) proc))))

(for-each
 (list 57 321 88)
 (lambda (x) (newline) (display x)))
