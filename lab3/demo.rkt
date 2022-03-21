#lang racket

;; uncurry
(define sum-uncurry
  (lambda (x y)
    (+ x y)))
(sum-uncurry 5 6)

(define (sum-uncurry2 x y)
  (+ x y))
(sum-uncurry2 5 6)

;; curry
(define sum-curry
  (lambda (x)
    (lambda (y)
      (+ x y))))
;;(sum-curry 5 6) ;; eroare: arity mismatch
(sum-curry 5) ;; procedure
((sum-curry 5) 6) ;; 11

;; reutilizam functia sum-curry
(define inc
  (sum-curry 1))

;; curry->uncurry
(define (curry->uncurry f)
  (lambda (x y)
    ((f x) y)))

;; uncurry->curry
(define (uncurry->curry f)
  (lambda (x)
    (lambda (y)
      (f x y))))

(((uncurry->curry sum-uncurry) 1) 2) ;; 3
((curry->uncurry sum-curry) 1 2) ;; 3

;; reutilizare de cod
(define (ins-in-sorted op)
  (lambda (e L)
    (if (or (null? L) (op e (car L)))     ;; op = un operator de comparatie
        (cons e L)
        (cons (car L) ((ins-in-sorted op) e (cdr L))))))

(define (sort-ins op)
  (lambda (L)
    (if (null? L)
        L
        ((ins-in-sorted op) (car L) ((sort-ins op) (cdr L))))))

(define sort-ascending (sort-ins <=))
(define sort-descending (sort-ins >=))

;; functionale
; map
(map (lambda (x) (+ x 1)) (range 1 10)) ;; '(1 2 3 4 5 6 7 8 9) -> '(2 3 4 5 6 7 8 9 10)
(map inc (range 1 10)) ;; '(1 2 3 4 5 6 7 8 9) -> '(2 3 4 5 6 7 8 9 10)


; filter
(filter (λ (x) (> x 5)) (range 1 10)) ;; '(1 2 3 4 5 6 7 8 9) -> '(6 7 8 9)
(filter odd? (range 1 10)) ;; '(1 2 3 4 5 6 7 8 9) -> '(1 3 5 7 9)

; foldl
(foldl (λ (x acc) (+ acc x)) 0 (range 1 10)) ;; 45
(foldl (λ (x y acc) (+ acc x y)) 0 (range 1 10) (range 1 10)) ;; 90
(foldl cons '() (range 1 10)) ; reverse list

; foldr
(foldr (λ (x acc) (+ acc x)) 0 (range 1 10)) ;; 45
(foldr cons '() (range 1 10)) ; copy list
(foldr (lambda (x acc) (append acc (list x))) '() (range 1 10)) ; reverse list

; apply
(apply + (range 1 10)) ;; (+ 1 2 3 4 5 6 7 8 9)
(apply cons (list (cons 1 2) 3)) ;; (cons (cons 1 2) 3) -> '((1.2).3)