#lang sicp

;; Exercise 2.36
;; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (select-car ss)
  (map (lambda (x) (car x)) ss))

(define (select-cdr ss)
  (map (lambda (x) (cdr x)) ss))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (select-car seqs))
            (accumulate-n op init (select-cdr seqs)))))

;; testing
(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 s)

