module Ficha5 where

import Data.Char
import Data.List

-- Exercicio 1 --
type Polinomio = [Monomio]
type Monomio = (Float,Int)

--A)
conta :: Int -> Polinomio -> Int
conta n p = aux n p
                 where aux n [] = 0
                       aux n ((a,b):t) | n == b = 1 + aux n t
                                       | otherwise = aux n t

--B)
grau :: Polinomio -> Int
grau ((a,b):t) | eMaior b t = b
               | otherwise = grau t 

eMaior :: Int -> Polinomio -> Bool
eMaior n [] = True
eMaior n ((a,b):t) = n>=b && eMaior n t

--C)
selgrau :: Int -> Polinomio -> Polinomio
selgrau n [] = []
selgrau n ((a,b):t) | n==b = (a,b):(selgrau n t)
                    | otherwise = selgrau n t

--D)
deriv :: Polinomio -> Polinomio
deriv p = map (\(a,b) -> (a*(fromIntegral b) ,b-1)) p

--E)
calcula :: Float -> Polinomio -> Float
calcula n ((a,b):t) = a*(n^b) + calcula n t
calcula _ _ = 0

--F)
simp :: Polinomio -> Polinomio
simp [] = []
simp ((a,b):t) | a==0 = simp t
               | otherwise = (a,b):(simp t)

--G)
mult :: Monomio -> Polinomio -> Polinomio
mult (c,e) p = map (\(a,b) -> (c*a,e+b)) p

--H)
normaliza :: Polinomio -> Polinomio
normaliza [] = []
normaliza (h:t) = norAux h (normaliza t)

norAux :: Monomio -> Polinomio -> Polinomio
norAux (a,b) [] = [(a,b)]
norAux (a,b) ((c,d):t) | (b==d) = (a+c,b):t
                       | otherwise = (c,d):(norAux (a,b) t)

--I)
soma :: Polinomio -> Polinomio -> Polinomio
soma [] [] = []
soma (x:xs) (y:ys) = fazAux x (soma xs (y:ys))

fazAux :: Monomio -> Polinomio -> Polinomio
fazAux (a,b) ((c,d):t) | b==d = (a+c,b):t
                       | otherwise = (c,d):(fazAux (a,b) t)
                             
--J)
produto :: Polinomio -> Polinomio -> Polinomio
produto [] [] = []
produto [] (y:ys) = (y:ys)
produto (x:xs) (y:ys) = prodAux x (produto xs (y:ys))

prodAux (a,b) p = map (\(c,d)-> (a*c,b+d)) p

--K)
ordena :: Polinomio -> Polinomio
ordena [] = []
ordena (x:xs) = ordenaAux x (ordena xs)   

ordenaAux :: Monomio -> Polinomio -> Polinomio
ordenaAux (a,b) [] = [(a,b)]
ordenaAux (a,b) ((c,d):ys) | b<=d = (a,b):(c,d):ys 
                           | otherwise = (c,d):(ordenaAux (a,b) ys)

--L)
equiv :: Polinomio -> Polinomio -> Bool
equiv [] [] = True
equiv _ [] = False
equiv [] _ = False
equiv p1 p2 = ordena (normaliza p1) == ordena (normaliza p2)

-- Exercicio 2 --
nzp :: [Int] -> (Int,Int,Int)
nzp [] = (0,0,0)
nzp (h:ts) | h < 0 = (1 + a,0 + b,0 + c)
           | h == 0 = (0 + a,1 + b,0 + c)
           | h > 0 = (0 + a,0 + b,1 + c)
                 where (a,b,c) = nzp ts

-- exercicio 3 --
digitAlpha :: String -> (String,String)
digitAlpha [] = ([],[])
digitAlpha (h:t) | isAlpha h = (h:a,b)
                 | otherwise = (a,h:b)
                     where (a,b) = digitAlpha t

-- Exercicio 4 --
--A)
--Resultado: [6,8,18]
a = [x | x <- [2,4..20], mod x 3 == 0]

--B)
--Resultado: [6,8,18]
b = [x | x <- [2,4..20], mod x 3 ==0]

--C)
--Resultado: [(10,20),(11,19),(12,18),(13,17),(14,16),(15,15),(16,14),(17,13),(18,12),(19,11),(20,10)]
c = [(x,y) | x <- [10..20], y <- [10..20], x+y == 30]

--D)
--Resultado: [1,1,4,4,9,9,16,16,25,25]
d = [concat [[x**2] ++ [x**2] | x <- [1..5]]]

-- Exercicio 5 --
--A)

a2 = [2^y | y <- [0..10]]

--B)
b2 = [(x,y) | x<-[1..5], y<-(reverse[1..5])]

--C)
c2 = [[1..x] | x <- [1..5]]

--D)
d2 = [[1 | x <- [1..y]] | y <- [1..5]]

--E)
e2 = [product [1..x] | x <- [1..6]]

-- Exercicio 6 --
--A)
myZipWith :: (a->b->c) -> [a] -> [b] -> [c]
myZipWith f [] [] = []
myZipWith f (x:xs) (y:ys) = (f x y):(zipWith f xs ys)

--B)
myTakeWhile :: (a-> Bool)-> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (x:xs) | f x = x:(myTakeWhile f xs)
                     | otherwise =  []

--C)
myDropWhile :: (a-> Bool) -> [a] -> [a]
myDropWhile f [] = []
myDropWhile f (x:xs) | f x = myDropWhile f xs
                     | otherwise = x:(myDropWhile f xs)

--D)
mySpan :: (a-> Bool) -> [a] -> ([a],[a])
mySpan f [] = ([],[])
mySpan f (x:xs) | f x = (x:a,b)
                | otherwise = ([],(x:xs))
                    where (a,b) = mySpan f xs