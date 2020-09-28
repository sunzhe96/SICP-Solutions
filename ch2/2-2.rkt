#lang sicp

;; ;; 2.2 Hierarchical Data and the Closure Property


;; ;; sequence

;; list (nested cons)
;; (cons 1
;;       (cons 2
;;             (cons 3
;;                   (cons 4 nil))))

;; (define one-through-four (list 1 2 3 4))
;; one-through-four
;; (car one-through-four)
;; (cdr one-through-four)
;; (car (cdr one-through-four))

;; (cons 10 one-through-four)
;; (car (cons 5 one-through-four))

;; ;; List Operations
;; (define (list-ref items n)
;;   (if (= n 0)
;;       (car items)
;;       (list-ref (cdr items)
;;                 (- n 1))))

;; (define squares (list 1 4 9 16 25))

;; (list-ref squares 3)

;; (define (length items)
;;   (if (null? items)
;;       0
;;       (+ 1 (length (cdr items)))))

;; (define odds (list 1 3 5 7))
;; (length odds)

;; (define (append list1 list2)
;;   (if (null? list1)
;;       list2
;;       (cons (car list1) 
;;             (append (cdr list1) 
;;                     list2))))

;; (length (append odds squares))
;; (cons 1 (list 2 3))

;; ;; Mapping over lists

;; (define (scale-list items factor)
;;   (if (null? items)
;;       nil
;;       (cons (* (car items) factor)
;;             (scale-list (cdr items)
;;                         factor))))

;; (scale-list (list 1 2 3 4 5) 10)


;; (define (map proc items)
;;   (if (null? items)
;;       nil
;;       (cons (proc (car items))
;;             (map proc (cdr items)))))

;; (map abs (list -10 2.5 011.6 17))
;; (map (lambda (x) (* x x)) (list 1 2 3 4))

;; 2.2.2 Hierarchical Structures

;; (define (length items)
;;   (if (null? items)
;;       0
;;       (+ 1 (length (cdr items)))))

;; (define a (cons (list 1 2) (list 3 4)))
;; (car a)
;; (cdr a)

;; (define (count-leaves x)
;;   (cond ((null? x) 0)
;;         ((not (pair? x)) 1)
;;         (else (+ (count-leaves (car x))
;;                  (count-leaves (cdr x))))))

;; (length a)
;; (count-leaves a)

;; (cons (list 1 2) (list 3 4))

;; Mapping over trees
;; (define (scale-tree tree factor)
;;   (cond ((null? tree) nil)
;;         ((not (pair? tree))
;;          (* tree factor))
;;         (else
;;          (cons (scale-tree (car tree)
;;                            factor)
;;                (scale-tree (cdr tree)
;;                            factor)))))


;; (define (scale-tree tree factor)
;;   (map (lambda (sub-tree)
;;          (if (pair? sub-tree)
;;              (scale-tree sub-tree factor)
;;              (* sub-tree factor)))
;;        tree))

;; (scale-tree (list 1 
;;                   (list 2 (list 3 4) 5) 
;;                   (list 6 7))
;;             10)

;; 2.2.3 Sequence as Conventional Interfaces

;; Nested Mappings

;; (define (enumerate-interval low high)
;;   (if (> low high)
;;       nil
;;       (cons low 
;;             (enumerate-interval 
;;              (+ low 1) 
;;              high))))
