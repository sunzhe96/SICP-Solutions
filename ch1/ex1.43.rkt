#lang sicp

;; Exercise 1.43

(define (compose f g)
  (lambda (x)
    (f (g x))))

;; iterative process
;; (define (repeated f times)
  
;;   (define (iter output n)
;;     (if (= n 0)
;;         output
;;         (iter (compose f output) (- n 1))))

;;   (iter f (- times 1)))

;; recursive process

(define (repeated f times)

  (define (recur n function)
    (if (= n 1)
        function
        (compose function (recur (- n 1) function))))

  (recur times f))


;; testing
(define (square x) (* x x))

((repeated square 2) 5)
