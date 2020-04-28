#lang sicp

;; Exercise 1.37

;; iterative procedure

 (define (cont-frac n d k) 
   (define (iter result i) 
     (if (= i 0)
         result 
         (iter (/ (n i) 
                  (+ (d i) result)) 
               (- i 1)))) 
  
   (iter 0 k))

;; recursive procedure

;; (define (cont-frac n d k)
  
;;   (define (cont-frac-recursive i)
;;     (if (= i k)
;;         1
;;         (/ (n i)
;;            (+ (d i)
;;               (cont-frac-recursive (+ i 1))))))
  
;;   (cont-frac-recursive 1))

;; 13 times
(/ 1 (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                13))
