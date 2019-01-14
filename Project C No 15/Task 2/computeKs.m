function [k1, k2] = computeKs(fun1, fun2, x, y, h)

%first ks
k1(1) = fun1(x, y);
k2(1) = fun2(x, y);
%second ks
k1(2) = fun1(x + 0.5 * h * k1(1), y + 0.5 * h * k2(1));
k2(2) = fun2(x + 0.5 * h * k1(1), y + 0.5 * h * k2(1));
%third ks
k1(3) = fun1(x + 0.5 * h * k1(2), y + 0.5 * h * k2(2));
k2(3) = fun2(x + 0.5 * h * k1(2), y + 0.5 * h * k2(2));
%fourth ks
k1(4) = fun1(x + h * k1(3), y + h * k2(3));
k2(4) = fun2(x + h * k1(3), y + h * k2(3));

end

