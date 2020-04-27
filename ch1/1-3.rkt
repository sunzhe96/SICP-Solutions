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

;; finding roots of equations by the half-interval method

;; (define (search f neg-point pos-point)
;;   (let ((midpoint
;;          (average neg-point pos-point)))
;;     (if (close-enough? neg-point pos-point)
;;         midpoint
;;         (let ((test-value (f midpoint)))
;;           (cond
;;             ((postive? test-value)
;;              (search f neg-point midpoint))
;;             ((negtive? test-value)
;;              (search f midpoint pos-point))
;;             (else midpoint))))))



