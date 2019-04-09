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
% Extensao do predicado par: valor -> {V,F}
par(0).
par(X) :-
	N is X-2,
	N >= 0,
	par(N).

%-----------------------------------------------------------------
% Extensao do predicado impar: valor -> {V,F}
impar(1).
impar(X) :-
	N is X-2,
	N > 0,
	impar(N).

%-----------------------------------------------------------------
% Extensao do predicado naturais: valor -> {V,F}
naturais(0).
naturais(X) :-
	N is X-1,
	N >= 0,
	naturais(N).

%-----------------------------------------------------------------
% Extensao do predicado negativos: valor -> {V,F}
negativos(0).
negativos(X) :- 
	N is X+1,
	N =< 0,
	negativos(N).

%-----------------------------------------------------------------
% Extensao do predicado inteiros: valor -> {V,F}
inteiros(X) :- naturais(X).
inteiros(X) :- negativos(X).

%-----------------------------------------------------------------
% Extensao do predicado divisor: valor -> {V,F}


%-----------------------------------------------------------------
% Extensao do predicado primo: valor -> {V,F}
primo(2).