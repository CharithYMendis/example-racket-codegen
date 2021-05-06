#lang rosette

(provide code-gen)

(define (type-string x)
  (cond [(integer? x) "int"]
        [(real? x) "float"]))

(define (print-variable x)
  (format "~a ~a" (type-string (eval x)) (symbol->string x)))

(define (get-precond cond)
  (match cond
    [(list 'assert (list op x y)) (format "~a ~a ~a" x op y)]))

(define (get-match lhs)
  (match lhs
    [(list op x y) (format "match(~a.withop(~a,~a)" op x y)]))

(define (get-replace rhs)
  (match rhs
    [(list op x y) (format "replaceIns(~a,~a,~a)" op x y)]))

(define (code-gen rule)
  (match rule
    [(list 'define name asserts ... (list '= lhs rhs))
     (define precond-string (for/list ([assert asserts])
                       (get-precond assert)))
     (define match-string  (get-match lhs))
     (define replace-string (get-replace rhs))
     (print (cons (cons precond-string match-string) replace-string))]))
    