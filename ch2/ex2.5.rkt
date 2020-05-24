#lang sicp

;; Exercise 2.5

;; expoentiation
(define (exp base times)
  (define (iter product n)
    (if (= n 0)
        product
       (iter (* base product) (- n 1))))
  
    (iter 1 times))


(define (cons a b) (* (exp 2 a) (* (exp 3 b))))

;; iterative process
;; (define (car items)
;;   (define (iter counter items)
;;     (if (= (remainder items 2) 0)
;;         (iter (+ counter 1) (/ items 2))
;;         counter))
  
;;   (iter 0 items))

;; recursive process

(define (car items)
  (if (not (= (remainder items 2) 0))
      0
      (+ 1 (car (/ items 2)))))

(car (cons 4 0))

