% Sistema de equações não lineares
function f = f3(x)
f = [sin((x(1)+x(2))/2) - 2*x(1); cos((x(1)-x(2))/2) - 2*x(2)]