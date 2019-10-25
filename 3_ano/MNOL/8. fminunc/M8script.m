%M8.1
x0 = [-1 0.5]
[xmin,fmin,exitflag,output] = fminunc('M1',x0)
%xmin = -1.0467   -0.0000 -> minimizante -> x1 = -1.0467 e x2 = -0.0000
%fmin = -0.3524 -> valor mínimo da função
%exitflag = 1 -> o processo convergiu para um ponto estacionário

%M8.2
x1 = [1 1]
[xmin2,fmin2,exitflag2,output2] = fminunc('M2',x1)
%xmin = 1.2905 1.3623 -> minimizante -> x1 = 1.2905 e x2 = 1.3623
%fmin =  -4.0189 -> valor mínimo da função -> O lucro máximo foi
%4.0189x10^5 euros
%exitflag = 1 -> o processo convergiu para um ponto estacionário

%M8.3
x2 = [6 7 5]
op = optimset('TolX',0.0001,'TolFun',0.0001,'HessUpdate','DFP')
[xmin3,fmin3,exitflag3,output3] = fminunc('M3',x2,op)
%xmin = 7.0007 6.9998 6.9999 -> minimizante -> x1 = 7.0007, x2 = 6.9998 e
%x3 = 6.9999
%fmin =  28.00009 -> valor mínimo da função
%exitflag = 1 -> o processo convergiu para um ponto estacionário
x4 = 2401/(xmin3(1)*xmin3(2)*xmin3(3))
%x4 = 6.9996

%M8.4
%n = 10;
n = 5;
t = pi/6;
m = 10;
i = 1:2:n;
x(i) = 2;
i = 2:2:n;
x(i) = 1;
[xmin4,fmin4,exitflag4,output4] = fminunc('M4',x,[],t,m)
%xmin =  2.0000 1.0000 2.0458 0.9735 2.0000 -> minimizante
%fmin =  -0.9591 -> valor mínimo da função
%exitflag = 2

%M8.5
n = 10
%n = 25
x = ones(1,n)
op = optimset('HessUpdate','DFP');
[xmin5,fmin5,exitflag5,output5] = fminunc('M5',x,op)