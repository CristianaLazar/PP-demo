#lang racket

; int result;
; result = 1 + 2

; expresie = (f e1 e2 .. en)
(+ 1 2)
(max 5 15)

; (+ expr1 expr2)
(+ (* 2 5) (* 3 5)) ;(2 * 5) + (5 * 3)


; conditionale
; (if conditie rez-then rez-else)
(if (< 2 3)
    2
    (* 2 3))

(if (> 2 3)
    2
    (if (= (max 2 3) 1)
        3
        0))

; (cond (cond1 rez1) (cond2 rez2) ... )
(cond
  ((= 6 3) 100)
  ((> 6 3) 45)
  ((< 6 3) 30)
  (else 'other))

; (define identificator expresie)
(define PI 3.14159265)
(define r 5)
(define area (* PI r r))
area

(define (inc nr) (+ 1 nr))
(define (dec nr) (- nr 1))

(inc 5)
(dec (inc 5))


; perechi
; constructor: cons
; selectori: car, cdr
(define pair (cons 1 2))
(car pair) ; primul element din pereche
(cdr pair) ; al doilea element din pereche

; liste
; constructori: null, cons, list
; selectori: car, cdr
; alte operații: null?, length, append

'() ; lista goala
null ; lista goala
(length (list)) ;lungimea listei
(cons 5 (list 1 2 3 4)) ;adaugarea unui element in fata unei liste
(append (list 1 2 3) (list 3 4 5)) ;concatenarea dintre 2 liste
(cons 1 (cons 2 (cons 3 (cons 4 null)))) ;construirea unei liste cu cons
(list 1 2 3 4 5 6) ;construirea unei liste cu list
'(1 2 3 4 5 6)

; functii anonime: (lambda lista-parametri corp)
; λx.x - in Calcul Lambda
;(lambda (x) x) ;functia identitate
;((lambda (x) x) 2)

;(define identitate (lambda (x) x))
(define (identitate x) x)
(identitate 3)

; (define (f x y ... ) corp)
(define (arithmetic-mean x y)
  (/ (+ x y) 2))
(arithmetic-mean 10 5)

; Traducere din axiome
; sum([])  = 0
; sum(x:l) = x + sum(l)
(define (sum L)
  (if (null? L)
      0
      (+ (car L) (sum (cdr L)))))
(sum (list 1 2 3 4 5 6))


; daca un element apartine unei liste
; if
(define (elem-list-if l e)
  (if (null? l)
      #f
      (if (equal? (car l) e)
          #t
          (elem-list-if (cdr l) e))))
(elem-list-if '(1 2 4 5) 3)
(elem-list-if '(1 2 4 5) 2)
(elem-list-if '() 0)
; cond
(define (elem-list-cond l e)
  (cond
    ((null? l) #f)
    ((equal? (car l) e) #t)
    (else (elem-list-cond (cdr l) e))))
(elem-list-cond '(1 2 4 5) 3)
(elem-list-cond '(1 2 4 5) 2)
(elem-list-cond '() 0)