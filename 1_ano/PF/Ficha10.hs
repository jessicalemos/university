module Ficha10 where

import Data.Char
import Data.List

data Frac = F Integer Integer
--               deriving Show

--A)
normaliza :: Frac -> Frac
normaliza (F a b) = F ((signum b)*(div a m)) (div (abs b) m)
                      where m = mdc (abs a) (abs b)

mdc :: Integer -> Integer -> Integer
mdc x y | x>y = mdc (x-y) y
        | x<y = mdc x (y-x)
        | x==y = x

--B)
instance Eq Frac where
    (==) (F a b) (F c d) = a==c && b==d

--C)
instance Ord Frac where
    (<=) (F a b) (F c d) = a*d <= b*c

--D)
instance Show Frac where
    show (F a b) = "( " ++ (show a) ++ "/" ++ (show b)++ ")"

--E)
instance Num Frac where
    (+) (F a b) (F c d) = normaliza (F (a*d + b*c) (b*c))
    (*) (F a b) (F c d) = normaliza (F (a*c) (b*d))
    (-) (F a b) (F c d) = normaliza (F (a*d - b*c) (b*c))
    abs (F a b) = (F (abs a) (abs b))
    signum (F n d) = let (F a b) = normaliza (F n d) 
               in if (a == 0) 
                    then 0 
                    else if (a > 0) 
                           then 1 
                           else (-1)
    fromInteger x = F x 1

--F)
giveBack :: Frac -> [Frac] -> [Frac]
giveBack _ [] = []
giveBack f (h:t) | h> 2*f = h:(giveBack f t)
                 | otherwise = giveBack f t

-- Exercicio 2 --

data ExpInt = Const Int 
            | Simetrico ExpInt
            | Mais ExpInt ExpInt
            | Menos ExpInt ExpInt
            | Mult ExpInt ExpInt

--A)
instance Show ExpInt where
    show x = infixa x

infixa :: ExpInt -> String
infixa (Const a) = show a
infixa (Simetrico e) = "( -" ++ infixa e ++ ")"
infixa (Mais c d) = "(" ++ infixa c ++ "+" ++ infixa d
infixa (Menos e f) = "(" ++ infixa e ++ "-" ++ infixa f
infixa (Mult g h) = "(" ++ infixa g ++ "*" ++ infixa h

--B)
instance Eq ExpInt where
    (==) x y = (calcula x)==(calcula y)

calcula :: ExpInt -> Int
calcula (Const n) = n
calcula (Simetrico e) = (calcula e) * (-1)
calcula (Mais a b) = (calcula a) + (calcula b)
calcula (Menos a b) = (calcula a) - (calcula b)
calcula (Mult a b) = (calcula a) * (calcula b)

--C)
instance Num ExpInt where
    (+) x y = Mais x y
    (*) x y = Mult x y
    (-) x y = Menos x y
    abs x = if calcula x <0 then (Simetrico x) else x
    signum x = if calcula x == 0 
                 then Const 0 
                 else if calcula x > 0
                        then Const 1
                        else Const (-1)
    fromInteger x = Const (fromInteger x)

-- Exercicio 3 --
data Movimento = Credito Float | Debito Float
      deriving Show

data Data = D Int Int Int
    --  deriving Show

data Extracto = Ext Float [(Data,String,Movimento)]
     deriving Show

--A)
instance Eq Data where
    (==) (D a b c) (D e f g) = (a==e) && (b==f) && (c==g)

instance Ord Data where
    compare (D a b c) (D e f g) | a==e && b==f && c==g = EQ
                                | a>e || a==e && b<f || a==e && b==e && c<g = LT
                                | otherwise = GT

--B)
instance Show Data where
    show (D a b c) = (show a) ++ "/" ++ (show b) ++ "/" ++ (show c)

--C)

ordena (Ext n (h:t)) = Ext n (organiza h (ordena (Ext n t)))

organiza (dat,s,m) ((date,st,mo):t) | dateMenor dat date = (dat,s,m):(date,st,mo):t
                                    | otherwise = (date,st,mo):(organiza (dat,s,m) t)
                                        where dateMenor (D d m a) (D di me an) | d<di || d==di && m<me || d==di && m==me && a<an = True
                                                                               | otherwise = False