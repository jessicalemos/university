module Ficha4 where

import Data.Char
import Data.List


type Ponto = (Float,Float)                -- (abcissa,ordenada)
type Rectangulo = (Ponto, Float, Float)   -- (canto superior esquerdo, largura, altura)
type Triangulo = (Ponto,Ponto,Ponto)
type Poligonal = [Ponto]

distancia :: Ponto -> Ponto -> Float
distancia (a,b) (c,d) = sqrt (((c-a)^2) + ((b-d)^2))

-- exercicio 1 --
--A)
compLinhaPoligonal :: Poligonal -> Float
compLinhaPoligonal (x:y:t) = (distancia x y) + (compLinhaPoligonal (y:t))
compLinhaPoligonal _ = 0

--B)
convert :: Triangulo -> Poligonal
convert (x,y,z) = [x,y,z,x]

--C)
convert2 :: Rectangulo -> Poligonal
convert2 ((a,b), larg, alt) = [(a,b), (a+larg, b), (a + larg, b - alt), (a, b - alt), (a,b)]

--D)
fechada :: Poligonal -> Bool
fechada [x,y] = x==y
fechada (x:y:t)= fechada (x:t)

--E)
triangula :: Poligonal -> [Triangulo]
triangula [x,y,w,z] = [(x,y,w)]
triangula (x:y:w:z:ts) = (x,y,w) : (triangula (x:w:z:ts))
triangula _ = [] 

--F)
areaTriangulo (x,y,z) =
    let a = distancia x y
        b = distancia y z
        c = distancia z x
        s = (a+b+c)/2       -- semi perimetro
    in sqrt (s*(s-a)*(s-b)*(s-c))

areaDelimitada :: Poligonal -> Float
areaDelimitada lista = aux (triangula lista) where 
        aux [] = 0
        aux (h:ts) = (areaTriangulo h) + (aux ts)

move :: Ponto -> Poligonal -> Poligonal
move _ [] = []
move (a,b) ((x,y):t) = moveAux (a-x, b-y) ((x,y):t) where 
    moveAux _ [] = []
    moveAux (n,m) ((x,y):ts) = (x + n,y + m) : (moveAux (n,m) ts)

--H)
zoom2 :: Poligonal -> Poligonal
zoom2 [] = []
zoom2 [x] = [x]
zoom2 (x:y:t) = x:(zoomAux x (y:t))
    where zoomAux :: Ponto -> Poligonal -> Poligonal
          zoomAux _ [] = []
          zoomAux x (y:t) = ((\(a,b) (c,d) -> (a+c,b+d))((\(a,b) c -> (a*c,b*c))((\(a,b) (c,d) -> (a-c,b-d))y x) 2) x):(zoomAux x t)

-- exercicio 2 --
type TabTemp = [(Data,Temp,Temp)]     -- (data, temperatura minima, temperatura maxima)
type Data = (Int, Int,Int)  -- (ano, mes, dia)
type Temp = Float

--A) 
medias :: TabTemp -> [(Data,Temp)]
medias [] = []
medias ((a,b,c):t) = ((a, ((b+c) / 2))):(medias t)

--B)
decrescente :: TabTemp -> Bool
decrescente [] = True 
decrescente [x] = True
decrescente (x:y:ts) = (x > y) && (decrescente (y:ts))

--C)
conta :: [Data] -> TabTemp -> Int
conta [] _ = 0
conta _ [] = 0
conta (y:ys) ((a,b,c):t) = if y==a 
                             then 1 + conta ys t 
                             else conta (y:ys) t

-- exercicio 3 --
type MSet a = [(a,Int)]

--A)
myUnion :: Eq a => MSet a -> MSet a -> MSet a
myUnion [] (x:xs) = (x:xs)
myUnion (y:ys) [] = (y:ys)
myUnion ((c,d):ys) (x:xs) = (faz (c,d) (x:xs)) ++ (myUnion ys (x:xs))
                                  where faz (c,d) ((a,b):xs) | c==a = [(c,d+b)]
                                                             | otherwise = faz (c,d) xs
                                        faz (c,d) [] = [(c,d)]

--B)
myIntersect :: Eq a => MSet a -> MSet a -> MSet a
myIntersect [] [] = []
myIntersect _ [] = []
myIntersect [] _ = []
myIntersect ((a,b):t) (x:xs) = (verifica a (x:xs))++(myIntersect t (x:xs))
                                  where verifica a ((c,d):h) | (a==c) = [(c,d)]
                                                             | otherwise = verifica a h
                                        verifica _ _ = []

--C)
diff :: Eq a => MSet a -> MSet a -> MSet a
diff [] [] = []
diff [] _ = []
diff l1 [] = l1
diff ((c,d):ys) (x:xs) = (calcula (c,d) (x:xs)) ++ (diff ys (x:xs))
                                  where calcula (c,d) ((a,b):xs) | c==a = [(c,d-b)]
                                                                 | otherwise = calcula (c,d) xs
                                        calcula (c,d) [] = [(c,d)]
--D)
ordena :: MSet a -> MSet a
ordena [] = []
ordena (x:xs) = ordenaAux x (ordena xs)
                     where ordenaAux (a,b) [] = [(a,b)]
                           ordenaAux (a,b) ((c,d):ys) | b<=d = (a,b):(c,d):ys
                                                      | otherwise = (c,d):(ordenaAux (a,b) ys)

--E)
moda :: MSet a -> [a]
moda [] = []
moda xs = aux (reverse(ordena xs))
               where aux [] = []
                     aux ((a,b):(c,d):ys) | (b /= d) = [a]
                                          | otherwise = a:(aux ((c,d):ys))