%{
#include<stdio.h>
%}
%%
[jJ][aA][nN]([eE][iI][rR][oO])? {printf("1");}
(?i:Fevereiro) { printf("2");}
(?i:Marco) {printf("3");}
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
