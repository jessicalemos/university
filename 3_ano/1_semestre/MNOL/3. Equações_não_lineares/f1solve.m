%usando x(1)=2
[x,f,extf,outp]=fsolve('f1',2)
%R: x = 2.6741 e f(x) = 1.5490e-12
%Temos que extf - exit flag = 1 -> logo convergiu para uma raiz
%Número de iterações = 7