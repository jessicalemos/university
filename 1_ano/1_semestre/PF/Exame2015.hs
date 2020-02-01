module Exame2015 where

import Data.Char
import Data.List

type TurmaL = [(Numero,Aluno)]
type Aluno = (Nome,Nota)
type Numero = Int
type Nome = String
type Nota = Float

--1)
--A.
taxaAp :: TurmaL -> Float
taxaAp l = (numeroAp l) / (length l)

numeroAp :: TurmaL -> Int
numeroAp ((a,(x,y)):t) | y>=(9,5) = 1 + numeroAp t
                       | otherwise = numeroAp t

--B.
--top :: Int -> TurmaL -> [String]
--top n ((a,(x,y)):t) = 

--C.
lNomeMax :: TurmaL -> Int
lNomeMax ((a,(x,y)):t) = maximum (map f ((a,(x,y)):t))
                                     where f (a,(x,y)) = length x