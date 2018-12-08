function [x, y] = MM2(xn, f, fir_der, sec_der, iter)

for i = 1:iter
        square_root = sqrt((fir_der(xn))^2 - 2 * f(xn) * sec_der(xn));
       
        if(abs(fir_der(xn) + square_root) > abs(fir_der(xn) - square_root))
            z = (-2*f(xn))/ (fir_der(xn) + square_root);
        else
            z = (-2*f(xn))/ (fir_der(xn) - square_root);
        end
        
        %compute next approximation
        xn = xn + z;
        x(i) = xn;
        y(i) = f(xn);
end

end

