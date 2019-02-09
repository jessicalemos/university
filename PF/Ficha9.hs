module Ficha9 where

import Data.Char
import Data.List

-- Exercicio 1 --
data ExpInt = Const Int
            | Simetrico ExpInt
            | Mais ExpInt ExpInt
            | Menos ExpInt ExpInt
            | Mult ExpInt ExpInt

--A)
calcula :: ExpInt -> Int
calcula (Const n) = n
calcula (Simetrico e) = (calcula e) * (-1)
calcula (Mais a b) = (calcula a) + (calcula b)
calcula (Menos a b) = (calcula a) - (calcula b)
calcula (Mult a b) = (calcula a) * (calcula b)

--B)
infixa :: ExpInt -> String
infixa (Const a) = show a
infixa (Simetrico e) = "( -" ++ infixa e ++ ")"
infixa (Mais c d) = "(" ++ infixa c ++ "+" ++ infixa d
infixa (Menos e f) = "(" ++ infixa e ++ "-" ++ infixa f
infixa (Mult g h) = "(" ++ infixa g ++ "*" ++ infixa h

--C)
posfixa :: ExpInt -> String
posfixa (Const a) = show a
posfixa (Simetrico e) = infixa e ++ " n"
posfixa (Mais c d) = infixa c ++ " " ++ infixa d ++ "+"
posfixa (Menos e f) = infixa e ++ " " ++ infixa f ++ "-"
posfixa (Mult g h) = infixa g ++ " " ++ infixa h ++ "*"

-- Exercicio 2 --
data RTree a = R a [RTree a]
      deriving Show

--A)
soma :: (Num a) => (RTree a) -> a
soma (R a []) = 0
soma (R a n) = a + (sum (map soma n))

--B)
altura :: (RTree a) -> Int
altura (R a []) = 0
altura (R _ n) = 1 + (foldl max 0 (map altura n))

--C)
prune :: Int -> (RTree a) -> RTree a
prune 1 (R a b) = (R a []) 
prune x (R a b) = R a (map (prune (x-1)) b)

--D)
mirror :: (RTree a) -> (RTree a)
mirror (R a b) = R a (map mirror (reverse b))

--E)
postorder :: (RTree a) -> [a]
postorder (R a b) = foldr (++) [a] (map postorder b)

--E2)
preorder :: (RTree a) -> [a]
preorder (R a b) = foldl (++) [a] (map preorder b)

-- Exercicio 3 --
data BTree a = Empty | Node a (BTree a) (BTree a)
            deriving Show

data LTree a = Tip a | Fork (LTree a) (LTree a)
            deriving Show

data FTree a b = Leaf b | No a (FTree a b) (FTree a b)
            deriving Show

--A)
--i)
ltSum :: (Num a) => (LTree a) -> a
ltSum (Tip a) = a
ltSum (Fork e d) = ltSum e + ltSum d

--ii)
listaLT :: (LTree a) -> [a]
listaLT (Tip a) = [a]
listaLT (Fork e d) = listaLT e ++ listaLT d

--iii)
ltHeight :: (LTree a) -> Int
ltHeight (Tip _) = 1
ltHeight (Fork a b) = 1 + (max (ltHeight a) (ltHeight b))

--B)
--i)
splitFTree :: (FTree a b) -> (BTree a, LTree b)
splitFTree (Leaf x) = (Empty,Tip x)
splitFTree (No x e d) = let (e1, e2) = splitFTree e
                            (d1, d2) = splitFTree d
                        in (Node x e1 d1, Fork e2 d2)

--ii)
joinTrees :: (BTree a) -> (LTree a) -> Maybe (FTree a b)
joinTrees Empty (Tip x) = Just (Leaf x)
joinTrees (Node x e d) (Fork e' d') = case (joinTrees e e') of
    Nothing -> Nothing
    Just e1 -> case (joinTrees d d') of
        Nothing -> Nothing
        Just d1 -> Just (No x e1 d1)
joinTrees _ _ = Nothing
