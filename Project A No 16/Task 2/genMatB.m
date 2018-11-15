%The function generates the matrix A for subpoint b.
function [retv] = genMatB(N)

retv = zeros(N);

for i = 1:N
    for j = 1:N
        retv(i, j) = 2 / (3 * (i + j - 1));
    end
end

end