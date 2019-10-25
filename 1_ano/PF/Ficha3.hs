module Ficha3 where

import Data.Char
import Data.List

-- exercicio 2 
--A)
segundos :: [(a,b)] -> [b]
segundos [] = []
segundos ((x,y):t) = y : segundos t

--B)
nosPrimeiros :: Eq a => a -> [(a,b)] -> Bool
nosPrimeiros _ [] = False
nosPrimeiros n ((x,y):t) = if (n==x) 
                              then True 
                              else nosPrimeiros n t

--C)
minFst :: Ord a => [(a,b)] -> a
minFst [(a,b)]= a
minFst ((a,b):(c,d):t) = fst (head (auxMinFst ((a,b):(c,d):t)))

auxMinFst :: Ord a => [(a,b)] -> [(a,b)]
auxMinFst [(a,b)] = [(a,b)] 
auxMinFst ((a,b):(c,d): t) = if a<=c
                               then (a,b) : t
                               else  (c,d) : t

--D)
sndMinFst :: Ord a => [(a,b)] -> b
sndMinFst [(a,b)] = b
sndMinFst ((a,b):(c,d):t) = snd (head (auxMinFst ((a,b):(c,d):t)))

--E)
sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos [] = (0,0,0)
sumTriplos ((x,y,z):ts) = somaTriplo (x,y,z) (sumTriplos ts) 
                            where somaTriplo (x,y,z) (xs,ys,zs) = (x + xs,y + ys,z + zs)


--F)
maxTriplo :: (Ord a, Num a) => [(a,a,a)] -> a
maxTriplo ((x,y,z):ts) = mTAux ts (x + y + z) where
    mTAux [] big = big
    mTAux ((x,y,z):ts) big = if ((x + y + z) > big) then mTAux ts (x + y + z) else mTAux ts big

-- exercicio 3 
--A)
(><) :: Int -> Int -> Int 
(><) 0 _ = 0
(><) _ 0 = 0
(><) n m = n + (><) n (m-1)

--B)
myDiv :: Int -> Int -> Int
myDiv n m = if (n < m) then 0 else 1 + (div (n - m) m)

myMod :: Int -> Int -> Int
myMod n m = if (n < m) then n else mod (n-m) m

--C) 
power :: Int -> Int -> Int
power _ 0 = 1
power n m = n*(power n (m-1))

-- exercicio 4
type Hora = (Int,Int)
type Etapa = (Hora,Hora)
type Viagem = [Etapa]

-- Ficha 1 --
horaValida :: (Int,Int) -> Bool
horaValida (x,y) = 
    if (x>=0 && x<=23 && y>=0 && y<=59) then True else False

comparaHora :: Hora -> Hora -> Bool
comparaHora (a,b) (x,y) = (a < x) || ((a == x) && (b < y)) 

--C) 
minutos :: Hora -> Int
minutos (h,m) = (h * 60) + m

--D) 
hora :: Int -> Hora
hora m = (div m 60, mod m 60)

--E) calcular a diferença entre duas horas (cujo resultado deve ser o número de minutos).
diferencaHoras :: Hora -> Hora -> Int
diferencaHoras a b = if(comparaHora a b) then (minutos b) - (minutos a) else (minutos a) - (minutos b)

--F) adicionar um determinado número de minutos a uma dada hora.
adicionarMinutos :: Hora -> Int -> Hora
adicionarMinutos h m = hora ((minutos h) + m)

-- Fim Ficha 1 --

--A)
etapaBemConstruida :: Etapa -> Bool
etapaBemConstruida ((a,b),(c,d)) = (horaValida (a,b)) && (horaValida (c,d))

--B)
viagemBemConstruida :: Viagem -> Bool
viagemBemConstruida [] = True
viagemBemConstruida [x] = etapaBemConstruida x
viagemBemConstruida ((x,xs):(y,ys):ts) = if ((etapaBemConstruida (x,xs)) && (comparaHora xs y)) 
                                            then viagemBemConstruida ((y,ys):ts) 
                                            else False

--C)
chegadaPartidaViagem :: Viagem -> (Hora,Hora)
chegadaPartidaViagem list = chegadaPartidaViagemAux list (head list) 
                            where chegadaPartidaViagemAux [] x = x
                                  chegadaPartidaViagemAux ((x,y):ts) (st,end) = chegadaPartidaViagemAux ts (st,y)

--D) 
tempoEmViagem :: Viagem -> Hora
tempoEmViagem [] = (0,0)
tempoEmViagem ((x,y):ts) = adicionarMinutos (tempoEmViagem ts) (diferencaHoras x y)

--E) 
tempoEmEspera :: Viagem -> Hora
tempoEmEspera [] = (0,0)
tempoEmEspera [x] = (0,0)
tempoEmEspera ((x,xs):(y,ys):ts) = adicionarMinutos (tempoEmEspera ((y,ys):ts)) (diferencaHoras xs y)

--F) 
tempoTotalViagem :: Viagem -> Hora
tempoTotalViagem vg = let (horaComeco,horaFim) = chegadaPartidaViagem vg 
                        in hora (diferencaHoras horaComeco horaFim)
