#lang sicp

 ;;;Helpers 
 ;;Computes b^n ref: SICP -section 1.2.4 
 ;; b^n  = 1 if n = 0 
 ;;      = (b^(n/2))^2 if n even 
 ;;      = b.b^(n-1)  o.w. 
 (define (expt b n) 
   (define (even? n) (= (remainder n 2) 0))
   
   (define (square x) (* x x)) 
   (cond ((= n 0) 1) 
        ((even? n) (square (expt b (/ n 2)))) 
        (else (* b (expt b (- n 1)))))) 
  
 ;;return p where n = (k^p).q such that k does not divide q 
 (define (pow k n) 
     (if (not (= 0 (remainder n k)))  0  (+ 1 (pow k (quotient n k))))) 
  
 ;;test pow 
 (pow 2 (* (expt 2 3) (expt 7 11))) 
 (pow 7 (* (expt 2 3) (expt 7 11))) 
 (pow 5 (* (expt 2 3) (expt 7 11))) 
  
 ;;;represent pairs of non-negative integers as 2^a.3^b 
 (define (cons a b)  (* (expt 2 a) (expt 3 b))) 
 (define (car p) (pow 2 p)) 
 (define (cdr p) (pow 3 p)) 
  
 ;;test the representation 
 (car (cons 12 34)) 
 (cdr (cons 12 34)) 
 (car (cons  3 0)) 
 (cdr (cons  3 0)) 
 (car (cons  0 3)) 
 (cdr (cons  0 3)) 
 (car (cons  0 0)) 
 (cdr (cons  0 0)) 
