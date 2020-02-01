module Teste2014 where

import Data.Char
import Data.List

type TabClass = [(Piloto,Equipa,Pontos)]
type Piloto = String
type Pontos = Int
type Equipa = String

--1)
--A.
pontosEquipa :: Equipa -> TabClass -> Pontos
pontosEquipa l ((a,b,c):t) | l==b = c
                           | otherwise = pontosEquipa l t
pontosEquipa _ _ = 0

--B.
--junta :: [Piloto] -> TabClass -> TabClass
--junta (x:xs) ((a,b,c):t) 

ordenaJunta (x:xs) ((a,b,c):t) | x==a = (a,b,c):(ordenaJunta xs t)
                               | otherwise = ordenaJunta (xs++[x]) ((a,b,c):t)
ordenaJunta _ _ = []

--C.
ordena :: TabClass -> TabClass
ordena ((a,b,c):(x,y,z):t) | c>=z = (a,b,c):(ordena (t++[(x,y,z)]))
                           | otherwise = (x,y,z):(ordena (t++[(a,b,c)]))
ordena _ = []

--3)
data Questionario = Solucao String
                   | Questao String Questionario Questionario

--A.
respostas :: Questionario -> String
respostas 
