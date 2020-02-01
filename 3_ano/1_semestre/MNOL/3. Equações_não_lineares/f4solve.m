%Sistema de equações não lineares com derivadas
op=optimset('Jacobian','on');
[x,f,extf,outp]=fsolve('f4',[1; 1; -1],op)
%R: x = [1.0e-09 * 0; 1.0e-09 * 0.1528; 1.0e-09 * 0.0280] logo x1 = 0 
% x2 = 1.0e-09 * 0.1528 e x3 = 1.0e-09 * 0.0280 -> f(x) = [1.0e-09 *
% 0; 1.0e-09 * 0.1528; 1.0e-09 * 0.0280];
%Temos que extf - exit flag = 1 -> logo convergiu para uma raiz
%Número de iterações = 5