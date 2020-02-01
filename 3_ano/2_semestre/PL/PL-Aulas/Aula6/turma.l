%{
#include "y.tab.h"
%}

%%
[{}();']                 { return yytext[0]; } 
'[^']*'      			 { return STRING; }
[0-9]+(\.[0-9]+)?        { return NUM; }
[a-zA-Z][a-zA-Z0-9]*     { return ID; }
%%