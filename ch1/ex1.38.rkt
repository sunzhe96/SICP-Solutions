#lang sicp

;; Exercise 1.38

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

;; euler e approximation
(define (e-approx k)
  (+ 2
     (cont-frac
      (lambda (i) 1)
      (lambda (i)
        (cond
          ((= i 2) 2)
          ((= (remainder i 3) 2)
           (* (+ (/ (- i 2) 3) 1) 2.0))
          (else 1)))
      k)))

(e-approx 10)
