%{
#include <stdio.h>
int tabid[26];
int proxEnd = 0;
%}
%union { char id; int num;}
%token INTEGER VAR CODE END PRINT READ
%token <id> ID
%token <num> NUM
%type <str> Decls Code Declaracoes Declaracao Tipo Instrucao Instrucoes Atrib Escrita Leitura Expr Termo Fator
%%
Programa : Decls Code  {printf("%s\nSTART\n%s\nSTOP\n", $1, $2);}
		;

Decls : VAR Declaracoes { $$=$2; }

Declaracoes : Declaracao { $$=$1; }
			| Declaracoes ';' Declaracao { asprint(&$$,"%s%s",$1,$3); }
			;

Declaracao : ID ':' Tipo {tabud[$1 - 'a'] = proxEnd++; asprintf(&$$,"PUSHI 0\n");}
		   ;

Tipo : INTEGER
     ;

Code : CODE Instrucoes END { $$=""; }
	 ;

Instrucoes : Instrucao
			| Instrucoes ';' Instrucao
			;

Instrucao : Atrib    { $$=$1; }
		  | Escrita  { $$=$1; }
		  | Leitura  { $$=$1; }
		  ;

Atrib : ID '=' Expr
	  ;

Leitura : READ '(' ID ')'
		;

Escrita : PRINT '(' ID ')'
		;

Expr : Termo
	 | Expr '+' Termo
	 | Expr '-' Termo
	 ;

Termo : Fator
	  | Termo '*' Fator
	  | Termo '/' Fator
	  ;

Fator : NUM
	  | ID
	  | '(' Expr ')'
	  ;
%% 

#include "lex.yy.c"
void yyerror(char* s){
	printf("Error %s",s);
}

int main(){
	yyparse();
	return 0;
}