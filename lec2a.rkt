#lang sicp

;; (define (sum-int a b)
;;   (if (> a b)
;;       0
;;       (+ a (sum-int (+ a 1) b))))


(define (sum-int a b)
  
  (define (iter counter sum)
    (cond ((> counter b) sum)
          (else (iter (+ counter 1) (+ sum counter)))))

  (iter a 0))

(sum-int 2 4)
          
