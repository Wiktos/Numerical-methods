function [x, y] = newton(xn, f, diffF, accuracy)
% newton is a function that computes root of a given function f
% xn - starting point
% f - function f(x)
% diffF - first derivative of funtion f
% accuracy - wanted accuracy of the solution

cnt = 1;

while abs(f(xn)) > accuracy
        xn = xn - f(xn)/ diffF(xn);
        
        x(cnt) = xn;
        y(cnt) = f(xn);
        cnt = cnt + 1;
end


end

