#lang sicp

;; Exercise 2.53

;; (a b c)
(list 'a 'b 'c)

;; ((george))
(list (list 'george))

;; ((y1 y2))
(cdr '((x1 x2) (y1 y2)))

;; (y1 y2)
(cadr '((x1 x2) (y1 y2)))

;; #f
(pair? (car '(a short list)))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

;; (red shoes)
(memq 'red '((red shoes) (blue socks)))

;; (red shoes blue socks)
(memq 'red '(red shoes blue socks))
