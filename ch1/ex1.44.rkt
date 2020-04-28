#lang sicp

;; Exercise 1.44

(define (average x y z) (/ (+ x y z) 3))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
             (f x)
             (f (+ x dx)))))

((smooth (lambda (x) (* x x))) 5)

;; iterative process

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f times)
  
  (define (iter output n)
    (if (= n 0)
        output
        (iter (compose f output) (- n 1))))

  (iter f (- times 1)))

;; recursive process

;; (define (repeated f times)

;;   (define (recur n function)
;;     (if (= n 1)
;;         function
;;         (compose function (recur (- n 1) function))))

;;   (recur times f))

;; n-fold smoothed function
(define (n-fold-smooth f times)
  (repeated smooth times) f)
