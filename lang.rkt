#lang rosette

(define (pow x y)
  (if (> y 0)
      (* x (pow x (- y 1)))
      1))

(define (shift x y)
  (arithmetic-shift x y))

(define-symbolic y integer?)

(assert (>= y 0))
(verify (assert (= (pow 2 y) (shift 1 y))))