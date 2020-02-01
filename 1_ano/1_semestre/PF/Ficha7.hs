module Ficha7 where

import Data.Char
import Data.List

-- exercicio 1 --

data Contacto = Casa Integer
              | Trab Integer
              | Tlm Integer
              | Email String

         deriving Show

type Nome = String
type Agenda = [(Nome,[Contacto])]

--A)
acresEmail :: Nome -> String -> Agenda -> Agenda
acresEmail nome email [] = [(nome,[Email email])]
acresEmail nome email ((name, contact):xs) | nome==name = (name, ((Email email):contact)):xs
                                           | otherwise = (name,contact):(acresEmail nome email xs)

--B)
verEmails :: Nome -> Agenda -> Maybe [String]
verEmails nome [] = Nothing
verEmails nome ((name, contact):xs) | nome==name = Just (verEmailsAux contact)
                                    | otherwise = verEmails nome xs

verEmailsAux :: [Contacto] -> [String]
verEmailsAux [] = []
verEmailsAux ((Email y):ys) = y:(verEmailsAux ys)
verEmailsAux (_:ys) = verEmailsAux ys 

--C)
consTelefs :: [Contacto] -> [Integer]
consTelefs [] = []
consTelefs ((Casa y):ys) = y:(consTelefs ys)
consTelefs ((Trab y):ys) = y:(consTelefs ys)
consTelefs ((Tlm y):ys) = y:(consTelefs ys)
consTelefs (_:ys) = consTelefs ys

--D)
casa :: Nome -> Agenda -> Maybe Integer
casa nome [] = Nothing
casa nome ((name, contact):ys) | nome==name = (casaAux contact)
                               | otherwise = casa nome ys

casaAux [] = Nothing
casaAux ((Casa y):ys) = Just y
casaAux (_:ys) = casaAux ys

-- Exercicio 2 --
type Dia = Int
type Mes = Int
type Ano = Int
--type Nome = String

data Data = D Dia Mes Ano
       deriving Show

type TabDN = [(Nome,Data)]

--A)
procura :: Nome -> TabDN -> Maybe Data
procura nome [] = Nothing
procura nome ((name,date):t) | nome==name = Just (date)
                             | otherwise = procura nome t

--B)
idade :: Data -> Nome -> TabDN -> Maybe Int
idade date nome [] = Nothing
idade date nome ((name,dat):t) | nome==name = Just (calculaIdade dat date)
                               | otherwise = idade date nome t
                                     where calculaIdade (D dia mes ano) (D d m a) | (ano >= a) = 0
                                                                                  | otherwise = a - ano


--C)
anterior :: Data -> Data -> Bool
anterior (D d m a) (D di me an) | a<an = True
                                | a==an && m<me = True
                                | a==an && m==me && d<di = True
                                | otherwise = False

--D)
ordena :: TabDN -> TabDN
ordena [] = []
ordena (h:t) = ordAux h (ordena t)
                           where ordAux (nome,date) [] = [(nome,date)]
                                 ordAux (nome,date) ((name,dat):t) | anterior date dat = (nome,date):((name,dat):t)
                                                                   | otherwise = (name,dat):(ordAux (nome,dat) t)

--E)
porIdade :: Data -> TabDN -> [(Nome,Int)]
porIdade date [] = []
porIdade date p = organiza (map (\(c,d)-> (c,(calcIdades d date))) p)
                              where calcIdades (D dia mes ano) (D d m a) | (ano >= a) = 0
                                                                         | otherwise = a - ano

organiza [] = []
organiza ((a,b):t) = aux (a,b) (organiza t)
                       where aux (a,b) [] = [(a,b)]
                             aux (a,b) ((c,d):xs) | b<=d = (a,b):(c,d):xs
                                                  | otherwise = (c,d):(aux (a,b) xs)

-- Exercicio 3 --
data Movimento = Credito Float | Debito Float
      deriving Show

--data Data = D Int Int Int
  --    deriving Show

data Extracto = Ext Float [(Data,String,Movimento)]
     deriving Show

--A)
extValor :: Extracto -> Float -> [Movimento]
extValor (Ext _ []) _ = []
extValor (Ext x ((_, _, Credito y):ts)) v | (y > v) = (Credito y):(extValor (Ext x ts) v)
                                          | otherwise = extValor (Ext x ts) v
extValor (Ext x ((_, _, Debito y):ts)) v | (y > v) = (Debito y):(extValor (Ext x ts) v)
                                         | otherwise = extValor (Ext x ts) v     

--B)
filtro :: Extracto -> [String] -> [(Data,Movimento)]
filtro (Ext _ []) _ = []
filtro (Ext _ _) [] = []
filtro (Ext x ((date,desc,mov):ts)) lista | elem desc lista = (date,mov):(filtro (Ext x ts) lista)
                                        | otherwise = filtro (Ext x ts) lista

--C)
creDeb :: Extracto -> (Float,Float)
creDeb (Ext _ []) = (0,0)
creDeb (Ext x ((_,_,Credito y):ts)) = let (a,b) = creDeb (Ext x ts) 
                                        in (y+a,b)
creDeb (Ext x ((_,_,Debito z):ts)) = let (a,b) = creDeb (Ext x ts)
                                       in (a,z+b) 

--D)
creDeb2 :: Extracto -> (Float,Float)
creDeb2 (Ext valor movimentos) = cAux movimentos 
                                      where cAux lista = foldr fAux (0,0) lista
                                            fAux (_, _, Credito x) (a,b) = (x + a, b)
                                            fAux (_, _, Debito y) (a,b) = (a, y + b)

--E)
saldo :: Extracto -> Float
saldo (Ext inicial movimentos) = let (a,b) = creDeb (Ext inicial movimentos) 
                                    in inicial + a - b

--F)
saldo2 :: Extracto -> Float
saldo2 (Ext inicial movimentos) = foldr fAux2 inicial movimentos
                                      where fAux2 (_,_, Credito a) valor = valor+a
                                            fAux2 (_,_,Debito b) valor = valor-b