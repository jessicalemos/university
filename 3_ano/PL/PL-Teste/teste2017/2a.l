%{

%}
%x TAG
%%
"<" {BEGIN TAG;}
"</" {BEGIN TAG;}
<TAG>[a-z]+/(" "|">") { ECHO; }
<TAG>">" {BEGIN INITIAL;}
%%

int yywrap(){
	return 1;
}

int main(){
	yylex();
	return 0;
}
