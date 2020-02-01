module Exame2016 where

import Data.Char
import Data.List

--1)
--A.
myIntersperse ::a -> [a] -> [a]
myIntersperse _ [] = []
myIntersperse n [x] = [x]
myIntersperse n (x:xs) = x:n:(myIntersperse n xs) 

--B.
myInits :: [a] -> [[a]]
myInits [] = []
myInits (h:t) = []:(map f ys) 
                         where ys = myInits t 
                               f l = h:l  

--2)
type Aluno = (Numero,Nome,Classificacao)
type Numero = Int
type Nome = String
data Classificacao = Aprov Int| Rep| Faltou
data Turma = Vazia | Nodo Aluno Turma Turma
           
--A.
inscNum :: Numero -> Turma -> Bool
inscNum n (Nodo (num,nom,cla) e d) = (n==num) || (inscNum n e) || (inscNum n d)
inscNum _ Vazia = False  

--B.
--aprovAv :: Turma -> Float
--aprovAv (Nodo (num,nom,cla) e d) | 0<=cla<=9 = 1 + aprovAv e + aprovAv d
  --                               | otherwise = 0
--aprovAv Vazia = 0

--C.
melhorNota :: Turma -> Maybe Int
--melhorNota (Nodo (num,nom,cla) e d)
melhorNota Vazia = Nothing



--3)
type Polinomio = [Coeficiente]
type Coeficiente = Float

--A.
adicionaPoli :: Polinomio -> Polinomio -> Polinomio
adicionaPoli l1 [] = l1
adicionaPoli [] l2 = l2
adicionaPoli (x:xs) (y:ys) = (x+y):(adicionaPoli xs ys)

--B.


--C.
multiplicaPoli :: Polinomio -> Polinomio -> Polinomio
multiplicaPoli l1 [] = l1
multiplicaPoli [] l2 = l2
--multiplicaPoli (x:xs) (y:ys) = 