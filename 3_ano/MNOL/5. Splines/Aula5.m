%M5.1
x1 = 5:0.1:6;
f1=[0.0639 0.08 0.0988 0.1203 0.1442 0.1714 0.2010 0.2331 0.2673 0.3036 0.3414]

%spline cúbica sem considerar as derivadas nos extremos
s=spline(x1,f1)
vs = spline(x1,f1,5.45)
% 5.45 está entre 5.4 e 5.5 por isso o ponto inicial é 5.4 -> procurar em
% s.coefs os valores da linha correspondente, neste caso a linha 5
%R: s3^5(x) = -0.3521(x-5.4)^3 + 0.2004(x-5.4)^2 + 0.2555(x-5.4) + 0.1442
%R: s3^5(5.45) = 0.1574

%spline cubica completa
d0=(0.0636-0.08)/(5-5.1); dn = (0.3036-0.3414)/(5.9-6);
%É preciso retirar segundo e penultimo pontos
x2 = [5 5.2:0.1:5.8 6]
f2 =[0.0639 0.0988 0.1203 0.1442 0.1714 0.2010 0.2331 0.2673 0.3414]
s2=spline(x2,[d0 f2 dn])
vs2=spline(x2,[d0 f2 dn],5.45)
% 5.45 está entre 5.4 e 5.5 por isso o ponto inicial é 5.4 -> procurar em
% s.coefs os valores da linha correspondente, neste caso a linha 4 porque
% foram retirados o segundo e penultimo pontos
%R: s3^4(x) = -0.3685(x-5.4)^3 + 0.2041(x-5.4)^2 + 0.2553(x-5.4) + 0.1442
%R: s3^4(5.45) = 0.1574

%M5.2
%Derivada de ln(x) é 1/x logo d0 e dn são as derivados no primeiro e último
%pontos
d0=1/1; dn=1/3.5;
x3 = [1 1.5 2 3 3.5];
f3 = [0 0.4055 0.6931 1.0986 1.2528]
s3=spline(x3,[d0 f3 dn])
vs3=spline(x3,[d0 f3 dn],2.5)
%Sabemos que 2.5 está entre 2 e 3, logo o ponto inicial é o 2 -> escolher a
%terceira linha da matriz dos coeficientes
%R: s3^3(x) = 0.0225(x-2)^3 -0.1181(x-2)^2 + 0.5011(x-2) + 0.6931
%R: s3^3(2.5) = 0.9169

%M3
%spline cubica sem usar derivadas nos extremos
x4 = [0 0.1 0.2 0.3 0.4 0.5 0.6 3.6 6.6 9.6 9.8 10]
f4 = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.6 0.6 0.6 0.7 0.8]
s4 = spline(x4,f4)
vs3 = spline(x4,f4,5)
%Sabemos que 5 está entre 3.6 e 6.6, logo o ponto inicial é o 3.6 -> escolher a
%linha 8 da matriz dos coeficientes
%R: s3^8(x) = -0.0317(x-3.6)^3 + 0.1710(x-3.6)^2 -0.2271(x-3.6) + 0.6000
%R: s3^8(5) = 0.5300

%spline cubica
%Retirar os pontos
x5 = [0 0.2 0.3 0.4 0.5 0.6 3.6 6.6 9.6 10]
f5 = [0 0.2 0.3 0.4 0.5 0.6 0.6 0.6 0.6 0.8]
d00 = (0-0.1)/(0-0.5)
dnn = (0.7-0.8)/(9.8-10)
s5=spline(x5,[d00 f5 dnn])
vs5=spline(x5,[d00 f5 dnn],5)
%Sabemos que 5 está entre 3.6 e 6.6, logo o ponto inicial é o 3.6 -> escolher a
%linha 7 da matriz dos coeficientes -> foram retirados o segunto e
%penultimo pontos
%R: s3^7(x) = -0.0314(x-3.6)^3 + 0.1704(x-3)^2 -0.2287(x-3) + 0.6000
%R: s3^7(5) = 0.5277