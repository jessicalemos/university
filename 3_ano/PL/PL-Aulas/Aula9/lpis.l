%{
#include "y.tab.h"
#include <ctype.h>
%}

%%
VAR                      { return VAR; }
(?i:INTEGER)             { return INTEGER; } 
CODE                     { return CODE; }
END						 { return END; }
(?i:READ)                { return READ; }
(?i:PRINT)               { return PRINT; }
[();:+\-*/={}<>!]        { return yytext[0]; } 
[0-9]+                   { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z]                 { yylval.id = tolower(yytext[0]); return ID; }
.|\n                     { ; }
%%

int yywrap(){
    return 1;
}