module Ficha2 where

import Data.Char

-- exercicio 1 --
funA :: [Float] -> Float
funA [] = 0
funA (y:ys) = y^2 + (funA ys)

funB :: [Int] -> [Int]
funB [] = []
funB (h:t) = if (mod h 2) == 0 then h :(funB t) else (funB t)

-- exercicio 2 --
--A)
dobros :: [Float] -> [Float]
dobros [] = []
dobros (h:t) = (h*2):dobros t

--B)
positivos :: [Int] -> Bool
positivos [] = True
positivos (h:t) = h>= 0 && positivos t

--C)
somaNeg :: [Int]-> Int
somaNeg [] = 0
somaNeg (h:t) = if h <= 0 then h + somaNeg t else somaNeg t

--D)
soPos :: [Int] -> [Int]
soPos [] = []
soPos (h:t) = if h< 0 then soPos t else h : soPos t

--E)
tresUlt :: [a] -> [a]
tresUlt [] = []
tresUlt (h:t) = if length (h:t) > 3 then tresUlt t else h:t

--F)
primeiros :: [(a,b)]-> [a]
primeiros [] = []
primeiros ((x,y):t) = x:primeiros t

-- exercicio 3 --
--A)
-- isLower: verifica se é um caracter em minuscula
primeiro :: Char -> Bool
primeiro c = (c >= 'a') && (c <= 'z')

--B)
-- isDigit: verifica se um caracter é um digito
segundo :: Char -> Bool
segundo c = (c >= '0') && (c <= '9')

--C)
-- isAlpha: verifica se o caracter pertence ao alfabeto
terceiro :: Char -> Bool
terceiro c = (c >= 'a') && (c <= 'z') || (c >= 'A') && (c <= 'B')

--D)
-- toUpper: se o caracter for minuscula devolve em maiuscula
quarto :: Char -> Char
quarto c = if (c >= 'a') && (c <= 'z') then chr ((ord c)-32) else c

--E)
-- intToDigit: passa um inteiro (entre 0 e 9) para caracter
quinto :: Int -> Char
quinto x | ((x >= 0) && (x <= 9)) = chr ((ord '0') + x)

--F)
-- digitToInt:recebe um caracter e devolve o inteiro correspondente ao seu valor inteiro 
sexto :: Char -> Int
sexto c | ((c >= '0') && (c <= '9')) = (ord c) - (ord '0')

-- exercicio 4 --
--A)
primMai :: String -> Bool
primMai st = isUpper (head st)

--B)
segMin :: String -> Bool
segMin st = isLower (head (tail st))

-- exercicio 5 --
--A)
soDigitos :: [Char] -> [Char]
soDigitos [] = []
soDigitos (h:t) = if (h>= '0' && h<= '9') 
                     then h: (soDigitos t)
                     else soDigitos t

--B)
minusculas :: [Char] -> Int
minusculas [] = 0
minusculas (h:t) = if segMin (h:t) 
                      then 1 + minusculas t
                      else minusculas t

--C) 
nums :: String -> [Int]
nums [] = []
nums (h:t) = if (isDigit h) 
              then (digitToInt h) : nums t
              else nums t