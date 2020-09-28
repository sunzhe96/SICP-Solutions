#lang sicp

;; Exercise 1.12

(define (pascal row col)
  (cond ((or (= col 1)
             (= col row))
         1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(define (pascal row col)
  
  (define (pascal-iter counter row col)
    (cond ((or
            (= col row)
            (= col 1))
           1)
          ()

          )

  (pascal-iter 1 row col))
