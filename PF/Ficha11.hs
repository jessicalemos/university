module Ficha11 where

import Data.Char
import Data.List
import System.Random

-- Exercicio 1 --
--A)
bingo :: IO ()
bingo = do
    geraNumeros2 [0..90]

geraNumeros :: [Int] -> IO ()
geraNumeros [] = putStrLn "Acabou!"
geraNumeros ns = do
    x <- randomRIO (0,90) :: IO Int
    if elem x ns 
      then do c <- getChar
              putStrLn (show x)
              let newns = delete x ns
              geraNumeros newns
      else geraNumeros ns 

geraNumeros2 :: [Int] -> IO ()
geraNumeros2 [] = putStrLn "Acabou!"
geraNumeros2 ns = do 
    let n = length ns
    i <- randomRIO (0,n-1)
    y <- getChar
    putStrLn $ show (ns !! i)
    let news = delete (ns !! i) ns
    geraNumeros2 news

geraNumeros3 :: [Int] -> IO ()
geraNumeros3 [] = putStrLn "Acabou!"
geraNumeros3 ns = do
    i <- randomRIO (0,(length ns)-1)
    getChar
    ns2 <- retira i ns
    geraNumeros3 ns2

retira :: Int -> [Int] -> IO [Int]
retira i ns = do
    let x = ns !! i 
    putStrLn $ show x
    return $ delete x ns

--B)
{-
mastermind :: IO ()
mastermind = do
    ns <- geraSequencia
    testaSeq ns

geraSequencia :: IO [Int]
geraSequencia = do
    n1 <- randomRIO (0,9) :: IO Int
    n2 <- randomRIO (0,9) :: IO Int
    n3 <- randomRIO (0,9) :: IO Int
    n4 <- randomRIO (0,9) :: IO Int
    return [n1,n2,n3,n4]

testaSeq :: [Int] -> IO ()
testaSeq ns = do
    line <- getLine
    let (ok,quaseOK) = verifica line ns
    if (ok==length ns) 
      then putStrLn "Conseguiste!"
      else do putStrLn (show ok ++ "/" ++ show quaseOK)
              testaSeq ns

verifica :: [Char] -> Int -> (Int,Int)
verifica [] _ _ = (0,0)
verifica (h:t) ns pos | (elem (digitToInt h) ns) && (ns!!pos)==(digitToInt h) = (ok+1,qOK)
                      | elem (digitToInt h) ns = (ok,qOK+1)
                         where (ok,qOK) = verifica t ns (pos+1)
-}

-- Exercicio 2 --
data Aposta = Ap [Int] (Int,Int)
            deriving Show

--A)
valida :: Aposta -> Bool
valida (Ap [] (a,b)) = False
valida (Ap (h:t) (a,b)) | length (h:t)== 5 && a/= b && a<=9 && a>=1 && b<=9 && b>=1 && (entre (h:t)) && (ve (h:t)) = True
                        | otherwise = False

ve [] = True
ve (h:t) | elem h t = False
         | otherwise = ve t

entre [] = True
entre (h:t) | h>=1 && h<=50 = entre t
            | otherwise = False

--B)
comuns :: Aposta -> Aposta -> (Int,Int)
comuns aposta1 aposta2 = ((numeros aposta1 aposta2), (estrelas aposta1 aposta2))

numeros (Ap [] (a,b)) (Ap (y:ys) (c,d)) = 0
numeros (Ap (x:xs) (a,b)) (Ap (y:ys) (c,d)) | elem x (y:ys) = 1 + numeros (Ap xs (a,b)) (Ap (y:ys) (c,d))
                                            | otherwise = numeros (Ap xs (a,b)) (Ap (y:ys) (c,d))

estrelas (Ap xs (a,b)) (Ap ys (c,d)) | (a==c && b==d) || (a==d && b==c) = 2
                                     | (a/=c && b/=d) || (a/=d && b/=c) = 0
                                     | otherwise = 1

--C)
--i)
instance Eq Aposta where
    (==) (Ap l1 (a,b)) (Ap l2 (c,d)) = (a==c && b==d) || (a==d && b==c) && l1==l2

--ii)
premio :: Aposta -> Aposta -> Maybe Int
premio aposta1 aposta2 = 
    let (n,e) = comuns aposta1 aposta2
      in if n==5 && e==2 
           then Just 1 else if n==5 && e==1 
                              then Just 2 else if n==5 && e==0
                                                 then Just 3 else if n==4 && e==2 
                                                                    then Just 4 else Nothing    --continua para os restantes 

--D)
--i)
--leAposta :: IO Aposta
--leAposta = do 
  --  putStrLn "Diga a sua aposta:"
   -- x <- getLine
   -- let 
   -- return Ap 

--ii)
--joga :: Aposta -> IO ()

--E)
geraChave :: IO Aposta
geraChave = do
    ns <- geraNumero
    xs <- geraEstrelas
    return (Ap ns xs)

geraNumero :: IO [Int]
geraNumero = do
    n1 <- randomRIO (0,50) :: IO Int
    n2 <- randomRIO (0,50) :: IO Int
    n3 <- randomRIO (0,50) :: IO Int
    n3 <- randomRIO (0,50) :: IO Int
    n4 <- randomRIO (0,50) :: IO Int
    n5 <- randomRIO (0,50) :: IO Int
    return [n1,n2,n3,n4,n5]

geraEstrelas :: IO (Int,Int)
geraEstrelas = do 
    e1 <- randomRIO (0,5) :: IO Int
    e2 <- randomRIO (0,5) :: IO Int
    if e2==e1 
      then geraEstrelas
      else return (e1,e2)

 {-
geraEstrelas2 :: IO (Int,Int)
geraEstrelas2 = do 
    e1 <- randomRIO (0,5) :: IO Int
    e2 <- rd e1
    return (e1,e2)


rd e1 = do e2 <- randomRIO (0,5) :: IO Int
        if e1==e2 
          then rd e1 
          else return e2
-}

{-
--F)
main :: IO ()
main = do ch <- geraChave
          ciclo ch

ciclo :: Aposta -> IO ()


menu :: IO String
menu = do { putStrLn menutxt
          ; putStrLn "Opcao:"
          ; c <- getLine
          ; return c
          }
    where menutxt = unlines ["",
                             "Apostar.......... 1"
                             "Gerar nova chave..2"
                             "",
                             "Sair..............0"]
-}

-- Exemplos IO --
numero :: Int -> IO Int
numero n = do 
    putStrLn "The number is "
    return n

st :: IO ()
st = do 
    putStrLn "Diga o seu nome: "
    x <- getLine
    putStrLn x

tamanho :: IO ()
tamanho = do
    putStrLn "Diga o seu nome:"
    x <- getLine 
    let tam = show (length x)
    putStrLn tam

tamanho2 :: IO Int
tamanho2 = do
    putStrLn "Diga o seu nome:"
    x <- getLine 
    let tam = length x
    return tam

diz :: IO ()
diz = do 
    putStrLn "Diga o seu nome:"
    x <- getLine
    putStrLn ("Hello " ++ x ++ "!")