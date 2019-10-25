%{
#include<stdio.h>
%}
prefixo (\+341\-)
dig [0-9]
%%
112          {printf("Emergencia\n");}
{prefixo}?2{dig}{8}      {printf("%s\n",yytext);}
{prefixo}?9[1236][0-9]{7}      {printf("%s\n",yytext);}
.|\n                 {;}
%%


int yywrap(){
	return 1;
}

int main(){
	printf("Vou começar!\n");
	yylex();
	//printf("Terminei! Janeiros: %d\n", jans);
	return 0;
}
