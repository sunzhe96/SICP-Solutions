#lang sicp

;; Exercise 3.6

(define random-init 0)
(define (rand-update x) (+ x 1))

(define rand 
  (let ((x random-init))
    (define (dispatch message)
      (cond ((eq? message 'generate)
             (begin (set! x (rand-update x))
                    x))
             ((eq? message 'reset)
              (lambda (new-init) (set! x new-init)))))
    dispatch))

 ;; (define rand 
 ;;   (let ((x random-init)) 
 ;;     (define (dispatch message) 
 ;;       (cond ((eq? message 'generate) 
 ;;               (begin (set! x (rand-update x)) 
 ;;                      x)) 
 ;;             ((eq? message 'reset) 
 ;;               (lambda (new-value) (set! x new-value))))) 
 ;;     dispatch)) 


 (rand 'generate) 
 ; 1 
 (rand 'generate) 
 ; 2 
 ((rand 'reset) 0) 
 ; 0 
 (rand 'generate) 
 ; 1 
