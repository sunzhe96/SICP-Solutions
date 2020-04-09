#lang sicp

;; Searching for divisors
(define (smallest-divisor n)

  (define (square x) (* x x))

  (define (divide? a b)
    (= (remainder a b) 0))

  (define (next x)
    (if (= x 2)
        3
        (+ x 2)))
  
  (define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
         ((divide? n test-divisor) test-divisor)
         (else (find-divisor n (next test-divisor)))))
  
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
  (newline))

  (start-prime-test n (runtime)))


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


;; 1000000009 *** 1004
;; 1000000021 *** 0
;; 10000000019 *** 1004
;; 10000000033 *** 1003
;; 10000000061 *** 1003
;; 100000000003 *** 3010
;; 100000000019 *** 3010
;; 100000000057 *** 3010
;; 1000000000039 *** 13043
;; 1000000000061 *** 10033
;; 1000000000063 *** 9030
