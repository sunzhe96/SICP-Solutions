#lang sicp

;; 1.3 Formulating Abstractions with Higher-Order Procedures

;; higher-order summation
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; define cube sum
(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (cube-sum a b)
  (sum cube a inc b))

(cube-sum 1 10)

;; sum integers
(define (identity x) x)

(define (sum-intergers a b)
  (sum identity a inc b))

(sum-intergers 1 100)

;; pi sum

(define (pi-term x) (/ 1 (* x (+ x 2))))
(define (pi-next x) (+ x 4))

(define (pi-sum a b)
  (sum pi-term a pi-next b))

;; testing (close to pi / 8)
(- (pi-sum 1.0 1000.0) 0.3926991)

(define (integrals f a b dx)

  (define (add-dx x) (+ x dx))

  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integrals cube 0 1 0.01)
(integrals cube 0 1 0.001)

;; 1.3.2 Constructing Procedures Using Lambda

((lambda (x) (* x 5)) 10)

;; Using let to create local variables
(define a 5)

(+ (let ((a 3))
     (+ a (* a 10)))
   a)


(define x 2)

(let ((x 3)
      (y (+ x 2)))
  (* x y))

;; 1.3.3 Procedures as General Methods

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

;; 1.3.4 Procedures as Returned Values

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (square x) (* x x))

((average-damp square) 10)

(define (sqrt x)
  (fixed-point
   (average-damp
    (lambda (y) (/ x y)))
   1.0))

(sqrt 4)

(define (cube-root x)
  (fixed-point
   (average-damp
    (lambda (y) (/ x (square y))))
   1.0))

(cube-root 27)

;; Newton's method


(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (sqrt-newton x)
  (newtons-method
   (lambda (y)
     (- (square y) x))
   1.0))

(sqrt-newton 4)

;; Abstractions and first-class Procedures

(define (fixed-point-of-transform
         g transform guess)
  (fixed-point (transform g) guess))

