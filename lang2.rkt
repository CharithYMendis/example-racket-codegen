#lang rosette

;; goal is to make an AST to mul x y  and convert that to mul y x
;; this can be done easily in racket since you can operate on code
;; We now need to emit C++-likes code that does the same thing.

;; the generated code should look something like
;; (Note that this is not compilablable C++ code and is for demonstration
;; only)
;;
;; if(match(op, Mul, x, y)){
;;   auto op1 = CreateMulInstruction(y,x);
;;   replaceInstruction(op,op1);
;; }

(require "codegen.rkt")

(define (mul x y)
  (* x y))

(define (add x y)
  (+ x y))

(define-symbolic x y z integer?)

(define sim-expr1
  '(= (mul x y) (mul y x)))

(define sim-expr2
  '(define 
  '(= (add x y) (add y x)))