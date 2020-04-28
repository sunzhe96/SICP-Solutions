#lang sicp

;; Exercise 1.39

;; recursive procedure

;; (define (cont-frac n d k)
  
;;   (define (cont-frac-recursive i)
;;         (/ (n i)
;;            (+ (d i)
;;               (if (= i k)
;;                   0
;;                   (cont-frac-recursive (+ i 1))))))
  
;;   (cont-frac-recursive 1))

;; iterative process    

 (define (cont-frac n d k) 
   (define (iter result i) 
     (if (= i 0)
         result 
         (iter (/ (n i) 
                  (+ (d i) result)) 
               (- i 1)))) 
  
  (iter 0 k))

;; tan(x) approximation

(define (tan-cf x k)
  
  (define (square x) (* x x))

  (cont-frac
   (lambda (i) (if (= i 1)
                   x
                   (- (square x))))
   (lambda (i) (- (* 2 i) 1))
   k))

;; testing
(tan-cf 0 100)
(tan-cf 10.0 100)
