function [y] = polynomial_value(x ,a)

y = [];

[~, nx] = size(x);
[ma, ~] = size(a);

for i = 1:nx
    sum = 0;
    for j = 1:ma
        sum = sum + a(j) * x(i) ^ (j-1);
    end
    y = [y sum];
end

y = transpose(y);

end

