#lang sicp

;; Exercise 1.45

;; compute fixed point of a function
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  
  (define (close-enough? v1 v2)
    (< (abs(- v1 v2))
       tolerance))
  
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  
  (try first-guess))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point-of-transform
         g transform guess)
  (fixed-point (transform g) guess))

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

;; compute exponentiation
(define (exp x n)
  (define (iter product times)
    (if (= times 0)
        product
        (iter (* x product) (- times 1))))
  (iter 1 n))

;; compute square root
(define (sqrt x)
  (fixed-point-of-transform
   (lambda (y) (/ x y)) average-damp 1.0))

;; compute cube root

(define (square x) (exp x 2))

(define (cube-root x)
  (fixed-point-of-transform
   (lambda (y) (/ x (square y))) average-damp 1.0))

(cube-root 27)

;; compute forth root

(define (cube x) (exp x 3))
(define (forth-root x)
  (fixed-point-of-transform
   (lambda (y) (/ x (cube y))) (repeated average-damp 2) 1.0))

(forth-root 16) 

;; compute fifth root
(define (forth x) (exp x 4))

(define (fifth-root x)
  (fixed-point-of-transform
   (lambda (y) (/ x (forth y))) (repeated average-damp 2) 1.0)) 

(fifth-root 32)

;; compute sixth root
(define (fifth x) (exp x 5))

(define (sixth-root x)
  (fixed-point-of-transform
   (lambda (y) (/ x (fifth y))) (repeated average-damp 2) 1.0))

(sixth-root 64)


;; computer tenth root
(define (seventh-root x)
  (fixed-point-of-transform
   (lambda (y) (/ x (exp y 19)))
   (repeated average-damp 3)
   1.0))

(seventh-root 1048576)
