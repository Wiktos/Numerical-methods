function [a, residuum] = approxUsingSysNormEq(x, y, n)
% approxUsingSysNormEq is a function which computes approximation
% of a function based on 
% x - xs of function
% y - values of f(x)
% n - degree of an approximate polynomial

N = size(x, 1);
A = zeros(N, n + 1);

for i = 1:N
    for j = 1:n + 1
        A(i, j) = x(i, 1) ^ (j - 1);
    end
end

a = (A' * A) \ (A' * y);
residuum = norm((A' * y) - (A' * A) * a);

end

