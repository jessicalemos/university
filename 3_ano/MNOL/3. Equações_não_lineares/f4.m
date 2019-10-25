%d é a jacobiana da função
function[f,d]=f4(x)
f=[x(1);(x(2)^2)+x(2); exp(x(3))-1];
if nargout>1
    d=[1 0 0;0 2*x(2)+1 0;0 0 exp(x(3))]
end