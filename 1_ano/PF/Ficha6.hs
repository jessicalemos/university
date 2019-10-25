module Ficha6 where

import Data.Char
import Data.List

-- exercicio 1 --
toDigits :: Int -> [Int]
toDigits 0 = []
toDigits x = (mod x 10) : (toDigits (div x 10))

-- exercicio 2 --
--A)
myFromDigits :: [Int] -> Int
myFromDigits l = sum (zipWith combina l [10^x | x <- [0..]])
                      where combina :: Int -> Int -> Int 
                            combina x y = x*y

myFromDigits2 l = sum (zipWith (*) l [10^x | x <- [0..]])

myFromDigits3 l = sum (zipWith (*) l (map (\x -> 10^x) [0..]))

--B)
myfromDigits4 :: [Int] -> Int
myfromDigits4 [] = 0
myfromDigits4 (h:t) = h + 10*(myfromDigits4 t)

--C)
fromDigits5 :: [Int] -> Int
fromDigits5 l = foldr combina 0 l
     where combina :: Int -> Int -> Int
           combina h rec = h + 10*rec

fromDigits6 l = foldr (\h r -> h + 10*r) 0

-- exercicio 3 --
--A)
intStr :: Int -> String
intStr n = "n"

--B)
strInt :: String -> Int
strInt [] = 0
strInt l = read l :: Int

-- exercicio 4 --
agrupa :: String -> [(Char,Int)]
agrupa [] = []
agrupa p = let (a,b) = span ((head p) == ) p 
               in (head a, length a) : agrupa b

-- exercicio 5 --
subLists :: [a] -> [[a]]
subLists = foldr (\h r -> []:map (h:) r ++ r) [[]]

-- exercicio 6 --
type Mat a =[[a]]

--A)
dimOK :: Mat a -> Bool
dimOK (a:b:t) = (length a)==(length b) && dimOK (b:t)
dimOk _ = False

--B)
dimMat :: Mat a -> (Int,Int)
dimMat (h:t) = ((length h),(length (h:t)))
dimMat _ = (0,0)

--C)
addMat :: Num a => Mat a -> Mat a -> Mat a
addMat [] [] = []
addMat (x:xs) (y:ys) = ((zipWith (+)) x y):(addMat xs ys)

--D)
transpose :: Mat a -> Mat a
transpose [] = []
transpose mat | (length (head mat) > 1) = (map head mat) : (transpose (map tail mat))
              | otherwise = [(map head mat)] 

--E)
multMat :: Num a => Mat a -> Mat a -> Mat a
multMat [] _ = []
multMat m1 m2 = (map (\x -> (sum (zipWith (*) (head m1) x))) (transpose m2)) : (multMat (tail m1) m2)

--F)
myZipWith :: (a-> b -> c) -> Mat a -> Mat b -> Mat c
myZipWMat f mA mB = zipWith (zipWith f) mA mB

--G)
triSup :: Num a => Mat a -> Bool
triSup [] = False
triSup mat = tAux 0 mat where
	tAux x [] = True
	tAux x (h:ts) | ((length (fst (span (0 ==) h))) >= x) = tAux (x + 1) ts
	              | otherwise = False

--H)
rotateLeft :: Mat a -> Mat a
rotataLeft [] = []
rotateLeft m | (length (head m)) > 1 = (rotateLeft (map (drop 1) m)) ++ [map head m]
             | otherwise = [map head m]