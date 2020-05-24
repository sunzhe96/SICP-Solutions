#lang sicp

;; Exercise 3.2
(define (make-monitored f)
  (define mf (let ((counter 0))
               (lambda (input)
                 (cond ((eq? input 'how-many-calls?) counter)
                       ((eq? input 'reset-count) (set! counter 0))
                       (else (begin (set! counter (+ counter 1))
                                    (f input)))))))
  mf)


;; testing
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))
(define fac (make-monitored factorial))

(fac 4)
(fac 'how-many-calls?)
(fac 'reset-count)
(fac 5)
(fac 6)
(fac 'how-many-calls?)
