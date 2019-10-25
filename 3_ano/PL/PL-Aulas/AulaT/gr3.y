%code{
	#include<stdio.h>
	#define _GNU_SOURCE
	void yyerror(){fprintf(stderr,"Erro\n");}
}
%union {int i;}
%token ID 
%type <i> M ID E L
%%
L : '[' M ']' '\n' {printf("%d\n",$2);}
  ;

M : E       { $$ = $1;}
  | E ',' M { asprintf(&$$, "%s\n%s, $1, $3);}
  ;

E : '[' M ']'      { asprintf(&$$, "\\BEI\n %s \n\\ENDI", $1);}
  | ID             { asprintf(&$$, "\\item %s",$1);}
  ;
%%
#include "lex.yy.c"
