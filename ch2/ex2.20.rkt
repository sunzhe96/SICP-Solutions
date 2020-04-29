#lang sicp

;; Exercise 2.20

;; check whether one number is even or odd
;; (define (even? x) (= (remainder x 2) 0))

;; ;; return a list contains only even elements from the input list
;; (define (even term)
;;   (cond
;;     ((null? term) nil)
;;     ((even? (car term))
;;      (append (list (car term)) (even (cdr term))))
;;     (else (even (cdr term)))))

;; ;; return a list contains only odd elements from the input list
;; (define (odd term)
;;   (cond
;;     ((null? term) nil)
;;     ((even? (car term))
;;      (odd (cdr term)))
;;     (else (append (list (car term)) (odd (cdr term))))))

;; (define (same-parity x . y)
;;   (if (even? x)
;;       (cons x (even y))
;;       (cons x (odd y))))

;; another version by qiao
(define (same-parity head . tail)
  (define (iter items acc)
    (if (null? items)
        acc
        (iter (cdr items)
              (if (even? (+ (car items) head))
                  (append acc (list (car items)))
                  acc))))
  (cons head (iter tail nil)))

;; testing
(same-parity 1 2 3 4 5 67)
(same-parity 28 2 3 4 5 67)
