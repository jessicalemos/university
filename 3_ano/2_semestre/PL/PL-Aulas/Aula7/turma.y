%{
#include <stdio.h>
int turmas = 0, notas = 0, alunos = 0;
float soma = 0.0;
%}
%union{char* str; float num; } 
%token <str> ID
%token <str> STRING
%token <num> NUM
%type <str> CodA Nome
%%
Turmas :              {turmas = 0;}
       | Turmas Turma {turmas++;}
       ;
Turma : ID '{' Alunos '}' {printf("=== A turma %s tem %d alunos ===\n", $1, alunos); alunos = 0;}
	  ;
Alunos : Aluno  ';'         {alunos = 1;}
	   | Alunos Aluno ';'   {alunos++;}
       ;
Aluno : CodA Nome Notas   {printf("O aluno tem %s (%s) tem %d notas, e média: %f\n", $1, $2, notas, soma/notas);}
	  ;
CodA : ID {$$=$1;}
	 ;
Nome : STRING {$$ = $1;}
     ;
Notas : '(' ListNUM ')'
      ;
ListNUM : NUM             {notas = 1; soma = $1;}
	    | ListNUM ',' NUM {notas++; soma += $3;}
        ;
%%
#include "lex.yy.c"
int yyerror(char* s){
	printf("Error: %s\n",s);	
}

int main(){
	yyparse();
    printf("#t: %d\n", turmas);
	return 0;
}
