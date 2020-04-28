#lang sicp

;; Exercise 1.36

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  
  (define (close-enough? v1 v2)
    (< (abs(- v1 v2))
       tolerance))

(define times 0)
  
  (define (try guess times)

    ;; procedure to print result
    (define (report-guess next)
      (display " result: ")
      next)
    
    ;; print pattern "guess times: the number of guess"
    (display " guess ")
    (display times)
    (display ": ")
    (display guess)
    (newline)
    (let ((next (f guess))
          ;; local variable to store how many times "try" has been called
          (times (+ times 1)))
      (if (close-enough? guess next)
          (report-guess next)
          (try next times))))
  
  (try first-guess 1))

(define (average x y) (/ (+ x y) 2))

;; without average damping
;; 37 times
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)

;; with average damping
;; 13 times
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)  
