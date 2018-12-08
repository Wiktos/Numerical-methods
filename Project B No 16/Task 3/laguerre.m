function [x, y] = laguerre(xn, f, n, fir_der, sec_der, iter)

    for i = 1:iter
        square_root = sqrt((n - 1)*((n - 1) * fir_der(xn)^2 - n * f(xn) * sec_der(xn)));
        
        if(abs(fir_der(xn) + square_root) > abs(fir_der(xn) - square_root))
            x(i) = xn - (n * f(xn)) / (fir_der(xn) + square_root);
        else
            x(i) = xn - (n * f(xn)) / (fir_der(xn) - square_root);
        end
        
        xn = x(i);
        y(i) = f(xn);
    end

end

