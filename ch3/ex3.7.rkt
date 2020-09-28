#lang sicp

;; Exercise 3.7

;; solution to exercise 3.3
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch ps m)
    (cond
      ((not (eq? ps password)) (lambda (x) "Incorrect password"))
      ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request: 
                 MAKE-ACCOUNT" m))))
  dispatch)

;; solution to exerciese 3.7
(define (make-joint ac origin-password new-password)
  (lambda (ps m)
    (cond ((not (eq? ps new-password))
           (lambda (x) "Incorrect password"))
          ((eq? m 'withdraw) (lambda (x)
                               ((ac origin-password 'withdraw) x)))
          ((eq? m 'deposit) (lambda (x)
                              ((ac origin-password 'deposit) x))))))

;; testing
(define ben-acc (make-account 100 'password))
(define paul-acc (make-joint ben-acc 'password 'new-password))
((ben-acc 'password 'deposit) 100)
((paul-acc 'new-password 'deposit) 100)

;; incorrect ps for ben-acc
(define hello-acc (make-joint ben-acc 'password1 'new-password))
((hello-acc 'new-password 'deposit) 100)

;; incorrect ps for joint-acc
((paul-acc 'new-password1 'deposit) 100)

;; join a joint account
(define lisa-acc (make-joint paul-acc 'new-password 'lisa-ps))
((lisa-acc 'lisa-ps 'deposit) 100)
