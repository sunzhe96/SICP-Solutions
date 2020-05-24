#lang sicp

;; Exercise 2.29

(define (make-mobile left right)
  (list left right))
 
(define (make-branch length structure)
  (list length structure))

;; 1. selectors
;; mobile level
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

;; branch level
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;; 2. total weight
(define (total-weight mobile)
  
  (define (branch-weight branch)
    (if (not (pair? (branch-structure branch)))
        (branch-structure branch)
        (branch-weight (branch-structure branch))))

  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; 3. 
        
;; 4. only modify selectors
