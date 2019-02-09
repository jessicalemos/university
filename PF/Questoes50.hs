module QuestoesPF where

import Data.List
import Data.Char

-- enumFromTo --
um :: Int -> Int -> [Int]
um a b = if a>b then [] else a:(um (a+1) b)
--um a b = if a>b then [] else (if a<b then [a..b] else [a])

--enumFromThenTo --
dois :: Int -> Int -> Int -> [Int]
dois 0 0 0 = []
dois a b c = if a>c then [] else a:(dois b (b+(b-a)) c) 

-- (++) --
tres :: [a] -> [a] -> [a]
tres [] l = l
tres l [] = []
tres (h:t) l = h: tres t l

-- last --
quatro :: [a] -> a
quatro [h] = h
quatro (h:t) = last (h:t)

-- init --
cinco :: [a] -> [a]
cinco [] = []
cinco [h] = []
cinco (h:t) = h: cinco t
--cinco (h:t) = if length (h:t) > 2 then h:cinco t else [h]

-- (!!) --
seis :: [a] -> Int -> a
seis [x] 0 = x
seis (h:t) n = if (n==0) then h else seis t (n-1)

-- reverse --
sete :: [a] -> [a]
sete [] = []
sete (h:t) = (sete t)++[h]

-- take --
oito::Int-> [t] -> [t]
oito 0 _  = []
oito _ [] = []
oito n (h:t) = if n<0 then [] else h: oito (n-1) t
--oito n l = head l : oito (n-1) (tail l)

--oito n (h:t) = if length (h:t)>= n then (h:oito n t) else h:t

-- drop --
nove :: Int -> [a] -> [a]
nove 0 (h:t) = (h:t)
nove n [] = []
nove n (h:t) = if n<0 then [] else nove (n-1) t 
--nove 0 l = l
--nove n [] = []
--nove n l = nove (n-1) (tail l)

-- zip --
dez :: [a] -> [b] -> [(a,b)]
dez [] _ = []
dez _ [] = []
dez (h:t) (y:ys) = (h,y) : dez t ys

-- elem --
onze :: Eq a => a -> [a] -> Bool
onze n [] = False
onze n (x:xs) = (n==x) || onze n xs
--onze n (x:xs) = if n==x then True else onze n xs

-- replicate --
doze :: Int -> a -> [a]
doze 0 x = []
doze 1 x = [x]
doze n x = x : doze (n-1) x

-- intersperse --
treze :: a -> [a] -> [a]
treze _ [] = []
treze _ [x] = [x]
treze n (h:t) = h:n: treze n t

-- group --
catorze::Eq a => [a] -> [[a]]
catorze [] = [[]]
catorze [x] = [[x]]
catorze (h:t) = if (h== head t) then (h: head (catorze t)): tail(catorze t) else [h]:catorze t
--catorze :: Eq a => [a] -> [[a]]
--catorze (h:t) = catorze2 [h] t
--catorze2 acc [] = [acc]
--catorze2 acc (h:t) = if elem h acc then catorze2 (h: acc) t else acc : catorze2 [h] t

-- concat --
quinze :: [[a]] -> [a]
quinze [] = []
quinze (h:t) = h ++ quinze t

-- inits --
dezaseis :: [a] -> [[a]]
dezaseis [] = [[]]
dezaseis (h:t) = []:(map foux ys) 
    where ys = inits t 
         foux l = h:l 

-- outraforma inits --
inits' [] = [[]]
inits' (h:t) = []:aux h ys 
    where ys = inits' t
          aux x [] = []
          aux x (y:ys) = (x:y):aux x ys

-- tails --
dezasete :: [a] -> [[a]]
dezasete [] = [[]]
dezasete (h:t) = (h:t) : dezasete t

-- isPrefixOf --
dezoito :: Eq a => [a] -> [a] -> Bool
dezoito [] _ = True
dezoito (h:t) [] = False
dezoito (h:t) (x:xs) = if h==x then dezoito t xs else False

-- isSuffixOf --
dezanove :: Eq a => [a] -> [a] -> Bool
dezanove [] _ = True
dezanove (h:t) [] = False
dezanove (h:t) (x:xs) = dezoito (sete (h:t)) (sete (x:xs))  -- em que dezoito representa "isPrefixOf" e sete é "reverse"

-- isSubsequenceOf --
vinte :: Eq a => [a] -> [a] -> Bool
vinte [] _ = True
vinte (h:t) [] = False
vinte (h:t) (x:xs) = if h==x then vinte t xs else vinte (h:t) xs

-- elemIndices --
--vinteum :: Eq a => a -> [a] -> Int
--vinteum n [] = []
--vinteum n (h:t) =

-- nub --
vintedois :: Eq a => [a] -> [a]
vintedois []= []
vintedois (h:t) = if elem h t then vintedois t else h: vintedois t 
--vintedois (h:t) = h : (vintedois (retira h t))
--retira :: a -> [a] -> [a]                                         -- pode-se usar uma função auxiliar para remover os numeros repetidos
--retira x [] = []
--retira x (h:t) = if (x==h) then retira x t else h: retira x t

-- delete --
vintetres :: Eq a => a -> [a] -> [a]
vintetres n [] = []
vintetres n (h:t) = if n==h then t else h: vintetres n t

-- (\\) --
vintequatro :: Eq a => [a] -> [a] -> [a]
vintequatro [] _ = []
vintequatro (h:t) [] = (h:t) 
vintequatro (h:t) (x:xs) = vintequatro (vintetres x (h:t)) xs   -- vintetres corresponde a "delete"

-- union --
vintecinco :: Eq a => [a] -> [a] -> [a]
vintecinco [] [] = []
vintecinco [] l = l
vintecinco l (x:xs) = if elem x l then vintecinco l xs else vintecinco (l ++[x]) xs

