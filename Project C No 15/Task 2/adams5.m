function [x1, x2, errX1, errX2] = adams5(fun1, fun2, h, initX1, initX2)

err_fac = (863/60480) / ((-95/288) + (863 / 60480));

x1(1) = initX1;
x2(1) = initX2;

betaE = [1901, -2774, 2616, -1274, 251];
betaE = betaE / 720;

betaI = [475, 1427, -798, 482, -173, 27];
betaI = betaI / 1440;

for i = 1:4
    [k1, k2] = computeKs(fun1, fun2, x1(i), x2(i), h);
    x1(i + 1) = x1(i) + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6; 
    x2(i + 1) = x2(i) + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
end

for i = 6:ceil(20 / h)
    sumX1 = 0;
    sumX2 = 0;
    for j = 1:5
        sumX1 = sumX1 + betaE(j) * fun1(x1(i - j), x2(i - j));
        sumX2 = sumX2 + betaE(j) * fun2(x1(i - j), x2(i - j));
    end
    
    tempX1 = x1(i - 1) + h * sumX1;
    tempX2 = x2(i - 1) + h * sumX2;
    
    sumX1 = 0;
    sumX2 = 0;
    for j = 1:5
        sumX1 = sumX1 + betaI(j + 1) * fun1(x1(i - j), x2(i - j));
        sumX2 = sumX2 + betaI(j + 1) * fun2(x1(i - j), x2(i - j));
    end
    
    x1(i) = x1(i - 1) + h * sumX1 + h * betaI(1) * fun1(tempX1, tempX2);
    x2(i) = x2(i - 1) + h * sumX2 + h * betaI(1) * fun2(tempX1, tempX2);
    
    errX1 = err_fac * (tempX1 - x1(i));
    errX2 = err_fac * (tempX2 - x2(i));
end

end