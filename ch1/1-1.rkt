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

;; ;; Exercise 1.1
;; (define a 3)
;; (define b (+ a 1))
;; (+ a b (* a b))
;; (= a b)
;; (if (and (> b a) (< b (* a b)))
;;     b
;;     a)
;; (cond ((= a 4) 6)
;;       ((= b 4) (+ 6 7 a))
;;       (else 25))
;; (+ 2 (if (> b a) b a))
;; (* (cond ((> a b) a)
;;          ((< a b) b)
;;          (else -1))
;;    (+ a 1))

;; ;; Exercise 1.2
;; (/ (+ 5 4
;;       (- 2
;;          (- 3
;;             (+ 6
;;                (/ 4 5)))))
;;    (* 3
;;       (- 6 2) (- 2 7)))

;; ;; Exercise 1.3
;; (define (>= x y) (not (< x y)))
;; (define (<= x y) (not (> x y)))
;; (define (squar x) (* x x))
;; (define (sum-of-squares x y) (+ (squar x) (squar y)))
;; (define (sum-of-squares-two-larger-numbers x y z)
;;   (cond ((and (>= x z) (>= y z)) (sum-of-squares x y))
;;         ((and (>= x y) (>= z y)) (sum-of-squares x z))
;;         ((and (>= y x) (>= z x)) (sum-of-squares y z))))
;; testing code for 1.3
;; (sum-of-squares-two-larger-numbers 1 2 3)
;; (sum-of-squares-two-larger-numbers 2 1 3)
;; (sum-of-squares-two-larger-numbers 3 2 1)
;; (sum-of-squares-two-larger-numbers 3 1 1)
;; (sum-of-squares-two-larger-numbers 1 1 3)
;; (sum-of-squares-two-larger-numbers 1 3 1)
;; (sum-of-squares-two-larger-numbers 3 3 1)
;; (sum-of-squares-two-larger-numbers 3 1 3)
;; (sum-of-squares-two-larger-numbers 1 3 3)

;; ;; Exercise 1.4
;; (define (a-plus-abs-b a b)
;;   ((if (> b 0) + -) a b))

;; Exercise 1.5
;; (define (p) (p))
;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y))

;; (test 0 (p))

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



;; Exercise 1.8 Newton's Method for Cube Roots

;; (define (cube-iter guess x)
;;   (if (good-enough-cube? guess x)
;;      guess
;;      (cube-iter (improve guess x) x)))

;; (define (cube x) (* x x x))
;; (define (square x) (* x x))

;; (define (good-enough-cube? guess x)
;;   (<= (abs (- (cube guess) x)) 0.001))
;;   (<= (abs (- (sq guess) x)) 0.001))

;; (define (improve guess x)
;;   (/ (+ (/ x
;;            (* guess guess))
;;         (* 2 guess))
;;      3))

;; (cube-iter 1.0 -75)