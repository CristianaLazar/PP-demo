import Data.List

useful_functions = do
    print $ drop 3 [1,2,3,4,5]
    print $ takeWhile (< 3) [1,2,3,4,5,6,7,8]
    print $ dropWhile (< 3) [1,2,3,4,5,6,7,8]
    print $ span (< 3) [1,2,3,4,5,6,7,8]
    print $ break (>= 3) [1,2,3,4,5,6,7,8]
    print $ splitAt 3 [1,2,3,4,5]

{-
    List comprehension
-}

l1 = [x * 2 | x <- [1..10]]

l2 = [x + y | x <- [1..], y <-[1..], even y]

vowels = ['a', 'e', 'i', 'o', 'u']
removeVowels s = [c | c <- s, c `notElem` vowels]


{-
    Infinite lists
-}
naturals = [0..]
-- naturals = iter 0
   -- where iter x = x : iter (x + 1)

-- iterate
-- iterate :: (a -> a) -> a -> [a]
naturals_iterate = iterate (\x -> x + 1) 0

-- repeat
-- repeat :: a -> [a]
ones = repeat 1

-- intersperse: introduce o valoare între elementele unei liste
onesTwos = intersperse 2 ones

-- cycle
onesTwos_cycle = cycle [1, 2]

-- zipWith
l3 = zipWith (+) [0..] [1..]

{-
    Function application - $
-}

-- left associative: f a b c <=> (((f a) b) c)
-- right associative: we use $ => function $ argument

len = length $ 3 : [1, 2] -- length (3 : [1, 2])

{-
    Function composition - .

    In maths, function composition (f . g)(x) is f(g(x))
    We can write that in Haskell too, using the (.) function

    (.) :: (b -> c) -> (a -> b) -> a -> c  
    f . g = \x -> f (g x)  
-}

-- f $ g    => not ok, because f is expecting an Integer as argument, but g is a function
-- f . g 2  => not ok, beacause we cannot compose f with an Integer (g 2); it sould be a function

-- 2 * x + 1
sm = map ((+ 1) . (* 2))

len1 = length (tail (zip [1,2,3,4] ("abc" ++ "d")))
len2 = (length . tail . zip [1,2,3,4]) ("abc" ++ "d")
len3 = (length . tail . zip [1,2,3,4]) ("abc" ++ "d")


{-
    Point-free programming
-}

-- flip :: (a -> b -> c) -> b -> a -> c
-- flip map :: [a] -> (a -> b) -> [b]

flip_example = do
    print $ take 10 (map (*2) [0..])
    print $ take 10 $ map (*2) [0..]
    print $ take 10 $ (flip map) [0..] (*2)
    print $ take 10 $ flip map [0..] (*2)
    let f = flip map [0..]
    print $ take 10 $ f (*3)


-- design pattern: concatMap
-- myIntersperse
myIntersperse :: a -> [a] -> [a]
myIntersperse y = foldr (++) [] . map (: [y])