%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%-----------------------------------------------------------------
% Extensao do predicado pertence: valor,conjunto -> {V,F}
pertence(X,[X|L]).
pertence(X,[Y|L]) :- X \= Y, pertence(X,L).

%-----------------------------------------------------------------
% Extensao do predicado comprimento: valor,conjunto -> {V,F}
comprimento([],0).
comprimento([X|L],R) :- comprimento(L,Y), R is Y+1.

%-----------------------------------------------------------------
% Extensao do predicado diferentes: valor,conjunto -> {V,F}
diferentes([],0).
diferentes([X|L],R) :- pertence(X,L), diferentes(L,Y), R is Y.
diferentes([X|L],R) :- \+pertence(X,L), diferentes(L,Y), R is Y+1.


%-----------------------------------------------------------------
% Extensao do predicado apaga1: valor,conjunto,conjunto -> {V,F}
apaga1(X,[X|T],[T]).
apaga1(X,[H|T],[H|L]) :- X \= Y, apaga1(X,T,L).


%----------------------------------------------------------------
% Extensao do predicado apagaT: valor,conjunto,conjunto -> {V,F}
apagaT(_,[],[]).
apagaT(X,[X|T],[X|L]) :- apagaT(X,T,L).
apagaT(X,[Y|T],[Y|L]) :- X\=Y, apagaT(X,T,L).

%----------------------------------------------------------------
% Extensao do predicado adiciona: valor,conjunto,conjunto -> {V,F}
adiciona(X,[],[X]).
adiciona(X,[X|L],[X|L]).
adiciona(X,[H|T],[H|R]) :- adiciona(X,T,R).

%--------------------------------------------------------------
% Extensao do predicado concatenar: L1,L2,L -> {V,F}
concatenar([],L2,L2).
concatenar([H|T],L2,[H|L]):- concatenar(T,L2,L).

%----------------------------------------------------------------
% Extensao do predicado inverter: conjunto,conjunto -> {V,F}
inverter([X],[X]).
inverter([H|L],R) :- inverter(L,S), concatenar(S,[H],R).


%----------------------------------------------------------------
% Extensao do predicado sublista: conjunto,conjunto -> {V,F}
isSubL(S,L) :- concatenar(S,X,R), concatenar(Y,R,L).