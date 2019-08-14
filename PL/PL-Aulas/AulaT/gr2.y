%code{
	#include<stdio.h>
	void yyerror(){fprintf(stderr,"Erro\n");}
}
%union {int i;}
%token INT 
%type <i> M ID E L
%%
L : '[' M ']' '\n' {printf("%d\n",$2);}
  ;

M : E
  | E ',' M {
  ;

/*M : INT      {$$=$1;}
  | L
  | INT ', M {$$=$1+$3;}
  | L ',' M
  ;*/

E : L      {asprintf(&$$, "\\BEI\n %s \n\\ENDI", $1);}
  | ID     {asprintf(&$$, "\\item %s",$1);}

%%
#include "lex.yy.c"
