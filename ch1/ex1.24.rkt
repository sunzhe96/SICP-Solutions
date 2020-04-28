#lang sicp
(#%require (lib "27.ss" "srfi"))

;; The Fermat test

(define (expod base exp m)
  (define (even? x) (= (remainder x 2) 0))

  (define (square x) (* x x))
  
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expod base (/ exp 2) m))
          m))
        (else
          (remainder
           (* base (expod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expod a n n) a))
  
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
        (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  (fast-prime? n 10000))

;; a procedure to evaluate the time for finding one prime number
(define (timed-prime-test n)

  (define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))
      #f))
  
  (define (report-prime elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

  (start-prime-test n (runtime)))

;; testing
 ;; (timed-prime-test 1000000007) 
 ;; (timed-prime-test 1000000009) 
 ;; (timed-prime-test 1000000021) 
 ;; (timed-prime-test 10000000019) 
 ;; (timed-prime-test 10000000033) 
 ;; (timed-prime-test 10000000061) 
 ;; (timed-prime-test 100000000003) 
 ;; (timed-prime-test 100000000019) 
 ;; (timed-prime-test 100000000057) 
 ;; (timed-prime-test 1000000000039) 
 ;; (timed-prime-test 1000000000061) 
 ;; (timed-prime-test 1000000000063) 

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)