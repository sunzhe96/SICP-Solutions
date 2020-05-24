#lang sicp

;; Exercise 3.3

(define (make-account balance password)
  (define (withdraw amount)
    (cond ((>= balance amount) (begin (set! balance (- balance amount))
                                      balance))
          (else "Insufficient funds")))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch x y)
    (cond ((not (eq? password y)) (lambda _ "incorect password"))
          ((eq? x 'withdraw) withdraw)
          ((eq? x 'deposit) deposit)
          (else (error "Unknown request: make-account" x y))))
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'withdraw 'secret-password) 40)
((acc 'withdraw 'secret-password) 200)
((acc 'withdraw 'secret-password) 20)
((acc 'deposit 'holy) 20)
