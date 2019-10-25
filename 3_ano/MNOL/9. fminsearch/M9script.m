%M9.1
x0 = [1 1]
op = optimset('Display','iter'); %-> fazer o display por itera��o
[xmin,fmin,exitflag,output] = fminsearch('M1',x0)
%xmin -> minimizante: 3.3719e-05 0.99998 -> x1 = 3.3719e-05 e x2 = 0.99998
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 3.37199e-05
%n� de itera��es: 42 e n� de calculos: 80

%M9.2
x1 = [1 -0.1]
[xmin2,fmin2,exitflag2,output2] = fminsearch('M2',x1)
%xmin -> minimizante: 1.1391 0.8995 -> x1 = 1.1391 e x2 = 0.8995
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 1.9522
%n� de itera��es: 65 e n� de calculos: 124

x2 = [2 2]
[xmin3,fmin3,exitflag3,output3] = fminsearch('M2',x2)
%xmin -> minimizante: 1.1391 0.8995 -> x1 = 1.1391 e x2 = 0.8995
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 1.9522
%n� de itera��es: 54 e n� de calculos: 103

x3 = [-10 -10]
[xmin4,fmin4,exitflag4,output4] = fminsearch('M2',x3)
%xmin -> minimizante: 1.1391 0.8995 -> x1 = 1.1391 e x2 = 0.8995
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 1.9522
%n� de itera��es: 67 e n� de calculos: 126

%O processo convergiu com menos c�lculos d fun��o com a aproxima��o inicial
%(2,2)

%M9.3
n = 2;
i = 1:n
x = i-(n/2+0.5)
[xmin5,fmin5,exitflag5,output5] = fminsearch('M3',x)
%xmin -> minimizante: -0.7164 -0.7164 -> x1 = -0.7164 e x2 = -0.7164
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 6.4288e-12
%n� de itera��es: 66 e n� de calculos: 119

n = 2;
i = 1:n
x = i-(n/2+0.5)
op = optimset('TolX',1e-20);
op2 = optimset('TolX',1e-20,'MaxFunEvals',10000);
op3 = optimset('TolX',1e-20,'MaxFunEvals',10000,'MaxIter',10000);
[xmin6,fmin6,exitflag6,output6] = fminsearch('M3',x,op3)
%op, op2 e op3 -> 125 itera��es e 298 calculos

%9.4
n = 2
i = 1:n
x7 = i-(n/2+0.5)
[xmin7,fmin7,exitflag7,output7] = fminsearch('M4',x7)
%xmin -> minimizante: 0.5 0.5 -> x1 = 0.5 e x2 = 0.5
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: -0.25
%n� de itera��es: 74 e n� de calculos: 140

n = 5
i = 1:n
x7 = i-(n/2+0.5)
op = optimset('MaxFunEvals',5000)
[xmin8,fmin8,exitflag8,output8] = fminsearch('M4',x7,op)
%xmin -> minimizante: 33.48137 0.04065 0.04065 3.84171 0.04065
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: -0.032
%n� de itera��es: 687 e n� de calculos: 1137

%M9.5
%w = 500
w = 1500
x9 = [-1 5]
[xmin9,fmin9,exitflag9,output9] = fminsearch('M5',x9,[],w)
%w = 500
%xmin -> minimizante: 1.20 2.39998
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 7.2
%n� de itera��es: 101 e n� de calculos: 188

%w = 1000
%xmin -> minimizante: 1.20 2.400
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 7.2
%n� de itera��es: 101 e n� de calculos: 190

%w = 1500
%xmin -> minimizante: 1.20 2.400
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 7.2
%n� de itera��es: 102 e n� de calculos: 192

%Logo a mais eficiente � w = 500, menos itera��es e calculos

%M9.6
[xmin11,fmin11,exitflag11,output11] = fminsearch('M6',ones(1,4))
%w = 1500
%xmin -> minimizante: -0.02817 -0.2714 1.2716 1.9633
%exitflag: 1 processo convergiu para um ponto estacion�rio
%fmin -> valor minimo da fun��o: 0.0187
%n� de itera��es: 106 e n� de calculos: 196

[xmin10,fmin10,exitflag10,output10] = fminsearch('M62',ones(1,4))