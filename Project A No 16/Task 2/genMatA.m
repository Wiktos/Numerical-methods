%The function generates the matrix A for subpoint a.
function [retv] = genMatA(N)

retv = zeros(N);

for i = 1:N
    for j = 1:N
        if i == j
            retv(i, j) = 9;
        elseif i == j - 1 || i == j + 1
            retv(i, j) = 3;
        end
    end
end

end