%Task's data
% A = [6 2 1 -1;
%      4 -10 2 -1;
%      2 -1 8 -1;
%      5 -2 1 -8];
% b = [6; 8; 0; 2];
A = genMatA(10);
b = genSolVecA(10);
N = 10;

[L, D, U] = decomposeMatrix(A, N);

%Checking the convergence condition
if ~(checkColDominance(A, N) || checkRowDominance(A, N))
    spec_rad = max(abs(eig(-inv(D)*(L+U))));;
    if spec_rad >= 1
        return;
    end 
end

%Initial guess
x = zeros(N, 1);

invD = inv(D);

iter_cnt = 1;
sol_err = vecnorm(A*x - b);

while sol_err(iter_cnt) > 10^-10
    x = -invD * (L+U) * x + invD * b;
    
    iter_cnt = iter_cnt + 1; 
    if iter_cnt ~= 1
        sol_err = [sol_err, vecnorm(A*x - b)];
    end
end

plot(0:iter_cnt-1, sol_err, 'g-');
xlabel('Iteration'); ylabel('The solution error ||Ax-b||');
title('Second norm of the solution error versus iteration number');
grid on;
