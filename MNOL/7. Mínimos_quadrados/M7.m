%[IMPORTANTE] 
%Modelo polinomial: polyfit, polyval
%O tamanho da amostra m apenas tem de
%ser maior ou igual a n + 1 sendo n o grau do polinómio (se
%m = n + 1 tem-se interpolação)

%Modelo Não polinomial: lsqcurvefit

%M7.1
x = [0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4]
f = [1 1.221 1.492 1.882 2.226 2.718 3.320 4.056]
%p3(x) = 0.4050x^3 + 0.1559x^2 + 1.1740x + 0.9909
[p3,r] = polyfit(x,f,3)
%p3(0.5) = 1.6675
val = polyval(p3,0.5)
% r.normr devolve o resíduo pelo que o valor do resíduo é elevado a 2 =>
% resíduo = 0.0027
res = r.normr^2

%M7.2
x2 = [1.2 1.75 1.1 2.0 0.5 0.8 1.0 1.5]
f2 = [16 18 16 19 10 11 14 16]
%p1(x) = 6.0011x + 7.6112
[p1,r2] = polyfit(x2,f2,1)
%residuo = 7.8887
res2 = r2.normr^2
%p(1.6) = 17.2129
val2 = polyval(p1,1.6)

%M7.3
%[!!IMPORTANTE!!]: caso o problema não diga valores iniciais para os
%coeficientes considera-se um vetor todo a 1

x3 = [-1 -0.95 -0.85 -0.8 0.2 0.5 0.9]
f3 = [-1 -0.05 0.9 1 0.9 0.5 -0.3]
%p3(x) = 3.2764x^3 -2.2107x^2 -2.9271x + 1.8138
[p33,r3] = polyfit(x3,f3,3)
%p3(0.6) = -0.0307
val3 = polyval(p33,0.6)
%residuo = 0.2996
res3 = r3.normr^2

%Parametros do modelo = -2.6842 4.0344 -0.4432
%M(x) = -2.6842 + 4.0344*cos(x) -0.4432*sin(x)
%Soma dos quadrados dos residuos = 1.5647
[c,S] = lsqcurvefit('minquad',[1 1 1],x3,f3)
% M(0.6) = 0.3953
valor1 = minquad(c,0.6)

%Parametros do modelo = 0.1236 -0.2677 0.1512
%Soma dos quadrados dos residuos = 3.0345
[c2,S] = lsqcurvefit('minquad2',[1 1 1],x3,f3)
% M(0.6) = 0.2150
valor2 = minquad2(c2,0.6)

%Parametros do modelo = -0.1552 0.1753
%Soma dos quadrados dos residuos = 3.6209
[c3,S] = lsqcurvefit('minquad3',[1 1],x3,f3)
% M(0.6) = 0.2263
valor3 = minquad3(c3,0.6)

%Como o resíduo do polinómio é o mais baixo, este é 
%o melhor no sendido dos minimos quadrados