%{
#include<stdio.h>
int n1 = 0;
%}
m1 ([0-9]{2}\.\.\.[0-9]{2}\.\.\.[0-9]{2}\.\.\.[0-9]{2})
m2 ([0-9]{2}:[0-9]{2}:[0-9]{2}:[0-9]{2})
m3 ([0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2})
%x COMENTARIO   
%x PARSE
%%
<COMENTARIO>"*/"    { BEGIN INITIAL; }
<INITIAL>"/*"       { BEGIN COMENTARIO; } 
<INITIAL>{m1}         { ECHO; printf("\n"); n1++;} 
<INITIAL>{m2}         { ECHO; printf("\n"); n1++;} 
<INITIAL>{m3}         { ECHO; printf("\n"); n1++;} 
<*>.|\n { ; }
%%


int yywrap(){
	return 1;
}

int main(){
	yylex();
	printf("Total de matriculas: %d\n", n1);
	return 0;
}
