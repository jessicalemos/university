%{
#include<stdio.h>
%}
%%
Janeiro {printf("1");}
Fevereiro {;}
Marco {ECHO;}
%%

int yywrap(){
	return 1;
}

int main(){
	printf("Vou começar!\n");
	yylex();
	printf("Terminei!\n");
	return 0;
}
