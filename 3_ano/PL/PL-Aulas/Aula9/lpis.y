%{
#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
int tabid[26];
int proxEnd = 0;
int labelCount = 0;
%}
%union { char id; int num; char* str;}
%token INTEGER VAR CODE END PRINT READ
%token <id> ID
%token <num> NUM
%type <str> Decls Code Declaracoes Declaracao Tipo Instrucao Instrucoes Atrib Escrita Leitura Expr Termo Fator Condicao Cond
%%
Programa : Decls Code  {printf("%s\nSTART\n%s\nSTOP\n", $1, $2);}
		;

Decls : VAR Declaracoes { $$=$2; }

Declaracoes : Declaracao                 { $$=$1; }
			| Declaracoes ';' Declaracao { asprintf(&$$,"%s%s",$1,$3); }
			;

Declaracao : ID ':' Tipo {
							if(tabid[$1 -'a'] == -1){
								tabid[$1 - 'a'] = proxEnd++; 
								asprintf(&$$,"PUSHI 0\n");
							} else {
								printf("Error: Variavel '%c' não declarada.\n",$1);
								exit(1);
							}
						}
		   ;

Tipo : INTEGER
     ;

Code : CODE Instrucoes END { $$=""; }
	 ;

Instrucoes : Instrucao                   { $$=$1; }
			| Instrucoes ';' Instrucao   { asprintf(&$$,"%s\n%s",$1,$3); }
			;

Instrucao : Atrib    { $$=$1; }
		  | Escrita  { $$=$1; }
		  | Leitura  { $$=$1; }
		  | Condicao { $$=$1; }
		  ;

Atrib : ID '=' Expr   {
							if(tabid[$1 - 'a'] != -1){
								asprintf(&$$,"%sSTOREG %d\n",$3,tabid[$1 -'a']);
							} else {
								printf("Error: Variavel '%c' não declarada.\n",$1);
								exit(1);
							}
						}
	  ;

Leitura : READ '(' ID ')' {
								if(tabid[$3 -'a'] != -1){
									asprintf(&$$, "READ\nATOI\nSTOREG %d\n", tabid[$3 - 'a']);
								} else {
									printf("Error: Variavel '%c' não declarada.\n",$3);
									exit(1);
								}
						  }
		;

Escrita : PRINT '(' Expr ')'   { asprintf(&$$, "%sWRITEI\n",$3); }
		;

Condicao : IF '(' Cond ')' '{' Instrucoes '}' ELSE '{' Instrucoes '}' {
			asprintf(&$$, "%sJZ SENAO%d\n%sJUMP FIMSE%d\nSENAO%d: NOOP\n%sFIMSE%d: NOOP\n", $3, lableCount, $6, lableCount, lableCount, $10, lableCount); 
			lableCount++;
			}
		 ;

Cond : Empr '<' Expr { asprintf(&$$,"%s%sLT\n",$1,$2); }
Cond : Empr '>' Expr { asprintf(&$$,"%s%sGT\n",$1,$2); }

Expr : Termo                 { $$=$1; }
	 | Expr '+' Termo        { asprintf(&$$, "%s%sADD\n",$1,$3); }
	 | Expr '-' Termo        { asprintf(&$$, "%s%sSUB\n",$1,$3); }
	 ;

Termo : Fator
	  | Termo '*' Fator      { asprintf(&$$, "%s%sMUL\n",$1,$3); }
	  | Termo '/' Fator      { asprintf(&$$, "%s%sDIV\n",$1,$3); }
	  ;

Fator : NUM                  { asprintf(&$$, "PUSHI %d",$1); }
	  | ID                   { 
	  							if(tabid[$1 - 'a'] != -1){
	  								asprintf(&$$, "PUSHG %d\n", tabid[$1 - 'a']);
	  							} else {
	  								printf("Error: Variavel '%c' não declarada.\n",$1);
									exit(1);
	  							}
	  						}
	  | '(' Expr ')'        { $$=$2; }     
	  ;

%% 
#include "lex.yy.c"
void yyerror(char* s){
	printf("Error %s",s);
}

int main(){
	for(int i=0; i<26; i++) tabid[i] = -1;
	yyparse();
	return 0;
}