#lang sicp
;; tree map

;; (define (tree-map procedure tree)
;;     (cond ((null? tree) nil)
;;           ((not (pair? tree)) (procedure tree))
;;           (else (cons (tree-map procedure (car tree))
;;                       (tree-map procedure (cdr tree))))))

;; (define (square-tree tree)
;;   (tree-map (lambda (x) (* x x)) tree))

;; testing
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
