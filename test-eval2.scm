(import (srfi 159))
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))
(define coercion-table (make-table))
(define get-coercion (coercion-table 'lookup-proc))
(define put-coercion (coercion-table 'insert-proc!))

(define (eval . o) (display "in the wrong eval"))
(define (type-of exp) (cond ((and (pair? exp) (symbol? (car exp))) (car exp))
                            ((pair? exp) 'call)
                            (else (error "type-of: unknown type"))))

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	(else
	 (let ((proc (get 'eval (type-of exp))))
             (if (procedure? proc) 
                  (proc exp env)
                  (error "data-directed-eval: unknown operation" ))))))

(put 'eval 'quote (lambda (exp env) (text-of-quotation exp)))
(put 'eval 'set! (lambda (exp env) (eval-assignment exp env)))
(put 'eval 'define (lambda (exp env) (eval-definition exp env)))
(put 'eval 'if (lambda (exp env) (eval-if exp env)))
(put 'eval 'lambda (lambda (exp env) (make-procedure (lambda-parameters exp)
			 (lambda-body exp)
			 env)))
(put 'eval 'begin (lambda (exp env) (eval-sequence (begin-actions exp) env)))

(put 'eval 'call (lambda (exp env) (apply (eval (operator exp) env)
                           (list-of-values (operands exp) env))))
#;(put 'eval 'cond )

(define (apply procedure arguments)
  (error "application not supported")
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
         (eval-sequence
           (procedure-body procedure)
           (extend-environment
             (procedure-parameters procedure)
             arguments
             (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
            (list-of-values (rest-operands exps) env))))
(define (true? v)
  (if (not (eq? '() v)) #t #f))
(define (eval-if exp env)
  (if (true? (eval (if-predicate exp) env))
      (eval (if-consequent exp) env)
      (eval (if-alternative exp) env)))
(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (eval (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))
(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)
(define (eval-definition exp env)
  (define-variable! (definition-variable exp)
                    (eval (definition-value exp) env)
                    env)
  'ok)
(define false #f)
(define true  #t)
          (define (self-evaluating? exp)
            (cond ((number? exp) true)
                  ((string? exp) true)
                  (else false)))
          (define (variable? exp) (symbol? exp))
          (define (quoted? exp)
            (tagged-list? exp 'quote))

          (define (text-of-quotation exp) (cadr exp))
          (define (tagged-list? exp tag)
            (if (pair? exp)
                (eq? (car exp) tag)
                false))
          (define (assignment? exp)
            (tagged-list? exp 'set!))

          (define (assignment-variable exp) (cadr exp))

          (define (assignment-value exp) (caddr exp))
          (define (definition? exp)
            (tagged-list? exp 'define))

          (define (definition-variable exp)
            (if (symbol? (cadr exp))
                (cadr exp)
                (caadr exp)))

          (define (definition-value exp)
            (if (symbol? (cadr exp))
                (caddr exp)
                (make-lambda (cdadr exp)
                             (cddr exp))))
          (define (lambda? exp) (tagged-list? exp 'lambda))

          (define (lambda-parameters exp) (cadr exp))

          (define (lambda-body exp) (cddr exp))
          (define (make-lambda parameters body)
            (cons 'lambda (cons parameters body)))
          (define (if? exp) (tagged-list? exp 'if))

          (define (if-predicate exp) (cadr exp))

          (define (if-consequent exp) (caddr exp))

          (define (if-alternative exp)
            (if (not (null? (cdddr exp)))
                (cadddr exp)
                'false))
          (define (make-if predicate consequent alternative)
            (list 'if predicate consequent alternative))
          (define (begin? exp) (tagged-list? exp 'begin))

          (define (begin-actions exp) (cdr exp))

          (define (last-exp? seq) (null? (cdr seq)))

          (define (first-exp seq) (car seq))

          (define (rest-exps seq) (cdr seq))
          (define (sequence->exp seq)
            (cond ((null? seq) seq)
                  ((last-exp? seq) (first-exp seq))
                  (else (make-begin seq))))

          (define (make-begin seq) (cons 'begin seq))
(define (application? exp) (pair? exp))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (no-operands? ops) (null? ops))

(define (first-operand ops) (car ops))

(define (rest-operands ops) (cdr ops))
(show #t "initializing standard cond\n")
     (define (cond? exp) (tagged-list? exp 'cond))

     (define (cond-clauses exp) (cdr exp))

     (define (cond-else-clause? clause)
       (eq? (cond-predicate clause) 'else))

     (define (cond-predicate clause) (car clause))

     (define (cond-actions clause) (cdr clause))

     (define (cond->if exp)
       (expand-clauses (cond-clauses exp)))

     (define (expand-clauses clauses)
       (if (null? clauses)
           'false 
           (let ((first (car clauses))
                 (rest (cdr clauses)))
             (if (cond-else-clause? first)
                 (if (null? rest)
                     (sequence->exp (cond-actions first))
                     (error "ELSE clause isn't last -- COND->IF"
                            clauses))
                 (make-if (cond-predicate first)
                          (sequence->exp (cond-actions first))
                          (expand-clauses rest))))))
(show #t "cond initialized\n")

(show #t "Test strings    : " (eval '"hello" '()) "\n")
(show #t "Test numbers    : " (eval '1 '()) "\n")
(show #t "Test if true    : " (eval '(if "" "true" "false") '()) "\n")
(show #t "Test if false   : " (eval '(if '() "true" "false") '()) "\n")
(show #t "Test quote      : " (eval ''() '()) "\n")
(show #t "Test assignment : " "Not implemented" "\n")
(show #t "Test definition : " "Not implemented" "\n")
(show #t "Test lambda     : " "Not implemented" "\n")
(show #t "Test begin      : " (eval '(begin "One" (if "" "two" '()) "end begin") '()) "\n")
(show #t "Test cond       : " (eval '(cond ('() "clause 1") ('() 'clause2) ("" "clause 3") (else "else clause")) '()) "\n")
(show #t "Test cond       : " (eval '(cond ('() "clause 1") ('() 'clause2) ('() "clause 3") (else "else clause")) '()) "\n")

(show #t "Finished\n")
