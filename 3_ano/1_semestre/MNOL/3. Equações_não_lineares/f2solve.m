op=optimset('Jacobian','on');
x0=-1;
[x,f,extf,outp]=fsolve('f2',x0,op)
%R: N�o foram encontradas solu��es
%Temos que extf - exit flag = -2 -> converge para um ponto que n�o � uma
%raiz
%N�mero de itera��es = 21

%op=optimset('Jacobian','on');
%x0=1;
%[x,f,extf,outp]=fsolve('f2',x0,op)
%R: N�o foram encontradas solu��es
%Temos que extf - exit flag = -2 -> converge para um ponto que n�o � uma
%raiz
%N�mero de itera��es = 22

%op=optimset('Jacobian','on');
%x0=-10;
%[x,f,extf,outp]=fsolve('f2',x0,op)
%R: N�o foram encontradas solu��es
%Temos que extf - exit flag = -2 -> converge para um ponto que n�o � uma
%raiz
%N�mero de itera��es = 18

%op=optimset('Jacobian','on');
%x0=10;
%[x,f,extf,outp]=fsolve('f2',x0,op)
%R: N�o foram encontradas solu��es
%Temos que extf - exit flag = -2 -> converge para um ponto que n�o � uma
%raiz
%N�mero de itera��es = 21