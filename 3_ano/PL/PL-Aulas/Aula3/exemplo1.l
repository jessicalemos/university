%option noyywrap

%{
#include <stdio.h>
%}
SEP [\t\n.,;:!?]
%%
\\tb              {printf("também");}
\\mm              {printf("mesmo");}
\\mb              {printf("muito bem");}
\\cqd             {printf("como queríamos demonstrar");}
\\agr             {printf("agora");}
[a-zA-Z]+\//{SEP}       {yytext[yyleng -1] = '\0'; printf("%smente",yytext);}
~[a-zA-Z]+        {printf("in");}
%%

int main(){
	yylex();
	return 0;
}
