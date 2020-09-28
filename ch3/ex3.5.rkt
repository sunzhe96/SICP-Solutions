#lang sicp

;; Exercise 3.5

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (predicate a b)
  (< (+ (expt (- a 2) 2)
        (expt (- b 1) 2)) 1))

(define (estimate-integral predicate x1 x2 y1 y2 trials)
  
  (define (iter trials-remaining times)
    (cond ((= trials-remaining 0) (/ times trials))
          ((predicate (random-in-range x1 x2)
                      (random-in-range y1 y2))
           (iter (- trials-remaining 1)
                 (+ times 1)))
          (else (iter (- trials-remaining 1) times))))

  (iter trials 0))

;; pi estimation
(* (estimate-integral predicate 0.0 3.0 0.0 3.0 1000000) 9.0)
