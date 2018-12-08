function [x, y] = bisection(a, b, f, accuracy)
%bisection function finds the all roots of a given funcion within the range
%a and b

x = [];
y = [];

if(f(a) * f(b) > 0)
    error('There is no root of function f between a and b');
end

c = a;
cnt = 1;
while abs(f(c)) > accuracy
   if abs(b - a) < 10^-15
       return;
   end

   c = (a + b) / 2;
   if f(a) * f(c) < 0
       b = c;
   else
       a = c;
   end
   
   x(cnt) = c;
   y(cnt) = f(c);
   cnt = cnt + 1;
end

end

