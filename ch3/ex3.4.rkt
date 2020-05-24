#lang sicp

;; Exercise 3.4

(define (make-account balance password)
  (define times 0)
  (define (withdraw amount)
    (cond ((>= balance amount) (begin (set! balance (- balance amount))
                                      balance))
          (else "Insufficient funds")))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch x y)
    (cond ((not (eq? password y))
           (lambda _
             (if (> times 7)
                 1     ;;this is the call-the-cops procedure
                 (begin (set! times (+ times 1))
                        "incorect password"))))
          ((eq? x 'withdraw) withdraw)
          ((eq? x 'deposit) deposit)
          (else (error "Unknown request: make-account" x y))))
  dispatch)

(define acc (make-account 100 'fak))

((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
((acc 'fuk 'withdraw) 40)
