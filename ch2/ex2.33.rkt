#lang sicp

;; Exercise 2.33
;; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))
;; map
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) 
              nil sequence))

;; append
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;; length
(define (length sequence)
  (accumulate (lambda (x acc) (+ 1 acc)) 0 sequence))

;; testing
(map (lambda (x) (* x x)) (list 1 2 3))
(append (list 1 2 3) (list 8 9))
(length (list 1 2 3))
