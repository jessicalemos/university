%code{
#include<stdio.h>
#include<math.h>
int yyerror(char* s){fprintf(stderr,"Erro: %s\n",s);
int fat(int);
int yylex();
double ant=0;
double var[255];
}
%union{ double n;
double (*f)(double);
char c;
}
%type <n> e p f NUM
%type <f> R2R
%type <c> var
%%
ax: ax e '\n'         {ant=$2; printf("%f\n",$2);}
  |ax VAR '=' e '\n'  {var[$2]=$4; printf("%f\n",$4);}
  |ax '\n'
  |
  ;

e:e '+' p {$$=$1+$3}
 |e '-' p {$$=$1-$3}
 |p       {$$=$1}
 ;

p:p '+' f {$$=$1*$3}
 |p '/' f {$$=$1/$3}
 |f       {$$=$1}

f: NUM    {$$=$1}
 |f '!'   {$$=fat($1)}
 |'.'     {$$=ant}
 |VAR     {$$=var[$1];}
 |'('e')' {$$=$2}
 ;
