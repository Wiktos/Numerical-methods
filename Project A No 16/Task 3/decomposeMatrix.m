%Function performed decomposition needed to perform iterative algorithms of
%solving Ax=b. N is the dimension of matrix A.
function [L, D, U] = decomposeMatrix(A, N)

L = zeros(N, N);
for i = 2:N
    for j = 1:i-1
        L(i, j) = A(i, j);
    end
end

D = zeros(N, N);
for i = 1:N
    D(i, i) = A(i, i);
end

U = zeros(N, N);
for i = 1:N-1
    for j = i+1:N
        U(i, j) = A(i, j);
    end
end

end