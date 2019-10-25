module TesteFinal2017 where

import Data.Char
import Data.List

-- Exercicio 1 --
type MSet a = [(a,Int)]

--A)
ardMSet :: MSet a -> Int
ardMSet [] = 0
ardMSet ((a,b):t) = b + ardMSet t

--B)
moda :: MSet a -> [a]
moda [] = []
moda [(a,b)] = [a]
moda ((a,b):(c,d):t) | b/=d = [a]
                       | otherwise = a:(moda ((c,d):t))

--C)
converteMSet :: MSet a -> [a]
converteMSet [] = []
converteMSet ((a,0):t) = converteMSet t
converteMSet ((a,b):t) = a:(converteMSet ((a,(b-1)):t))

--D)
addNcopies :: Eq a => MSet a -> a -> Int -> MSet a
addNcopies [] a n = [(a,n)]
addNcopies lista a n | pertenceCopies lista a = addN (elimina lista a) (copies lista a n)
                     | otherwise = addN lista (a,n) 

addN :: MSet a -> (a,Int) -> MSet a
addN [] (x,y) = [(x,y)]
addN ((a,b):t) (x,y) | b<=y = (x,y):(a,b):t
                     | otherwise = (a,b):(addN t (x,y))

elimina :: Eq a => MSet a -> a -> MSet a
elimina [] _ = []
elimina ((a,b):t) l | l==a = t
                    | otherwise = (a,b):(elimina t l)

copies :: Eq a => MSet a -> a -> Int -> (a,Int)
copies ((a,b):t) l n | l==a = (a,(b+n))
                     | otherwise = copies t l n 

pertenceCopies :: Eq a => MSet a -> a -> Bool
pertenceCopies [] l = False
pertenceCopies ((a,b):t) l | a==l = True
                           | otherwise = pertenceCopies t l


-- Exercicio 2 --
data SReais = AA Double Double | FF Double Double
            | AF Double Double | FA Double Double
            | Uniao SReais SReais

--A)
instance Show SReais where
    show (AA a b) = "]" ++ show a ++ "," ++ show b ++ "["
    show (FF a b) = "[" ++ show a ++ "," ++ show b ++ "]"
    show (AF a b) = "]" ++ show a ++ "," ++ show b ++ "["
    show (FA a b) = "[" ++ show a ++ "," ++ show b ++ "["
    show (Uniao a b) = "(" ++ show a ++ "U" ++ show b ++ ")"

--B)
pertence :: Double-> SReais -> Bool
pertence n (AA a b) = n>=a && n<=b
pertence n (FF a b) = (n==a) || (n==b) || pertence n (AA a b)
pertence n (AF a b) = (n==b) || pertence n (AA a b)
pertence n (FA a b) = (n==a) || pertence n (AA a b)
pertence n (Uniao a b) = pertence n a || pertence n b

--C)
tira :: Double -> SReais -> SReais
tira n inter | pertence n inter = retira n inter
             | otherwise = inter

retira n (AA a b) = Uniao (AA a n) (AA n b)
retira n (FF a b) = Uniao (FA a n) (AF n b)
retira n (AF a b) = Uniao (AA a n) (AF n b)
retira n (FA a b) = Uniao (FA a n) (AA n b)
retira n (Uniao a b) = Uniao (retira n a) (retira n b)

-- Exercicio 3 --
data RTree a = R a [RTree a]

--A)
percorre :: [Int] -> RTree a -> Maybe [a]
percorre [] (R a l)= Just [a]
percorre _ (R a [])= Nothing
--percorre (h:t) (R a l) = percorre t  (l!!(h-1))

--B)
procura :: Eq a => a -> RTree a -> Maybe [Int]
procura n (R a []) | n==a = Just []
                   | otherwise = Nothing

--procura n (R a (R x l)) | n==a = Just []
  --                      | otherwise = indica n (R x l)

--indica n (R a (R x l)) | n==a = Just [1]
  --                     | otherwise = indica n (R x l)
            