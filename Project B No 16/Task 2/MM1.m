function [x,y] = MM1(x0, x1, x2, f, iter)
% x0,x1, x2 - starting points
% f - polynomial
% iter - number of iteration

for i = 1:iter
        %creating incremental variable
        z0 = x0 - x2;
        z1 = x1 - x2;
        
        %computing a and b of parabola
        c = f(x2);
        A = [z0^2 , z0; z1^2, z1];
        B = [f(x0) - c; f(x1) - c];
        sol = A\B;
        a = sol(1,1);
        b = sol(2,1);
        
        %picks the smallest
        if(abs(b + sqrt(b^2 - 4*a*c)) >= abs(b - sqrt(b^2 - 4*a*c)))
            zmin = (-2*c)/(b + sqrt(b^2 - 4*a*c));
        else
            zmin = (-2*c)/(b - sqrt(b^2 - 4*a*c));
        end
        
        %next approximation of root
        x3 = x2 + zmin;
        x(i) = x3;
        y(i) = f(x3);
        
        %remove the most far away point
        if(abs(x3 - x1) < abs(x3 - x0))
            temp = x1;
            x1 = x0;
            x0 = temp;
        end
        if(abs(x3 - x2) < abs(x3 - x1))
            temp = x2;
            x2 = x1;
            x1 = temp;
        end
        
        x2 = x3;

end

end


