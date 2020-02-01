%option noyywrap
%{
#define ID 261
#define STR 262
#define NUM 263
%}

%%
"+" { return "+"; }
"-" { return "-; }
"*" { return "*"; }
"/" { return "/"; }
"(" { return yytext[0]; }
[){}\[\].;,<>=] { return yytext[0]; }
"int" { return 256; }
"for" { return 257; }
"if" { return 258; }
"else" { return 259; }
"while" { return 260; }
[a-zA-Z][a-zA-Z0-9]* { return ID; }
\"[^"]*\" { return STR; }
[-+]?[0-9]+(\.[0-9]+)? { return NUM; }
%%

int main(){
	int s;
	while(s = yylex()){
		printf("%d ",s);
	}
	return 0;
}