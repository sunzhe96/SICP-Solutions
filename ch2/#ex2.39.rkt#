#lang sicp


;; Exercise 2.39

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


;; (define (reverse seqs)
;;   (fold-right
;;    (lambda (x y) (append y (list x))) nil seqs))


(define (reverse sequence)
  (fold-left 
   (lambda (x y) (append (list y)  x)) nil sequence))

(reverse (list 1 2 3))
