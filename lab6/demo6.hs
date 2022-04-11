{-
O functie anonima in Racket:
(lambda (x y) (+ x y))

in Haskell:
\ x y -> x + y

\  - anunta parametrii
-> - precizeaza corpul functiei
-}



{-
(define f (lambda (x y) (+ x y)))
sau
(define (f x y) (+ x y))
-}
f1 = \ x y -> x + y
-- sau
f2 x y = x + y



-- operatorii în Haskell sunt scrisi in forma infixata
-- 2 + 3

-- apelurile de functii sunt scrise in forma prefixata
-- elem 2 [1, 2, 3, 4]


-- operatori in forma prefizata: (+) 2 3
-- apeluri de functii in forma prefixata 2 'elem' [1, 2, 3, 4]

{-
Se traduc in functii anonime:
(2 +) == \x -> 2 + x
(+ 2) == \x -> x + 2
(- 2) == -2
(2 -) == \x -> 2 - x
-}


{-
Tipuri de baza:

Int - finit, dat de arhitectura
Integer - infinit

-}

-- Lista
-- [] lista vida
-- (:) - cons
-- (++) - concatenare
-- ! elementele unei liste sunt de acelasi tip !

l1 = 1:2:3:[]
l2 = [1, 2, 3]
l3 = [1 .. 3]
l4 = l1 ++ l2


-- Perechi
-- fst <=> car (in Racket)
-- snd <=> cdr (in Racket)
-- ! elementele unui tuplu pot avea tipuri diferite !
t1 = (1, "A")

z = zip [1, 2, 3] [2, 3, 4] -- o sa creeze tuplurile (1, 2), (2, 3) (3, 4)
--u = unzip [(1, 2), (2, 3) (3, 4)] -- o sa creeze listele [1, 2, 3] si [2, 3, 4]

{-
    Definirea functiilor
-}

-- Factorialul unui numar
-- if
factorial_if x = if x < 1 then 1 else x * factorial_if (x - 1)
-- garzi
factorial_guards x 
    | x < 1 = 1
    | otherwise = x * factorial_guards (x - 1)
    -- atentie! conteaza identarea
-- case
factorial_case x = case x < 1 of
    True -> 1
    _ -> x * factorial_case (x - 1)
    -- '_' orice altceva / wildcard
-- pattern matching
factorial_pm 0 = 1
factorial_pm x = x * factorial_pm (x - 1)

-- Suma tuturor elementelor unei liste
-- if
sum_if l = if l /= [] then (head l) + sum_if (tail l) else 0
-- garzi
sum_guards l
    | l /= [] = (head l) + sum_if (tail l) 
    | otherwise = 0
-- case
sum_case l = case l of
    (x : xs) -> x + sum_case xs
    _ -> 0
-- pattern matching
sum_pm [] = 0
sum_pm (x:xs) = x + sum_pm xs

{-
    Curry vs Uncurry

:t f1
f1 :: Integer -> Integer -> Integer
Fiecare argument este separat prin -> de urmatorul argument sau de rezultat

!! Toate functile din Haskell sunt curry
-}

{-
    Functionale
    map :: (a -> b) -> [a] -> [b]
    filter :: (a -> Bool) -> [a] -> [a]
    foldl :: (a -> b -> a) -> a -> [b] -> a
    foldr :: (a -> b -> b) -> b -> [a] -> b
    zip :: [a] -> [b] -> [(a, b)]
    zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-}
sum_fold l = foldl (+) 0 l
{-
    Domenii de vizibilitate
-}
-- let
{-
    let id1 = val1
        id2 = val2
        ...
        idn = valn
    in expr
-}

p = let x = y + 1
        y = 2
        b n = if n == 0 then [] else n : b (n - 1)  
    in (x + y, b 2)

-- where
{-
def = expr
    where  
    id1 = val1  
    id2 = val2  
    ...
    idn = valn
-}