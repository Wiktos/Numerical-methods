function [x1, x2, errX1, errX2] = RK4(fun1, fun2, h, initX1, initX2)

x1(1) = initX1;
x2(1) = initX2;

for i = 1:1:(20 / h)
    
    [k1, k2] = computeKs(fun1, fun2, x1(i), x2(i), h);
    
    x1(i + 1) = x1(i) + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6; 
    x2(i + 1) = x2(i) + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
   
    errX1(i) = (16 / 15) * abs(x1(i + 1) - x1(i));
    errX2(i) = (16 / 15) * abs(x2(i + 1) - x2(i));
    
end
