module TesteFinal2016 where

import Data.Char
import Data.List

-- Exercicio 1 --
--A)
myNub :: Eq a => [a] -> [a]
myNub [] = []
myNub (h:t) | elem h t = nub t
          | otherwise = h:(nub t)

--B)
myZipWith :: (a->b->c) -> [a] -> [b] -> [c]
myZipWith _ [] [] = []
myZipWith f (x:xs) (y:ys) = (f x y):(myZipWith f xs ys)

-- Exercicio 2 --
type MSet a = [(a,Int)]
--A)
converte :: Eq a => [a] -> MSet a
converte [] = []
converte [x] = [(x,1)]
converte (h:t) = (h, (conta h t)):(converte (apaga h t)) 

conta :: Eq a => a -> [a] -> Int
conta h [] = 0
conta h (x:xs) | elem h (x:xs) = 1 + conta x xs
               | otherwise = conta x xs

apaga :: Eq a => a -> [a] -> [a]
apaga h [] = []
apaga h (x:xs) | x==h = apaga h xs
               | otherwise = x:(apaga h xs)

--B)
myIntersect :: Eq a => MSet a -> MSet a -> MSet a
myIntersect [] [] = []
myIntersect (x:xs) l | elem x l = x:(myIntersect xs l)
                     | otherwise = myIntersect xs l
myIntersect _ _ = []

-- Exercicios 3 --
data Prop = Var String | Not Prop | And Prop Prop | Or Prop Prop

p1 :: Prop
p1 = Not (Or (And (Not (Var "A")) (Var "B")) (Var "C"))

--A)
instance Show Prop where
     show (Var a) = a
     show (Not prop) = "-" ++ show prop
     show (And prop1 prop2) = "(" ++ show prop1 ++ "E" ++ show prop2 ++ ")"
     show (Or prop1 prop2) = "(" ++ show prop1 ++ "V" ++ show prop2 ++ ")"

--B)
eval :: [(String,Bool)] -> Prop -> Bool
eval l (Var a) = valor l a
eval l (Not prop) = not (eval l prop)
eval l (And prop1 prop2) = (eval l prop1) && (eval l prop2)
eval l (Or prop1 prop2) = (eval l prop1) || (eval l prop2)

valor :: [(String , Bool)] -> String -> Bool
valor ((x,y):xys) a | a==x = y
                    | otherwise = valor xys a

--C)
nnf :: Prop -> Prop
nnf (Var a) = Var a
nnf (Not prop) = nega prop
nnf (And prop1 prop2) = And (nnf prop1) (nnf prop2) 
nnf (Or prop1 prop2) = Or (nnf prop1) (nnf prop2)

nega :: Prop -> Prop
nega (Var a) = Not (Var a)
nega (Not prop) = nega prop
nega (And prop1 prop2) = Or (nega prop1) (nega prop2)
nega (Or prop1 prop2) = And (nega prop1) (nega prop2)

--D)
avalia :: Prop -> IO Bool
avalia prop = do let variaveis = readVar prop
                 lista <- (askValue variaveis [])
                 return (eval lista prop)

askValue :: [String] -> [(String , Bool)] -> IO ([(String , Bool)])
askValue [] b = return b
askValue (h:t) b = do 
	putStrLn ("Qual o valor de " ++ h ++ "?")
    putStrLn "1/0:"
    bool <- getLine 
    if bool == "1" then askValue t ((h , True) : b)
                   else if bool == "0" then askValue t ((h , False) : b)
                                       else do putStrLn "Valor não existente."
                                               askValue (h:t) b