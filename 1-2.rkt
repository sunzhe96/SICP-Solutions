#lang sicp

;; 1.2 Procedures and the Process They Generate

;; 1.2.1 Linear Recursion and Iteration

;; (define (factorial n)
;;   (if (= n 1)
;;       1
;;       (* n (factorial (- n 1)))))

;; (factorial 6)

;; (define (fact-iter n)
;;   (define (factorial-iter counter product)
;;     (if (> counter n)
;;         product
;;         (factorial-iter (+ counter 1)
;;                         (* product counter))))
;;   (factorial-iter 1 1))

;; (fact-iter 6) 

;; Exercise 1.9

;; (define (inc x) (+ 1 x))
;; (define (dec x) (- 1 x))

;; (define (p a b)
;;   (if (= a 0)
;;       b
;;       (inc (p (dec a) b))))

;; (define (p a b)
;;   (if (= a 0)
;;       b
;;       (p (dec a) (inc b))))

;; (+ 4 5)

;; Exercise 1.10
;; (define (A x y)
;;   (cond ((= y 0) 0)
;;         ((= x 0) (* 2 y))
;;         ((= y 1) 2)
;;         (else (A (- x 1)
;;                  (A x (- y 1))))))

;; (A 1 10)
;; (A 2 4)
;; (A 3 3)

;; (define (h n) (A 2 n))
;; (h 3)

;; 1.2.2 Tree Recursion

;; (define (fib n)
;;   (cond ((= n 0) 0)
;;         ((= n 1) 1)
;;         (else (+ (fib (- n 2))
;;                  (fib (- n 1))))))
;; (fib 7)

;; (define (fib n)
;;   (define (fib-iter counter a b)
;;     (cond ((= n 0) 0)
;;           ((= n 1) 1)
;;           ((> counter n) b) 
;;           (else (fib-iter (+ counter 1) (+ a b) a))))
;;   (fib-iter 0 0 1))

;; Example Counting change

;; (define (count-change amount)
;;   (cc amount 5))

;; (define (cc amount kinds-of-coins)
;;   (cond ((= amount 0) 1)
;;         ((or (< amount 0)
;;             (= kinds-of-coins 0))
;;           0)
;;         (else
;;          (+ (cc amount (- kinds-of-coins 1))
;;              (cc (- amount
;;                     (first-denomination kinds-of-coins))
;;                  kinds-of-coins)))))

;; (define (first-denomination kinds-of-coins)
;;   (cond ((= kinds-of-coins 1) 1)
;;         ((= kinds-of-coins 2) 5)
;;         ((= kinds-of-coins 3) 10)
;;         ((= kinds-of-coins 4) 25)
;;         ((= kinds-of-coins 5) 50)))

;; (count-change )

;; Exercise 1.11

;; (define (f n)
;;   (if (< n 3)
;;       n
;;       (+ (f (- n 1))
;;          (* 2 (f (- n 2)))
;;          (* 3 (f (- n 3))))))

;; (define (f n)
  
;;   (define (f-iter counter a b c)
;;     (cond ((< n 3) n)
;;           ((not (< counter n)) a)
;;           (else
;;            (f-iter (+ counter 1)
;;                    (+ a (* b 2) (* c 3))
;;                    a
;;                    b))))
  
;;   (f-iter 2 2 1 0))

         
;; Exercise 1.12

;; (define (pascal row col)
;;   (cond ((or (= col 1)
;;              (= col row))
;;          1)
;;         (else (+ (pascal (- row 1) (- col 1))
;;                  (pascal (- row 1) col)))))

;; (define (pascal row col)
  
;; Exerise 1.13

;; 1.2.3 Orders of Growth

;; 1.2.4 Exponentiation

;; recursive process
;; (define (expo b n)
;;   (if (= n 0)
;;       1
;;       (* b (expo b (- n 1)))))

;; iterative process
;; (define (expo b n)
  
;;   (define (expo-iter counter product)
;;     (if (= counter n)
;;         product
;;         (expo-iter (+ counter 1) (* product b))))
    
;;   (expo-iter 0 1))

;; another way to do iterative process
;; (define (expo b n)
  
;;   (define (expo-iter counter product)
;;     (if (= counter 0)
;;         product
;;         (expo-iter (- counter 1) (* product b))))
  
;;   (expo-iter n 1))
;; (define (square x)
;;   (* x x))

;; Exercise 1.16

;; (define (fast-iter-expo b n)

;;   (define (square x) (* x x))

;;   (define (is-even x) (= (remainder x 2) 0))

;;   (define (iter product counter middle)
;;     (cond ((= counter 0) product)
;;           ((is-even counter) (iter
;;                               product
;;                               (/ counter 2)
;;                               (square middle)))
;;           (else (iter (* product middle) (- counter 1) middle))))

;;   (iter 1 n b))




;; Exercise 1.17                           

;; (define (* a b)
;;   (if (= b 0)
;;       0
;;       (+ a (* a  (- b 1)))))


;; recucursive process (logrithmatic number of steps)

;; (define (fast-mul a b)

;;   (define (double x)
;;   (+ x x))

;;   (define (halve x) (/ x 2))

;;   (define (is-even x) (= (remainder x 2) 0))
  
;;   (cond ((= a 0) 0)
;;         ((= a 1) b)
;;         ((is-even a) (fast-mul (halve a) (double b)))
;;         (else (+ b (fast-mul (- a 1) b)))))

;; (fast-mul 3 0)

;; Exercise 1.18 iterative process

;; (define (fast-iter-mul a b)
  
;;   (define (is-even n)
;;     (= (remainder n 2) 0))

;;   (define (double n)
;;     (+ n n))

;;   (define (iter sum counter middle)
;;     (cond ((= counter 0) sum)
;;           ((is-even counter) (iter sum (/ counter 2) (double middle)))
;;           (else (iter (+ sum middle) (- counter 1) middle))))

;;   (iter 0 a b))

;;  Exercise 1.19

;; 1.2.5 Greatest Common Divisors

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (remainder a b)))))

(gcd 206 40)
