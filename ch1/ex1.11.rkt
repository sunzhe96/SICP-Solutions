#lang sicp

;; Exercise 1.11

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f n)
  
  (define (f-iter counter a b c)
    (cond ((< n 3) n)
          ((not (< counter n)) a)
          (else
           (f-iter (+ counter 1)
                   (+ a (* b 2) (* c 3))
                   a
                   b))))
  
  (f-iter 2 2 1 0))
