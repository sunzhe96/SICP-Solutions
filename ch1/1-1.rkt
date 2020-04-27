#lang sicp

;; 1.1 The Element of Programming

;; ;; (+ 137 349)

;; ;; (define size 2)
;; ;; size

;; ;; define a function
;; (define (ab x)
;;   (cond ((> x 0) x)
;;         ((= x 0) 0)
;;         ((< x 0) (- x))))
;; (ab -100)
                 

;; (define (abss x)
;;   (if (< x 0) (- x)
;;       x))

;; (or (> 1 0) (= 2 1))

;; (not (< 1 0))

;; ;; (define (>= x y)
;; ;;   (not (< x y)))

;; 1.1.7 Square Roots by Newton's Method

;; (define (sq x)
;;   (* x x))

;; (define (sqrtt x)
  
;;   (define (sqrt-iter guess x)
;;     (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x) x)))
  
;;   (define (sq x)
;;     (* x x))
  
;;   (define (good-enough? guess x)
;;   (<= (abs (- (improve guess x) guess))
;;       (* 0.0001 guess)))
  
;;   (define (average a b)
;;     (/ (+ a b) 2))

;;   (define (improve guess x)
;;     (average guess (/ x guess)))
  
;;     (sqrt-iter 1.0 x))

;; (sqrtt 0.0001) 

;; new-if 

;; (define (new-if predicate then-clause else-clause)
;;   (cond (predicate then-clause)
;;         (else else-clause)))
