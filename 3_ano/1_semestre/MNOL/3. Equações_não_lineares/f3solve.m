%Sistema de equações não lineares sem derivadas
%Para x(1) = (0,0)^T
[x,f,extf,outp]=fsolve('f3',[0;0])
%R: x = [0.1605; 0.4931] logo x1 = 0.1605 e x2 = 0.4931 -> f(x) = [1.0e-11
%* -0.0929; 1.0e-11 * -0.2369]
%Temos que extf - exit flag = 1 -> logo convergiu para uma raiz
%Número de iterações = 3

%Para x(1) = (1,2)^T
%[x,f,extf,outp]=fsolve('f3',[1;2])
%R: x = [0.1605; 0.4931] logo x1 = 0.1605 e x2 = 0.4931 -> f(x) = [1.0e-08 
%* -0.9695; 1.0e-08 * -0.0220]
%Temos que extf - exit flag = 1 -> logo convergiu para uma raiz
%Número de iterações = 4