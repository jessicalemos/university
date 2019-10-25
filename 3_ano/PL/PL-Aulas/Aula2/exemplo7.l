%{
#include<stdio.h>
#include<string.h>
char* eu = "";
char* ele = "";
%}
%x EU
%x ELE
%%
^(?i:eu)\ *=\ *      {BEGIN EU;}
<EU>\.[ ]*\n         {BEGIN INITIAL;}
<EU>[^.]+            { eu = strdup(yytext);}
^(?i:ele)\ *=\ *     {BEGIN ELE;}
<ELE>\.[ ]*\n        {BEGIN INITIAL;}
<ELE>[^.]+           {ele = strdup(yytext);}
^(?i:eu)             {printf("(%s) ", eu);}
^(?i:ele)            {printf("(%s) ", ele);}
%%


int yywrap(){
	return 1;
}

int main(){
	yylex();
	return 0;
}
