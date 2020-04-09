#lang sicp

;; 1.3 Formulating Abstractions with Higher Order Procedures

;; higher order summation(sigma notation in math)

(define (sum a b next term)
  (if (> a b)
      0
      (+ (term a)
         (sum (next a) b next term))))

(define (inc n)
  (+ n 1))

;; (define (cube n) (* n n n))

;; (define (sum-cube a b)
;;   (sum a b inc cube))

;; (define (identity x) x)

;; (define (sum-integers a b)
;;   (sum a b inc identity))

;; (define (pi-sum a b)
  
;;   (define (pi-term x)
;;     (/ 1.0 (* x (+ x 2))))

;;   (define (pi-next x)
;;     (+ x 4))
  
;;   (sum a b pi-next pi-term))

;; (* 8 (pi-sum 1 1000))

;; (define (integral a b dx f)
  
;;   (define (add-dx x) (+ x dx))
  
;;   (* (sum (+ a (/ dx 2.0)) b add-dx f) dx))

;; (integral 0 1 0.001 cube)


(define (simpson-integral f a b n)

  ;; define h
  (define (h)
    (/ (- b a) n))

  ;; define y_k
  (define (y k)
    (f (+ a (* k h))))

  (define (inc_y (y k))
    (y (+ k 1)))

  ;; return the value of integral
  ;; (define (sum a b next term)
  ;; (if (> a b)
  ;;     0
  ;;     (+ (term a)
  ;;        (sum (next a) b next term))))
  
  (* (/ h 3) (sum (y 0) (y k) inc y_k)))

(define (cube) (* x x x))

(simpson-integral cube 0 0.1 100)
