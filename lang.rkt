#lang rosette

;; The toy language has 2 operators, namely `mul` and `add`. Both have their usual meanings.

(provide mul add)

(define (mul x y)
  (* x y))

(define (add x y)
  (+ x y))
