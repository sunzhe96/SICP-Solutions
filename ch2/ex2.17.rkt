#lang sicp

;; Exercise 2.17

;; recursive process
;; (define (last-pair list)
;;   (if (null? (cdr list))
;;       list
;;       (last-pair (cdr list))))

;; iterative process

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

  ;; (define (iter item)
  ;;   (if (null? (cdr item))
  ;;       item
  ;;       (iter (cdr item))))
  ;; (iter list))

(last-pair (list 23 72 149 34 100))
