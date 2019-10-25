module ExameRecurso2015 where

import Data.Char
import Data.List

-- Exercicio 1 --
type TurmaL = [(Numero,Aluno)]
type Aluno = (Nome,Nota)
type Numero = Int
type Nome = String
type Nota = Float

--A)
taxaAp :: TurmaL -> Float
taxaAp [] = 0
taxaAp turma = let (x,y) = aux turma
               in x/y

aux :: TurmaL -> (Float,Float)
aux [] = (0,0)
aux ((n,(nome,cl)):t) | cl>=(9.5) = (1 + a,1 + b)
                      | otherwise = (a, 1 + b)
                         where (a,b) = aux t

--B)
top :: Int -> TurmaL -> [String]
top _ [] = []
top n turma = toNomes n (ordena turma)

toNomes :: Int -> TurmaL -> [String]
toNomes n [] = []
toNomes 0 l = []
toNomes n ((nu,(nome,cla)):t) = [nome] ++ (toNomes (n-1) t) 

ordena :: TurmaL -> TurmaL
ordena [] = []
ordena (h:t) = auxOrd h (ordena t)

auxOrd :: (Numero,Aluno) -> TurmaL -> TurmaL 
auxOrd h [] = [h]
auxOrd (n,(nome,cla)) ((n2,(name,clas)):xs) | cla >=clas = (n,(nome,clas)):(n2,(name,clas)):xs
                                            | otherwise = (n2,(name,clas)):(auxOrd (n,(nome,cla)) xs)   

--C)
lNomeMax :: TurmaL -> Int
lNomeMax turma = maximum (map f (nomes turma))
             where f h = length h

nomes [] = []
nomes ((n,(nome,_)):xs) = [nome] ++ (nomes xs)

--D)
--listaT :: TurmaL -> IO ()

-- Exercicio 2 --
data TurmaA = A1 (Numero,Aluno)
            | Fork (Numero,Numero) TurmaA TurmaA
           deriving Show

--A)
--toList :: TurmaA -> TurmaL

--fromList :: TurmaL -> TurmaA

--B)
lookupA :: TurmaA -> Numero -> Maybe Aluno
lookupA (A1 (num,al)) n | n==num = Just al
                        | otherwise = Nothing 
lookupA (Fork (num,nu) e d) n | n>=num && n<=nu = procura e d n
                              | otherwise = Nothing 

procura :: TurmaA -> TurmaA -> Numero -> Maybe Aluno
procura (A1 (num,al)) (A1 (nu,a)) n | n==num = Just al
                                    | n==nu = Just a
                                    | otherwise = Nothing
procura (A1 (num,al)) (Fork (nu,numer) e d) n | n==num = Just al
                                              | n<=numer && n>=num = lookupA (Fork (nu,numer) e d) n
                                              | otherwise = Nothing
procura (Fork (nu,numer) e d) (A1 (num,al)) n | n==num = Just al
                                              | n<=numer && n>=num = lookupA (Fork (nu,numer) e d) n
                                              | otherwise = Nothing
procura (Fork (num,nu) e d) (Fork (nume,numer) e2 d2) n | n>=num && n<=nu = lookupA e n
                                                        | n>=nume && n<=numer = lookupA d n
                                                        | otherwise = Nothing

--C)
--remove :: TurmaA -> Numero -> Maybe TurmaA
--remove (A1 (num,al)) n | num==n = Nothing
--                       | otherwise = Just (A1 (num,al))
--remove (Fork (num,nu) e d) n | n<=numer && n>=num = retira e d n
--                             | otherwise = Just (Fork (num,nu) e d)


