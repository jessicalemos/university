module Ficha1 where

perimetro :: Float -> Float
perimetro raio = raio * pi * 2

dist :: (Float,Float)-> (Float,Float) -> Float
dist (a,b)(c,d) = sqrt ((a-c)^2 + (b-d)^2)

primUlt :: [Int]->(Int,Int)
primUlt l = (head l, last l)

multiplo :: Int -> Int -> Bool
multiplo m n =
	 mod m n == 0 

truncaImpar :: [Int]-> [Int]
truncaImpar l = if (mod (length l) 2) == 0 then l else tail l

max2 :: (Int,Int)-> Int
max2 (a,b) =
	if a>b then a else b

max3 :: Int -> Int -> Int -> Int
max3 a b c = if max2 (a,b) > c then max2 (a,b) else c

nRaizes :: Float -> Float -> Float -> Int
nRaizes a b c =
	if (b^2 - 4*a*c)>0 then 2 else (if (b^2 - 4*a*c)==0 then 1 else 0)

raizes :: Float -> Float -> Float -> [Float]
raizes a b c = 
	if (nRaizes a b c == 1 || nRaizes a b c == 2) then [(-b - (sqrt (b^2 - 4*a*c))/ (2*a)) , (-b + (sqrt (b^2 - 4*a*c))/ (2*a))] else []

comprimento :: (Float, Float)-> (Float, Float)-> (Float,Float)-> (Float, Float, Float)
comprimento (x,y)(w,z)(a,b) = (sqrt ((x-a)^2 + (y-b)^2) , sqrt ((a-w)^2 + (b-z)^2) , sqrt ((x-w)^2 + (y-z)^2))

perimTriangulo :: (Float,Float)-> (Float,Float)-> (Float,Float)-> Float
perimTriangulo (x,y)(w,z)(a,b) = sqrt ((x-a)^2 + (y-b)^2) + sqrt ((a-w)^2 + (b-z)^2) + sqrt ((x-w)^2 + (y-z)^2)

retangulo :: (Float,Float) -> (Float,Float) -> [(Float,Float)]
retangulo (a,b)(c,d) = [(a,b), (c,d), (c,b), (a,d)]

horaValida :: (Int,Int) -> Bool
horaValida (x,y) = 
	if (x>=0 && x<=23 && y>=0 && y<=59) then True else False

comparHora :: (Int,Int) -> (Int,Int) -> [Char] 
comparHora (a,b)(c,d) = 
	if a>c then "maior" else if a==c && b>d then "maior" else "menor"

minutos :: (Int,Int) -> Int
minutos (a,b) = a*60 +b

hora :: (Int,Int) -> Int
hora (a,b) = a+(div b 60)

diferencaHoras :: (Int,Int)-> (Int,Int) -> Int
diferencaHoras (a,b)(c,d) = if (a>c || (a==c && b>d)) then ((a*60 + b)-(c*60 +d)) else ((c*60 +d)-(a*60 +b))

adicionarminutos :: (Int,Int) -> Int -> Int
adicionarminutos(a,b) c = a*60 + b + c

