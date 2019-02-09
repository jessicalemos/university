module TesteFinal2014 where

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
instance Show (Tree a) where
	show Empty = "<>"
	show (Leaf a) = show a
	show (Fork a b) = "(" ++ show a ++ "<-*->" ++ show b ++ ")"

--2)
ultimo :: Tree a -> Maybe a
ultimo 