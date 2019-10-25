module Teste2014 where

import Data.Char
import Data.List

data Tree a = Empty
             | Leaf a
             | Fork (Tree a) (Tree a)

a1 = Fork (Fork (Leaf 4)
                (Fork Empty (Leaf 13)))
          (Fork Empty
                (Fork (Leaf 5) Empty))

a2 = Fork (Fork (Leaf 4) (Leaf 13))
          (Leaf 5)

--1)
instance Show a => Show (Tree a) where 
   show (Empty) = "<>"
   show (Leaf a) = show a
   show (Fork e d) = "(" ++ show e ++ "<-*->" ++ show d ++ ")"

--2)
ultimo :: Tree a -> Maybe a
ultimo (Leaf a) = Just a
ultimo (Fork e d) = case ultimo d of 
                          Nothing -> ultimo e
                          Just a -> Just a
ultimo _ = Nothing

--3)
apaga :: Eq a => a -> Tree a -> Tree a 
apaga n (Leaf a) | (n==a) = Empty
                 | otherwise = Leaf a
apaga n (Fork e d) = Fork (apaga n e) (apaga n d)

--4) 
limpa :: Tree a -> Tree a
limpa Leaf a = Leaf a
limpa (Fork e d) = let Just a = novo (Fork e d)
                   in a
        where novo (Leaf x)= Just (Leaf x)
              novo Empty = Nothing
              novo (Fork e d) = case novo e of
                                   Nothing -> novo d
                                   Just a -> case novo r of
                                                   Nothing -> Just a
                                                   Just b -> Just (Fork a b)
limpa _ = Empty


--5)
randomRemove :: Tree a -> IO (Tree a)
randomRemove (Leaf x) = return (Leaf x)
randomRemove t = do x <- randomRIO (minumum (lst t),maximum(lst t))
                    if elem x (lst t) then returne (apaga x t)
                                      else randomRemove t
                             where lst (Leaf a) = [a]
                                   lst (Fork l r) = (lst l) ++ (lst r)
                                   lst Empty = [] 