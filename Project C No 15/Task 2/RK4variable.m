function [x1values, x2values, errors, steps] = RK4variable(fun1, fun2, x1, x2, h, epsr, epsa)
% x1 - first value of x1
% x2 - first value of x2
% h - step
% epsr - relative epsilon
% epsa - absolute epsilon
i = 1;
a = 0;

x1values(1) = x1;
x2values(1) = x2;
steps(i) = h;

while (a < 20)
    %next points
    [k1, k2] = computeKs(fun1, fun2, x1, x2, h);
    
    tempx1 = x1;
    tempx2 = x2;
    
    x1 = x1 + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6;
    x2 = x2 + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
    
    x1values(i + 1) = x1;
    x2values(i + 1) = x2;
    
    %first half-step
    h = 0.5 * h;
    
    [k1, k2] = computeKs(fun1, fun2, x1, x2, h);
     
    tmp1 = x1 + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6;
    tmp2 = x2 + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
    
    %second half-step
    [k1, k2] = computeKs(fun1, fun2, tmp1, tmp2, h);
    
    tmp1 = tmp1 + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6;
    tmp2 = tmp2 + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
    
    h = 2 * h;
    
    errors(i, 1) = (tmp1 - x1) / 15;
    errors(i, 2) = (tmp2 - x2) / 15;
    
    eps1 = abs(tmp1) * epsr + epsa;
    eps2 = abs(tmp2) * epsr + epsa;
    
    alpha1 = (eps1 / abs(errors(i, 1)))^(1/5);
    alpha2 = (eps2 / abs(errors(i, 2)))^(1/5);
    
    alpha = min(alpha1, alpha2);
    
    hnew = 0.9 * alpha * h;
    
    if (0.9 * alpha >= 1)
        if (a + h >= 20)
            break;
        else
            a = a + h;
            h = min([hnew, 5 * h, 20 - a]);
            i = i + 1;
            steps(i) = h;
            continue;
        end
    else
        if (hnew < 0)
            error('Cant solve with this epsilon');
        else
            h = hnew;
        end
    end
   
    i = i + 1;
    steps(i) = h;
end