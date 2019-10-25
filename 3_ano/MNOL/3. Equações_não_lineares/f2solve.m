op=optimset('Jacobian','on');
x0=-1;
[x,f,extf,outp]=fsolve('f2',x0,op)
%R: Não foram encontradas soluções
%Temos que extf - exit flag = -2 -> converge para um ponto que não é uma
%raiz
%Número de iterações = 21

%op=optimset('Jacobian','on');
%x0=1;
%[x,f,extf,outp]=fsolve('f2',x0,op)
%R: Não foram encontradas soluções
%Temos que extf - exit flag = -2 -> converge para um ponto que não é uma
%raiz
%Número de iterações = 22

%op=optimset('Jacobian','on');
%x0=-10;
%[x,f,extf,outp]=fsolve('f2',x0,op)
%R: Não foram encontradas soluções
%Temos que extf - exit flag = -2 -> converge para um ponto que não é uma
%raiz
%Número de iterações = 18

%op=optimset('Jacobian','on');
%x0=10;
%[x,f,extf,outp]=fsolve('f2',x0,op)
%R: Não foram encontradas soluções
%Temos que extf - exit flag = -2 -> converge para um ponto que não é uma
%raiz
%Número de iterações = 21