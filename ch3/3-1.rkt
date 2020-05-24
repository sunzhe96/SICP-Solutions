#lang sicp

;; 3.1 Assignment and Local State

;; Local State Variables

(define balance 100)

(define withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

(withdraw 25)
(withdraw 25)
(withdraw 25)
(withdraw 25)
(withdraw 25)

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds")))

(define w1 (make-withdraw 100))
(define w2 (make-withdraw 100))

(w1 50)
(w2 70)


(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: 
                 MAKE-ACCOUNT" m))))
  dispatch)

(((make-account 100) 'withdraw) 3)

;; 3.1.2 The Benefits of Introducing Assignment

(define rand
  (let ((x random-init))
    (lambda () (set! x (rand-update x)) x)))