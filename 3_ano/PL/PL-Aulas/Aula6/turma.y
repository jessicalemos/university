#include <stdio.h> 
%token ID
%token STRING
%token NUM
%%
Turma : ID '{' Alunos '}'
	  ;
Alunos : Aluno  ';'
	   | Alunos Aluno ';'
Aluno : ID STRING Notas
	  ;
CodA : ID
	 ;
Notas : '(' LitNum ')'
ListNUM : NUM
	    ! ListNum ',' NUM
%%
#include "lex.yy.c"
int yyerror(){
	printf("Error: %s\n",s);	
}

int main(){
	yyparse();
	return 0;
}