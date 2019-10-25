module TesteFinal2015 where

import Data.Char
import Data.List

data Heap a = Vazia
            | Nodo a (Heap a) (Heap a)
          deriving Show

--1)
quantos :: Heap a -> Int
quantos Vazia = 0
quantos (Nodo a e d) = 1 + quantos e + quantos d

--2)
existe :: Ord a => a -> Heap a -> Bool
existe n Vazia = False
existe n (Nodo a e d) = (n==a) || (existe n e) || (existe n d)

--3)
removeMin :: Ord a => Heap a ->  (a,Heap a)
removeMin (Nodo a Vazia Vazia) = (a,Vazia)
removeMin (Nodo a Vazia d) = (a,d)
removeMin (Nodo a e Vazia) = (a,e)
removeMin (Nodo a e d) = (a,(aux (Nodo a e d)))

aux :: Ord a => Heap a -> Heap a
aux (Nodo x (Vazia) (Vazia)) = Vazia
aux (Nodo x (Nodo a e d) (Vazia)) = (Nodo a e d)
aux (Nodo x (Vazia) (Nodo a e d)) = (Nodo a e d)
aux (Nodo x (Nodo y1 l1 r1) (Nodo y2 l2 r2)) | y1 < y2 = (Nodo y1 (aux (Nodo y1 l1 r1)) (Nodo y2 l2 r2))
                                             | y1 >= y2 = (Nodo y2 (Nodo y1 l1 r1) (aux (Nodo y2 l2 r2)))
                                
--4)
instance Eq a => Eq (Heap a) where
    (==) Vazia Vazia = True
    (==) (Nodo _ _ _) Vazia = False
    (==) Vazia (Nodo _ _ _) = False
    (==) arv1 arv2 = (elemArv1 arv1)==(elemArv2 arv2)

elemArv1 Vazia = []
elemArv1 (Nodo a Vazia Vazia) = [a]
elemArv1 (Nodo a e Vazia) = [a] ++ (elemArv1 e)
elemArv1 (Nodo a Vazia d) = [a] ++ (elemArv1 d)
elemArv1 (Nodo a e d) = [a] ++ (elemArv1 e) ++ (elemArv1 d)

elemArv2 Vazia = []
elemArv2 (Nodo a Vazia Vazia) = [a]
elemArv2 (Nodo a e Vazia) = [a] ++ (elemArv2 e)
elemArv2 (Nodo a Vazia d) = [a] ++ (elemArv2 d)
elemArv2 (Nodo a e d) = [a] ++ (elemArv2 e) ++ (elemArv2 d)

--5)
--randomHeap :: [a] -> IO (Heap a)
