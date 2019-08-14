%{
#include "y.tab.h"
%}

%%
[{}();,']                { return yytext[0]; } 
'[^']*'      			 { yylval.str = strdup(yytext); return STRING; }
[0-9]+(\.[0-9]+)?        { yylval.num = atof(yytext); return NUM; }
[a-zA-Z][a-zA-Z0-9]*     { yylval.str = strdup(yytext); return ID; }
.|\n                     { ; }
%%

int yywrap(){
    return 1;
}
