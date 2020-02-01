function M = M3(x)
M = x(1) + x(2) + x(3) + 2401/(x(1)*x(2)*x(3));

%A = x1*x2*x3*x4 => x4 = A/(x1*x2*x3)
%min z = x1 + x2 + x3 + x4 = x1 + x2 + x3 + A/(x1*x2*x3)