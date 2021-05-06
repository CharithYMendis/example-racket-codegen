#lang rosette

(define (type-string x)
  (cond [(integer? x) "int"]
        [(real? x) "float"]))

(define (print-variable x)
  (format "~a ~a" (type-string (eval x)) (symbol->string x)))

;(define (match-expression expr)
;  (let matched
;  (match expr
;    [(list 'mul x y) (format "mul,~a,~a" (symbol->

;(define (code-gen rule)
;  (match rule
;    [(list '= lhs rhs) (list (match-expression lhs) (create-op-expr rhs))]))