-- intersect --
vinteseis :: Eq a => [a] -> [a] -> [a]
vinteseis [] _ = []
vinteseis (h:t) l = if elem h l then h: vinteseis t l else vinteseis t l

-- insert --
vintesete :: Ord a => a -> [a] -> [a]
vintesete n [] = [n]
vintesete n (h:t) = if (n<=h) then [n]++(h:t) else h:vintesete n t

-- maximum --
vinteoito :: Ord a => [a] -> a
vinteoito [x] = x
vinteoito (h:y:t) = if h>=y then vinteoito (h:t) else vinteoito (y:t)
--vinteoito (h:t) = last (quarentadois (h:t))    --quarentadois é "iSort" (coloca a lista por ordem)

-- minimun --
vintenove :: Ord a => [a] -> a
vintenove [x] = x
vintenove (h:y:t)= if h<= (vintenove t) then vintenove (h:t) else vintenove (y:t)
--vintenove (h:t) = head (quarentadois (h:t))    --quarentadois é "iSort" (coloca a lista por ordem)

-- sum --
trinta :: Num a => [a] -> a
trinta [] = 0
trinta [x] = x
trinta (h:t) = h + trinta t 

-- product --
trintaum :: Num a => [a] -> a
trintaum [] = 1
trintaum [x] = x
trintaum (h:t) = h*(trintaum t)

-- and --
trintadois :: [Bool] -> Bool
trintadois [] = True
trintadois (h:t) = (h==True) && trintadois t
--trintadois (h:t) = if (h==True) then trintadois t else False

-- or --
trintatres :: [Bool] -> Bool
trintatres [] = False
trintatres (h:t) = if (h==True) then True else trintatres t

-- unwords --
trintaquatro :: [String] -> String
trintaquatro [] = []
trintaquatro [x] = x
trintaquatro (h:t) = h ++ " " ++ (trintaquatro t)

-- unlines --
trintacinco :: [String] -> String
trintacinco [] = []
trintacinco [x]= x ++ "\n"
trintacinco (h:t) = h ++ "\n" ++ (trintacinco t)

-- pMaior --
trintaseis :: Ord a => [a] -> Int
trintaseis [x] = 0
trintaseis (h:t) = if (h==vinteoito (h:t)) then 0 else 1 + (trintaseis t)   --vinteoito representa "maximum"

-- temRepetidos --
trintasete :: Eq a => [a] -> Bool
trintasete [] = False
trintasete (h:t) = if elem h t then True else trintasete t   

-- algarismos --
trintaoito :: [Char] -> [Char]
trintaoito [] = []
trintaoito (h:t) = if ((h>= '0') && (h<= '9')) then h: trintaoito t else trintaoito t

-- posImpares -- 
trintanove :: [a] -> [a]
trintanove [] = []
trintanove [x] = []
trintanove [x,y] = [y]
trintanove (h:x:t) = x: trintanove t

-- posPares --
quarenta :: [a] -> [a]
quarenta [] = []
quarenta [x] = [x]
quarenta (h:x:t) =  h: quarenta t

-- isSorted --
quarentaum :: Ord a => [a] -> Bool
quarentaum [] = True
quarentaum [x] = True
quarentaum (h:x:t) = (h<=x) && quarentaum (x:t)

-- iSort --
quarentadois :: Ord a => [a] -> [a]
quarentadois [] = []
quarentadois (h:t) = aux h (quarentadois t)

aux :: Ord a => a -> [a] -> [a]
aux x [] = [x]
aux x (h:t) = if x <= h then x:h:t else h:aux x t

-- menor --
quarentatres :: String -> String -> Bool
quarentatres _ "" = False
quarentatres "" _ = True
quarentatres (x:xs) (y:ys) | x > y = False
						  | x == y = quarentatres xs ys
						  | x < y = True

-- elemMSet --
quarentaquatro :: Eq a => a -> [(a, Int)] -> Bool
quarentaquatro _ [] = False
quarentaquatro x ((h,y):t) = if (x==h) then True else quarentaquatro x t

-- lengthMSet --
quarentacinco :: [(a,Int)] -> Int
quarentacinco [] = 0
quarentacinco ((h,y):t) = y + quarentacinco t

-- converteMSet --
quarentaseis :: [(a,Int)] -> [a]
quarentaseis [] = []
quarentaseis ((h,0):t) = quarentaseis t
quarentaseis ((h,y):t) = h: quarentaseis ((h,(y-1)):t) 

-- insereMSet --
quarentasete :: Eq a => a -> [(a,Int)] ->[(a,Int)]
quarentasete x [] = [(x,1)]
quarentasete n ((h,y):t) = if (n==h) then (h,(y+1)):t else (h,y):quarentasete n t

-- removeMSet --
quarentaoito :: Eq a => a -> [(a,Int)] -> [(a,Int)]
quarentaoito _ [] = []
quarentaoito n ((h,y):t) = if (n==h) then (if (y=1) then t else (h,(y-1)):t) else (h,y):quarentaoito n t

-- constroiMSet --
quarentanove :: Ord a => [a] -> [(a,Int)]
quarentanove [] = []
quarentanove (h:t) = quarentasete (quarentanove t)                    -- quarentasete corresponde a "insereMSet"
--quarentanove l = map foux l' 
--     where l' = catorze l
--	       foux l == (head l,length l)

-- somaPares --
cinquenta :: [Int] -> Int
cinquenta [] = 0
cinquenta (h:t) = if (mod h 2 == 0) then h + cinquenta t else cinquenta t

--map :: (a->b) -> [a] -> [b]
--map f [] = []
--map f (x:xs) = f x: map f xs 
