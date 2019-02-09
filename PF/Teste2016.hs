module Teste2016 where

import Data.Char
import Data.List

--1)
--A.
myNub :: Eq a => [a]->[a]
myNub [] = []
myNub (h:t) | elem h t = myNub t
            | otherwise = h:(myNub t)

--B.
myZipWith :: (a->b->c)-> [a] -> [b] -> [c]
myZipWith f [] [] = []
myZipWith f (x:xs) (y:ys) = (f x y): myZipWith f xs ys
myZipWith _ _ _ = []

--2)
type MSet a = [(a,Int)]
--A.
myConverte :: Eq a => [a] -> MSet a
myConverte [] = []
myConverte [x] = [(x,1)]
myConverte (x:xs) = aux x xs
                         where aux x [] = [(x,1)]
                               aux x xs | elem x xs = [(x,(tam x xs))] ++ myConverte (apaga x xs) 
                                        | otherwise = [(x,1)] ++ myConverte (apaga x xs)
                               tam x [] = 1              
                               tam x l | elem x l = 1 + (tam x (delete x l))
                                       | otherwise = 1         

apaga :: Eq a => a -> [a] -> [a]
apaga x (y:ys) | x==y = apaga x ys
               | otherwise = y:(apaga x ys)
apaga _ _ = []

--B.
myIntersect :: Eq a => MSet a -> MSet a -> MSet a
myIntersect (x:xs) l | elem x l = x:(myIntersect xs l)
                     | otherwise = myIntersect xs l 
myIntersect _ _ = []

--3)
data Prop = Var String | Not Prop | And Prop Prop | Or Prop Prop

p1 :: Prop
p1 = Not (Or (And (Not (Var "A")) (Var "B")) (Var "C"))

--A.
instance Show Prop where
     show (Var a) = a
     show (Not prop) = "-" ++ show prop
     show (And prop1 prop2) = "(" ++ show prop1 ++ " e " ++ show prop2 ++ ")"
     show (Or prop1 prop2) = "(" ++ show prop1 ++ " ou " ++ show prop2 ++ ")"

--B.
eval :: [(String,Bool)] -> Prop -> Bool
eval list (Var a) = valor a list
eval list (Not prop) = not $ eval list prop
eval list (And prop1 prop2) = (eval list prop1) && (eval list prop2)
eval list (Or prop1 prop2) = (eval list prop1) || (eval list prop2)

valor :: String -> [(String , Bool)] -> Bool
valor n ((m,bool) : t) | n == m = bool
                       | otherwise = valor n t

--C.
nnf :: Prop -> Prop
nnf (Var a) = Var a
nnf (Not prop) = nega (prop)
nnf (And prop1 prop2) = And (nnf prop1) (nnf prop2)
nnf (Or prop1 prop2) = Or (nnf prop1) (nnf prop2)

nega :: Prop -> Prop
nega (Var a) = Not (Var a)
nega (Not prop) = nnf prop
nega (And prop1 prop2) = Or (nega prop1) (nega prop2)
nega (Or prop1 prop2) = And (nega prop1) (nega prop2)

--D.
avalia :: Prop -> IO Bool
avalia prop = do let variaveis = readVar prop
                 lista <- (askValue variaveis [])
                 return (eval lista prop)

askValue :: [String] -> [(String , Bool)] -> IO ([(String , Bool)])
askValue [] b = return b
askValue (h:t) b = do putStrLn ("Qual o valor de " ++ h ++ "?")
                        putStr "1/0: "
                        bool <- getLine 
                        if bool == "1" then askValue t ((h , True) : b)
                                       else if bool == "0" then askValue t ((h , False) : b)
                                                           else do putStrLn "Valor não existente."
                                                                   askValue (h:t) b