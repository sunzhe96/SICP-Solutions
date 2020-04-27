#lang sicp

;; Exercise 1.31

(define (product a b term next)
  (if (> a b)
      1
      (* (term a)
         (product (next a) b term next))))

;; procedure to compute factorial
(define (factorial n)

  (define (inc x) (+ x 1))
  
  (define (do-nothing x) x)
  
  (product 1 n do-nothing inc))

;; test factorial
(factorial 0)
(factorial 4)


;; compute approxiamations to pi

(define (pi-product n)

  (define (even? x) (= (remainder x 2) 0))
  
  (define (pi-term x)
    (if (even? x)
        (* (/ (- x 2) (- x 1)) (/ x (- x 1)))
        (* (/ (- x 1) x) (/ (+ x 1) x))))
  
  (define (pi-next x) (+ x 2))

(* 4.0 (product 4 n pi-term pi-next)))

;; more readable version
(define (pi-product n)

  (define (even? x) (= (remainder x 2) 0))
  
  (define (pi-term x)
    (if (even? x)
        (/ x (+ x 1))
        (/ (+ x 1) x)))
  
  (define (pi-next x) (+ x 1))

  (* 4.0 (product 2 n pi-term pi-next)))

(pi-product 10000)

;; iterative process
(define (product a b term next)
  
  (define (iter counter product)
    (cond ((> counter b) product)
          (else (iter (next counter) (* (term counter) product)))))

  (iter a 1))

;; testing iterative process using cube function
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(product 1 3 cube inc)
