function [x1values, x2values, errors] = RK4variable(fun1, fun2, x1, x2, h, epsr, epsa)
% x1 - first value of x1
% x2 - first value of x2
% h - step
% epsr - relative epsilon
% epsa - absolute epsilon
i = 0;
a = 0;

while (a < 20)
    x1values(i + 1) = x1;
    x2values(i + 1) = x2;
    
    %next points
    [k1, k2] = computeKs(fun1, fun2, x1, x2, h);
    
    tempx1 = x1;
    tempx2 = x2;
    
    x1 = x1 + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6;
    x2 = x2 + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
    
    newx1 = x1;
    newx2 = x2;
    
    %first half-step
    h = 0.5 * h;
    x1 = tempx1;
    x2 = tempx2;
    
    [k1, k2] = computeKs(fun1, fun2, x1, x2, h);
     
    x1 = x1 + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6;
    x2 = x2 + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
    
    %second half-step
    tempx12 = x1 + h * (k1(1) + 2 * k1(2) + 2 * k1(3) + k1(4)) / 6;
    tempx22 = x2 + h * (k2(1) + 2 * k2(2) + 2 * k2(3) + k2(4)) / 6;
    
    errors(i + 1, 1) = (tempx12 - x1) / 15;
    errors(i + 1, 2) = (tempx22 - x2) / 15;
    
    x1 = newx1;
    x2 = newx2;
    
    h = 2 * h;
    
    eps(1) = abs(x1) * epsr + epsa;
    eps(2) = abs(x2) * epsr + epsa;
    
    alpha1 = (eps(1) / abs(errors(i+1, 1)*(h^5)))^(1/5);
    alpha2 = (eps(2) / abs(errors(i+1, 2)*(h^5)))^(1/5);
    
    alpha = min(alpha1, alpha2);
    
    hnew = 0.9 * alpha * h;
    
    if (0.9 * alpha >= 1)
        if (a + hnew >= 20)
            break;
        else
            a = a + h;
            h = min([hnew, 5*h, 20-a]);
            i = i+1;
        end
    else
        if (hnew < h)
            h = hnew;
        else
            error('Cant solve with this epsilon');
        end
    end
end