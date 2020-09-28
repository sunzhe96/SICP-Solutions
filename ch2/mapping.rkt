#lang sicp

;; (define (list-sq list)
;;   (define (squares x) (* x x))
;;   (if (null? list)
;;       nil
;;       (cons (squares (car list))
;;             (list-sq (cdr list)))))

;; ;; recursive mapping
;; (define (map proc items)
;;   (if (null? items)
;;       nil
;;       (cons (proc (car items))
;;             (map proc (cdr items)))))

;; (list-sq (list 1 2 3 4))
;; (map (lambda (x) (* x x)) (list 1 2 3 4))

;; iterative mapping

(define (map proc items)
  (define (iter new-list items)
    (if (null? items)
        new-list
        (iter (append new-list (list (proc (car items))))
              (cdr items))))
  (iter nil items))
  
(map (lambda (x) (* x x)) (list 1 2 3 4))

;; tree mapping

(define (tree-map proc tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(define x (list 1 
                (list 2 (list 3 4) 5) 
                (list 6 7)))


(tree-map (lambda (x) (* x 10)) x)
