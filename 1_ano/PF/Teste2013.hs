module Teste2013 where

import Data.Char
import Data.List

type Album = (Titulo,Artista,Ano,[Musica])
type Musica = (Nome,Int)
type Titulo = String
type Nome = String
type Artista = String
type Ano = Int

--1)
doArtista :: [Album] -> Artista -> [(Titulo,Ano)]
doArtista ((x,y,z,h):t) l | y==l = [(x,z)] ++ (doArtista t l) 
                          | otherwise = (doArtista t l) 
doArtista _ _ = []

--2) 
conta :: [Artista] -> [Album] -> [(Artista,Int)]
conta (a:ab) ((x,y,z,h):t) | (a==y) = (a,(vez a ((x,y,z,h):t))):(conta ab t)
                           | otherwise = conta (a:ab) t
                                 where vez a ((x,y,z,h):t) | (a==y) = 1 + vez a t
                                                           | otherwise = vez a t
                                       vez _ _ = 0
conta _ _ = []

--3) 
fun :: Artista -> [Album] -> [(Titulo,Int)]
fun l ((x,y,z,h):t) | l==y = [(x,z)] ++ (fun l t) 
                    | otherwise = (fun l t) 
fun _ _ = []

--4)
maisAntigos :: [Album] -> [Album]
maisAntigos ((x,y,z,h):(a,b,c,d):t) | z==c = (x,y,z,h):(a,b,c,d):(maisAntigos ((a,b,c,d):t))
                                    | z>c = (a,b,c,d):(maisAntigos ((a,b,c,d):t))
                                    | otherwise = (x,y,z,h):(maisAntigos ((a,b,c,d):t))
maisAntigos _ = []

--5)
covers :: [Album] -> [(Nome,[(Artista,Ano)])]
--covers 
covers _ = []