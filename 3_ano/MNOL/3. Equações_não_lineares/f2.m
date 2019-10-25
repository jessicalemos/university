%Com derivadas -> fornecer primeira derivada
function[f,d]=f2(x)
f=cos(x)-cos(3.1*x)
if nargout>1
    d=-sin(x)+3.1*cos(3.1*x)
end