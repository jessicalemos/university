module Ficha8 where

import Data.Char
import Data.List

-- Exercicio 1 --
data B1Tree a = Vazia
             | Nodo a (B1Tree a) (B1Tree a)
        deriving Show

--A)
altura :: (B1Tree a) -> Int
altura Vazia = 0
altura (Nodo a e d) = 1 + max (altura e) (altura d)

--B) 
contaNodos :: (B1Tree a) -> Int
contaNodos Vazia = 0
contaNodos (Nodo a e d) = 1 + (contaNodos e) + (contaNodos d)

--C)
folhas :: (B1Tree a) -> Int
folhas Vazia = 0
folhas (Nodo _ Vazia Vazia) = 1
folhas (Nodo _ e d) = (folhas e) + (folhas d)

--D)
prune :: Int -> (B1Tree a) -> B1Tree a
prune _ Vazia = Vazia
prune 0 arv = arv
prune n (Nodo a e d) = Nodo a (prune (n-1) e) (prune (n-1) d)

--E)
path :: [Bool] -> (B1Tree a) -> [a]
path _ Vazia = []
path [] (Nodo a _ _) = [a]
path (x:xs) (Nodo a e d) | x = a:(path xs d)
                         | otherwise = a:(path xs e)

--F)
mirror :: (B1Tree a) -> (B1Tree a)
mirror Vazia = Vazia
mirror (Nodo a e d) = Nodo a (mirror e) (mirror d)

--G)
zipWithBT :: (a -> b -> c) -> (B1Tree a) -> (B1Tree b) -> (B1Tree c)
zipWithBT f (Nodo a ea da) (Nodo b eb db) = Nodo (f a b) (zipWithBT f ea eb) (zipWithBT f da db)
zipWithBT f _ _ = Vazia

--H)
unzipBT :: (B1Tree (a,b,c)) -> (B1Tree a, B1Tree b, B1Tree c)
unzipBT Vazia = (Vazia,Vazia,Vazia)
unzipBT (Nodo (x,y,z) e d) = (Nodo x ae ad, Nodo y be bd, Nodo z ce cd) where
    (ae, be, ce) = unzipBT e
    (ad, bd, cd) = unzipBT d 

-- Exercicio 2 --
data B2Tree a = Empty 
             | Node a (B2Tree a) (B2Tree a)
           deriving Show

--A)
minimo :: (Ord a) => B2Tree a -> a
minimo (Node a Empty _ ) = a
minimo (Node _ e _ ) = minimo e

--B)
semMinimo :: (Ord a) => B2Tree a -> B2Tree a
semMinimo Empty = Empty
semMinimo (Node a Empty d) = d
semMinimo (Node a e d) = Node a (semMinimo e) d

--C)
minSmin :: (Ord a) => B2Tree a -> (a,B2Tree a)
minSmin (Node a Empty d) = (a,d)
minSmin (Node a e d) = let (a,b) = minSmin e 
                         in (a, Nodo a b d) 

-- Exercicio 3 --
type Aluno = (Numero,Nome,Regime,Classificacao)
type Numero = Int
type Nome = String
data Regime = ORD | TE | MEL deriving Show
data Classificacao = Aprov Int
                   | Rep
                   | Faltou
            deriving Show

type Turma = B3Tree Aluno   --arvore binarioa de procura (ordenada por numero)

--A)
inscNum :: Numero -> Turma -> Bool
inscNum _ Empty = False
inscNum n (Node (num,_,_,_) e d) | n==num = True
                                 | otherwise = inscNum n e || inscNum n d

--B)
inscNome :: Nome -> Turma -> Bool
inscNome _ Empty = False
inscNome n (Node (_,name,_,_) e d) | n==name = True
                                   | otherwise = inscNome n e || inscNome n d

--C)
trabEst :: Turma -> [(Numero,Nome)]
trabEst Empty = []
trabEst (Node (n,name,TE,_) e d) = (trabEst e) ++ (n,name) ++ (trabEst d)
trabEst (Node (n,name,_,_) e d) = (trabEst e) ++ (trabEst d) 

--D)
nota :: Numero -> Turma -> Maybe Classificacao
nota _ Empty = Nothing
nota n (Node (num,name,_, classi) e d) | n==num = Just classi
                                       | n<num = nota n e
                                       | otherwise = nota n d

--E)
percFaltas :: Turma -> Float
percFaltas Empty = 0
percFaltas arv = ((faltAlunos arv)/(numAlunos arv))*100 

faltAlunos :: Turma -> Int
faltAlunos (Node (_,_,_,Faltou) e d) = 1 + faltAlunos e + faltAlunos d 

numAlunos :: Turma -> Int
numAlunos Empty = 0
numAlunos (Node a e d) = 1 + numAlunos e + numAlunos d

--F)
mediaAprov :: Truma -> Float
mediaAprov Empty = 0
mediaAprov arv = ((totalClass arv)/(numAp arv))*100

totalClass Empty = 0
totalClass (Node (_,_,_,Aprov a) e d) = a + totalClass e + totalClass d
totalClass (Node (_,_,_,_) e d) = totalClass e + totalClass d

numAp Empty = 0
numAp (Node (_,_,_,Aprov a) e d) = 1 + numAp e + numAp d
numAp (Node (_,_,_,_) e d) = numAp e + numAp d  

--G)
aprovAv :: Turma -> Float
aprovAv t = let (a,b) = aux t in a / b where
    aux Empty = (0,0)
    aux (Node (_, _, _, Aprov x) e d) = (1 + al + ar, 1 + bl + br) where
        (al,bl) = aux d
        (ar,br) = aux e
    aux (Node (_, _, _, Rep) e d) = (0 + al + ar, 1 + bl + br) where
        (al,bl) = aux e
        (ar,br) = aux d
    aux (Node _ e d) = (0 + al + ar, 0 + bl + br) where
        (al,bl) = aux e
        (ar,br) = aux d


