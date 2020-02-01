module Teste2015 where

import Data.Char
import Data.List

data Heap a = Vazia
             | Nodo a (Heap a) (Heap a)
                     deriving Show
--1)
quantos :: Heap a -> Int
quantos (Nodo a e d) = 1 + (quantos e) + (quantos d)
quantos _ = 0

--2)
existe :: Ord a => a -> Heap a -> Bool
existe n (Nodo a e d) = (n==a) || (existe n e) || (existe n d)
existe _ _ = False

--3)
--removeMin :: Heap a -> (a,Heap a)
--removeMin (Nodo a e d) = (a, (removeMove (Nodo a e d)))
--removeMin _ = (0,Vazia) 

--4)
instance Eq a => Eq (Heap a) where 
    Vazia == Vazia = True
    Nodo a e1 d1 == Nodo b e2 d2 = (a==b) && (e1==e2) && (d1==d2)
    _ == _ = False

--5)
randomHeap :: [a] -> IO (Heap a)
randomHeap l = do let (h:t) = sort l
                      arv = (Nodo h Vazia Vazia)
                  makeHeap t arv

makeHeap :: Ord a => [a] -> Heap a -> IO (Heap a)
makeHeap [] arv = return arv
makeHeap l arv = do let n = (length l) - 1 -- as posições iniciam no 0,1,2...
                    r <- randomRIO (0,n) -- dá uma posição random
                    let i = l !! r -- pega num elemento da lista naquela posição
                        ne = remo i l
                        arv2 = insertHeap i arv
                    makeHeap ne arv2

remo :: Eq a => a -> [a] -> [a]
remo a (h:t) |h == a = t
             |otherwise = h : remo a t
remo a [] = []

insertHeap :: Ord a => a -> Heap a -> Heap a
insertHeap x Vazia = Nodo x Vazia Vazia
insertHeap x (Nodo a l r) 
    |l == Vazia && x < a = Nodo x (Nodo a Vazia Vazia) r
    |r == Vazia && x < a = Nodo x r (Nodo a Vazia Vazia)
    |l == Vazia && x >= a = Nodo a (Nodo x Vazia Vazia) r
    |l == Vazia && x >= a = Nodo a l (Nodo x Vazia Vazia)
    |(length $ ordlist l) < (length $ ordlist r) && x > a = Nodo a (insertHeap x l) r
    |(length $ ordlist l) >= (length $ ordlist r) && x > a = Nodo a l (insertHeap x r)
    |(length $ ordlist l) >= (length $ ordlist r) && x < a = Nodo x l (insertHeap a r)
    |otherwise = Nodo x (insertHeap a l) r