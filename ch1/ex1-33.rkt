#lang sicp

;; Exercise 1.33

(define (filtered-accumulate
         combiner null-value term a next b predicate)
  (cond ((> a b) null-value)
        ((predicate a)
         (combiner (term a)
                   (filtered-accumulate
                    combiner null-value term (next a) next b predicate)))
         (else
          (filtered-accumulate
           combiner null-value term (next a) next b predicate))))

;; procedure to check if a number is a prime number
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; sum of squares of the prime numbers in range [a, b]
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (sum-of-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

;; testing 1 2 3 5 7 -> 1+4+9+25+49 == 88
(sum-of-square-prime 1 10)

;; the product of all the positive integers less than n that are relatively prime to n

(define (relatively-prime-product n)
  
  (define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  
  (define (relatively-prime a)
    (= (gcd a n) 1))
  
  (filtered-accumulate * 1 identity 1 inc n relatively-prime))

;; testing 1 3 7 9
(relatively-prime-product 10)
(* 1 3 7 9)
