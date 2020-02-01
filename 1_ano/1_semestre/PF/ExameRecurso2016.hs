module ExameRecurso2016 where

import Data.Char
import Data.List

-- Exercicio 1 --
--A)
myIntersperse :: a -> [a] -> [a]
myIntersperse n [] = []
myIntersperse n [x] = [x]
myIntersperse n (x:xs) = x:n:(myIntersperse n xs)  

--B)
myInits :: [a] -> [[a]]
myInits [] = []
myInits (h:t) = []:(map f ys) 
                    where ys = myInits t 
                          f l = h:l  

-- Exercicio 2 --
type Aluno = (Numero,Nome,Classificacao)
type Numero = Int
type Nome = String
data Classificacao = Aprov Int| Rep| Faltou
data Turma = Vazia | Nodo Aluno Turma Turma

--A)
inscNum :: Numero -> Turma -> Bool
inscNum _ Vazia = False
inscNum n (Nodo (num,_,_) e d) = (n==num) || (inscNum n e) || (inscNum n d)

--B)
aprovAv :: Turma -> Float
aprovAv Vazia = 0
aprovAv turma = let (x,y) = aprov turma
                  in x/y 

aprov Vazia = (0,0)
aprov (Nodo (_,_,Aprov a) e d) = ((1 + ae + ad) , (1+ be + bd))
                 where (ae,be) = aprov e
                       (ad,bd) = aprov d
aprov (Nodo (_,_,Faltou) e d) = ((ae + ad),(be + bd))
                 where (ae,be) = aprov e
                       (ad,bd) = aprov d 
aprov (Nodo (_,_,_) e d) = ((ae + ad),(1 + be + bd)) 
                 where (ae,be) = aprov e
                       (ad,bd) = aprov d

--C)
melhorNota :: Turma -> Maybe Int
melhorNota Vazia = Nothing
melhorNota turma = Just (maximum (aux turma))
                     where aux Vazia = []
                           aux (Nodo (_,_,Aprov a) Vazia d) = [a] ++ (aux d)
                           aux (Nodo (_,_,_) Vazia d) = aux d
                           aux (Nodo (_,_,Aprov a) e Vazia) = [a] ++ (aux e)
                           aux (Nodo (_,_,_) e Vazia) = aux e
                           aux (Nodo (_,_,Aprov a) e d) = [a]++(aux e)++(aux d)
                           aux (Nodo (_,_,_) e d) = (aux e)++(aux d)

-- Exercicio 3 --
type Polinomio = [Coeficientes]
type Coeficientes = Float

--A)
adicionaPoli :: Polinomio -> Polinomio -> Polinomio
adicionaPoli [] [] = []
adicionaPoli l1 [] = l1
adicionaPoli [] l2 = l2
adicionaPoli (x:xs) (y:ys) = (x+y):(adicionaPoli xs ys)

--B)
apresentaPoli :: Polinomio -> IO ()
apresentaPoli l = do
--	putStrLn (poli l)
    putStrLn "Diga um valor para x: "
    x <- getLine
    let a = read x :: Float
    putStrLn (show (resultado a l))

resultado :: Float -> Polinomio -> Float                                    
resultado x l = sum (aux l (reverse(aux2 x l)))

aux :: Polinomio -> [Float] -> [Float]          
aux [] [] = []
aux l1 [] = l1
aux [] l2 = l2
aux (x:xs) (y:ys) = (x*y):(aux xs ys)

aux2 :: Float -> Polinomio -> [Float]
aux2 x l = da x ((length l)-1)
             where da x 0 = [1]
                   da x n = [x^n] ++ (da x (n-1))  

--poli (h:t) = 

--C)
multPoli :: Polinomio -> Polinomio -> Polinomio
multPoli [] [] = []

