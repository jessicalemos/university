%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).
filho( manuel,antonio ).
filho( antonio,marco ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :-
    filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo(A,N) :- filho(N,X), pai(A,X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}

neto(N,A) :- avo(A,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo(BA,BN) :- avo(BA,X), pai(X,BN).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado trisavo: Trisavo,Tetraneto -> {V,F}

trisavo(TA,TN) :- bisavo(TA,X), pai(X,TN).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tetraneto: Tetraneto,Trisavo -> {V,F}

tetraneto(TN,TA) :- trisavo(TA,X), pai(X,TN).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente(D,A) :- filho(D,A).
descendente(D,A) :- filho(D,X), descendente(X,A). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente(D,A,1) :- filho(D,A).
descendente(D,A,N) :- filho(D,X), descendente(X,A,G), N is G+1.
%descendente(D,A,N+1) :- filho(D,X), descendente(X,A,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado genero: Nome,Sexo -> {V,F}

genero(carlos,M).
genero(joao,M).
genero(joana,F).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}
avoo(A,N) :- descendente(N,A,2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: Valor1,Valor2,Resultado -> {V,F}
soma(V1,V2,R) :- R is V1 + V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: Valor1,Valor2,Valor3,Resultado -> {V,F}
soma(V1,V2,V3,R) :- R is V1 + V2 + V3.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: Conjunto,Resultado -> {V,F}
somaC( [],0 ). 
somaC( [X|L],R ) :- somaC(L,K), R is X+K.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacao: Valor1,Valor2,Operador,Resultado -> {V,F}
operacao(V1,V2,subtracao,R) :- R is V1 - V2.
operacao(V1,V2,soma,R) :- R is V1 + V2.
operacao(V1,V2,divisao,R) :- V1 \= 0, R is V1 / V2.
operacao(V1,V2,multiplicacao,R) :- R is V1 * V2. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacao: Conjunto,Resultado -> {V,F}
operacao([],_,0).
operacao([X|L],subtracao,R) :- operacao(L,subtracao,Y), operacao(X,Y,subtracao,R).
operacao([X|L],soma,R) :- operacao(L,soma,Y), operacao(X,Y,soma,R).
operacao([X|L],divisao,R) :- operacao(L,divisao,Y), operacao(X,Y,divisao,R).
operacao([X|L],multiplicacao,R) :- operacao(L,multiplicacao,Y), operacao(X,Y,multiplicacao,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Valor1,Valor2,Resultado -> {V,F}
maior(V1,V1,V1).
maior(V1,V2,V1) :- V1 > V2.
maior(V1,V2,V2) :- V1 < V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Valor1,Valor2,Valor3,Resultado -> {V,F}
maior(V1,V2,V3,V1) :- V1 > V2, V1 > V3.
maior(V1,V2,V3,V2) :- V2 > V1, V2 > V3.
maior(V1,V2,V3,V3).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Conjunto,Resultado -> {V,F}
maior( [X],X ).
maior( [X|L],R ) :- maior(L,Y), maior(X,Y,R). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Valor1,Valor2,Valor3,Resultado -> {V,F}
maior(V1,V2,V3,V1) :- V1 < V2, V1 < V3.
maior(V1,V2,V3,V2) :- V2 < V1, V2 < V3.
maior(V1,V2,V3,V3).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado menor: Valor1,Valor2,Resultado -> {V,F}
menor(V1,V1,V1).
menor(V1,V2,V1) :- V1 < V2.
menor(V1,V2,V2) :- V1 > V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado menor: Valor1,Valor2,Resultado -> {V,F}
menor(V1,V2,V3,V1) :- V1 < V2, V1 < V3.
menor(V1,V2,V3,V2) :- V1 > V2, V3 > V2.
menor(V1,V2,V3,V3).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Conjunto,Resultado -> {V,F}
menor( [X],X ).
menor( [X|L],R ) :- menor(L,Y), menor(X,Y,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Conjunto,Resultado -> {V,F}
comprimento([], 0).
comprimento([H|T],N) :- comprimento(T,M), N is M+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado media: Conjunto,Resultado -> {V,F}
media( [X],X ).
media( [X|L],R ) :- operacao([X|L],soma,Y), comprimento([X|L],C), R is Y/C.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado crescente: Conjunto -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado decrescente: Conjunto -> {V,F}

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado vazios: Conjunto -> {V,F}
vazios([],0).
vazios([[]|L],R) :- vazios(L,Y), R is Y+1.
vazios([H|L],R) :- vazios(L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: valor,conjunto -> {V,F}
%pertence([X],X). 
%pertence([X|L],V) :- X==V ; pertence(L,V).
pertence(X,[X|T]).
pertence(X,[H,T]) :- X \= H, pertence(X,T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado diferentes: conjunto,resultado -> {V,F}
diferentes( [],0 ).
diferentes( [X|L],R ) :- pertence(X,L), diferentes(L,K), R is K.
diferentes( [X|L],R ) :- \+(pertence(X,L)), diferentes(L,K), R is K+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apaga1: conjunto,resultado -> {V,F}
apaga1(X,[H|T],[H|L]) :- X \= H, apaga1(X,T,L).
apaga1(X,[X,T],T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: L1,L2,L -> {V,F}
concatenar([],L2,L2).
concatenar([H|T],L2,[H|L]):- concatenar(T,L2,L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: conjunto, conjunto -> {V,F}
sublista(L,S) :- concatenar(L1,L3,L), concatenar(S,L2,L3).