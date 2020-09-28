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

;; 1.2.3 Orders of Growth

;; 1.2.4 Exponentiation

;; recursive process
;; (define (expo b n)
;;   (if (= n 0)
;;       1
;;       (* b (expo b (- n 1)))))

;; ;; iterative process
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

;; (define (fast-expo b n)
;;   (cond ((= n 0) 1)
;;         ((is-even n)
;;          (square (fast-expo b (/ n 2))))
;;         (else
;;           (* b (fast-expo b (- n 1))))))

;; (define (is-even n)
;;   (= (remainder n 2) 0))

;; (define (super-fast-expo b n)
  
;;   (define (iter b product counter)
;;     (cond ((= counter 0) product)
;;           ((is-even counter)
;;            (iter (square b) product (/ counter 2)))
;;           (else (iter b (* product b) (- counter 1)))))

;;   (iter b 1 n))

;; (super-fast-expo 3 3)

;; The Fermat test

;; (define (expod base exp m)
;;   (define (even? x) (= (remainder x 2) 0))

;;   (define (square x) (* x x))
  
;;   (cond ((= exp 0) 1)
;;         ((even? exp)
;;          (remainder
;;           (square (expod base (/ exp 2) m))
;;           m))
;;         (else
;;           (remainder
;;            (* base (expod base (- exp 1) m)) m))))

;; (define (fermat-test n)
;;   (define (try-it a)
;;     (= (expod a n n) a))
  
;;   (try-it (+ 1 (random (- n 1)))))

;; (define (fast-prime? n times)
;;   (cond ((= times 0) #t)
;;         ((fermat-test n)
;;         (fast-prime? n (- times 1)))
;;         (else #f)))
  
;; (fast-prime? 7919 100)

;; ;; Exercise 1.21
;; (smallest-divisor 199)
;; (smallest-divisor 1999)
;; (smallest-divisor 19999)
