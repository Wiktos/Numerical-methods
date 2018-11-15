%The function generates the solution vector b for subpoint b.
function [retv] = genSolVecB(N)

retv = 1:1:N;

for i = 1:N
    if mod(i, 2) == 1
       retv(i) = 0; 
    else
       retv(i) = 1 / i;
    end
end

retv = transpose(retv);

end