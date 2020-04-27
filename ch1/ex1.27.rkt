#lang sicp

;; (define (even? n)
;;   (= (remainder n 2) 0))

;; (define (square n) (* n n))

;; (define (expmod a n m)
;;   (cond
;;     ((= n 0) 1)
;;     ((even? n)
;;      (remainder (square (expmod a (/ n 2) m)) m))
;;     (else
;;      (remainder (* a (expmod a (- n 1) m)) m))))

;; (define (test a n)
;;   (cond ((= a n) #t)
;;         ((not (= (expmod a n n) a)) #f)
;;         (else (test (+ a 1) n))))

;; (test 2 500)
        

 ;; ex 1.27 
  
 (define (square x) (* x x)) 
  
 (define (expmod base exp m) 
   (cond ((= exp 0) 1) 
         ((even? exp) 
          (remainder (square (expmod base (/ exp 2) m)) 
                     m)) 
         (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m))))         
  
 (define (full-fermat-prime? n) 
   (define (iter a n) 
     (if (= a n) true 
         (if (= (expmod a n n) a) (iter (+ a 1) n) false))) 
   (iter 1 n)) 
  
 (define (test-fermat-prime n expected) 
   (define (report-result n result expected) 
     (newline) 
     (display n) 
     (display ": ") 
     (display result) 
     (display ": ") 
     (display (if (eq? result expected) "OK" "FOOLED"))) 
   (report-result n (full-fermat-prime? n) expected)) 
  
 (test-fermat-prime 2 true) 
 (test-fermat-prime 13 true) 
 (test-fermat-prime 14 false) 
  
 (test-fermat-prime 561 false)  ; Carmichael number 
 (test-fermat-prime 1105 false) ; Carmichael number 
 (test-fermat-prime 1729 false) ; Carmichael number 
 (test-fermat-prime 2465 false) ; Carmichael number 
 (test-fermat-prime 2821 false) ; Carmichael number 
 (test-fermat-prime 6601 false) ; Carmichael number 

