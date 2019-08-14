%{
#include<stdio.h>
#include<string.h>
char* eu = "";
char* ele = "";
%}
%x EU
%x ELE
%%
^(?i:eu)\ *=\ [^.]+\.      { yytext[yyleng -1] = '\0'; eu = strdup(yytext + 5);}
^(?i:ele)[ ]*=\ [^.]+\.     { yytext[yyleng -1] = '\0'; ele = strdup(yytext + 6);}
^[Ee][Uu]:                {printf("(%s) ", eu);}
^(?i:Ele):                {printf("(%s) ", ele);}
%%


int yywrap(){
	return 1;
}

int main(){
	yylex();
	return 0;
}
