#lang sicp

;; a procedure to check whether a number is a prime number
(define (smallest-divisor n)
  
  (define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
         ((= (remainder n test-divisor) 0) test-divisor)
         (else (find-divisor n (+ 1 test-divisor)))))
  
  (define (square x) (* x x))

  (find-divisor n 2))

(define (is-prime? n)
  (= (smallest-divisor n) n))

;; a procedure to evaluate the time for finding one prime number
(define (timed-prime-test n)

  (define (start-prime-test n start-time)
  (if (is-prime? n)
      (report-prime (- (runtime) 
                       start-time))
      #f))
  
  (define (report-prime elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  #t)

  (start-prime-test n (runtime)))

;; a procedure to find the three smallest prime numbers in a given range
(define (search-for-primes from)

  (define (even? x) (= (remainder x 2) 0))
  
  (define (search-iter from numbers-needed)
    (cond ((even? from)
           (search-iter (+ from 1) numbers-needed))
          ((= numbers-needed 0)
           (display "COMPUTATION COMPLETE"))
          ((timed-prime-test from)
           (search-iter (+ from 2) (- numbers-needed 1)))
          (else (search-iter (+ from 2) numbers-needed))))
  
  (search-iter from 3))

;; testing
;; (search-for-primes 10000000000)
;; (search-for-primes 1000000000000)
;; (search-for-primes 100000000000000)
;; (search-for-primes 10000000000000000)


;; my first version of search-for-primes procedure

;; (define (search-for-primes from)
  
;;   (define (search-iter from numbers-needed start-time)
;;     (cond ((even? from)
;;            (search-iter (+ from 1) numbers-needed start-time))
;;           ((= numbers-needed 0)
;;            (display "COMPUTATION COMPLETE"))
;;           ((is-prime? from)
;;            (display from)
;;            (display " *** ")
;;            (display (- (runtime) start-time))
;;            (newline)
;;            (search-iter (+ from 2) (- numbers-needed 1) (runtime)))
;;           (else (search-iter (+ from 2) numbers-needed start-time))))
  
;;   (search-iter from 3 (runtime)))

;; testing

 (timed-prime-test 1000000007) 
 (timed-prime-test 1000000009) 
 (timed-prime-test 1000000021) 
 (timed-prime-test 10000000019) 
 (timed-prime-test 10000000033) 
 (timed-prime-test 10000000061) 
 (timed-prime-test 100000000003) 
 (timed-prime-test 100000000019) 
 (timed-prime-test 100000000057) 
 (timed-prime-test 1000000000039) 
 (timed-prime-test 1000000000061) 
 (timed-prime-test 1000000000063) 

