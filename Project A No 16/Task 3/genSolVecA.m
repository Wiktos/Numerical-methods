%The function generates the solution vector b for subpoint a.
function [retv] = genSolVecA(N)

retv = 1:1:N;

for i = 1:N
    retv(i) = 1.5 + 0.5 * i;
end

retv = transpose(retv);

end