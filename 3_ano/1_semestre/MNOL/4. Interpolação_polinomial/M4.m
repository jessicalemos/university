%M1.1
x = [5 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6]
f = [0.0639 0.08 0.0988 0.1203 0.1442 0.1714 0.2010 0.2330 0.2673 0.3036 0.3414]

%grau 2 -> 3 pontos
p2 = polyfit(x(4:6),f(4:6),2)
estimativa = polyval(p2,5.44)
%R: Polinómio -> 0.1650x^2 -1.5265x + 3.5759
%R: f(5.44) = p2(5.44) = 0.1547

%grau 5 -> 6 pontos
p5 = polyfit(x(3:8),f(3:8),5)
estimativa2 = polyval(p5,5.44)
%R: f(5.44) = p10(5.44) = 0.1547
%R: Polinómio ->

%grau 10 -> 9 pontos
p10 = polyfit(x(1:11),f(1:11),10)
estimativa3 = polyval(p10,5.44)
%R: Polinómio ->
%R: f(5.44) = p10(5.44) = 0.1547

%M2
x2 = [0 0.3 0.5 0.7 0.9 1.0 1.2 1.5 1.6 1.75 2.0 2.1]
f2 = [0 0.2955 0.4794 0.6442 0.7833 0.8415 0.9320 0.9975 0.9996 0.9849 0.9093 0.8632]

%Quatro pontos -> grau 3
p3 = polyfit(x2(7:10),f2(7:10),3)
est1 = polyval(p3,1.57)
%R: Polinómio -> 0.0315*x^3 -0.6288*x^2 + 1.7432*x -0.3088
%R: f(1.57) = p3(1.57) = 1.0000

%Seis pontos -> grau 5
p5 = polyfit(x2(6:11),f2(6:11),5)
est2 = polyval(p5,1.57)
%R: Polinómio -> -0.2245*x^5 + 1.6801*x^4 -4.9797*x^3 + 6.8160*x^2 -3.7647*x + 1.3143
%R: f(1.57) = p5(1.57) = 1.0000

%Doze pontos -> grau 11
p11 = polyfit(x2(2:12),f2(2:12),11)
est3 = polyval(p11,1.57)
%R: Polinómio -> 0.2178x^11 -2.4316x^10 + 11.5575x^9 -30.0869x^8 +
% + 45.0994x^7 -34.4016x^6 + 26.2774x^4 -25.7407x^3 + 11.8775x^2 -1.7898x + 0.2626
%R: f(1.57) = p11(1.57) = 1.0000

%Grafico dos pontos
%plot(x2,f2,'o')

%Grafico do polinómio de grau 11
%plot(p11,'o')

%xa = linspace(0,15)
%eq = 0.0027*x.^3
%plot(x,eq)

%M3
t=[0 5 10 15 20 30]
v=[0 106.8 227.04 362.78 517.35 901.67]

%Grau 3 -> 4 pontos
pt = polyfit(v(2:4),t(2:4),3)
estv = polyval(pt,8)
%R: Polinómio -> 0.0496x
%R: velocidade estimada: v(8) = p3(8) = 0.3949

%Grafico dos pontos do polinomio
%plot(pt,'o')

%M5
ti=[0 1 4 7 8 10 14] 
h=[2.1 2.0 1.8 1.5 1.4 1.1 0]

%Grau 2 -> 3 pontos
pr = polyfit(ti(3:5),h(3:5),2)
estv = polyval(pr,5)
%R: Polinómio -> -0.1x + 2.2
%R: velocidade estimada: v(5) = p2(5) = 1.7

%Grau 5 -> 6 pontos
pr2 = polyfit(ti(1:6),h(1:6),5)
estv2 = polyval(pr2,5)
%R: Polinómio -> -0.0001x^5 + 0.0018x^4 -0.0162x^3 + 0.0571x^2 -0.1427x + 2.1000
%R: velocidade estimada: v(5) = p5(5) = 1.7042

%Grau 6 -> 7 pontos
pr3 = polyfit(ti(1:7),h(1:7),6)
estv3 = polyval(pr3,5)
%R: Polinómio -> -0.0003x^5 + 0.0047x^4 + 0.0309x^3 + 0.0886x^2 -0.1621x + 2.1000
%R: velocidade estimada: v(5) = p5(5) = 1.6990