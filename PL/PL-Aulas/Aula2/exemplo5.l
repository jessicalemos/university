%{
#include<stdio.h>

#include<stdlib.h>
int soma = 0;
double sum = 0.0;
%}
prefixo (\+341\-)
dig [0-9]
%x ACORDA
%%
!|(?i:agora)                         {BEGIN ACORDA;}
[+\-]?{dig}+                         {soma += atoi(yytext);}
<ACORDA>[+\-]?{dig}+(\.{dig}+)       {sum += atof(yytext);}
<ACORDA>=                            {printf("%f\n",sum); sum = 0.0;}
<ACORDA>!|(?i:agora)                 {BEGIN INITIAL;}
<*>.|n                               {;}
%%

int yywrap(){
	return 1;
}

int main(){
	printf("Vou começar!\n");
	yylex();
//	printf("Terminei! Soma: %d, Sum: %f\n", soma,sum);
	return 0;
}
