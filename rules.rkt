#lang rosette

;; Goal of this toy example is to showcase how we can use racket to
;; generate C++-like code that does code transformations.

;; We are using the language defined in lang.rkt and the codegen infrastructure
;; defined in codegen.rkt. The goal is to generate C++ AST manipulating code
;; for the rewrite rules written below.


(require "codegen.rkt" "lang.rkt")

(define-symbolic x y integer?)

;; rewrite rule with no preconditions
(define sim-expr1
  '(= (mul x y) (mul y x)))

;; rewrite rule with preconditions
;; should generate code something close to the following
;; if(match(op, Mul, x, y)){
;;   auto op1 = CreateMulInstruction(y,x);
;;   replaceInstruction(op,op1);
;; }

(define sim-expr2
  '(define rule1
     (assert (>= x 0))
     (assert (>= y 0))
     (= (add x y) (add y x))))

(code-gen sim-expr2)
