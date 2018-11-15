curr_n = 10;

%Generates proper input for current subpoint 
A = genMatA(curr_n); 
b = genSolVecA(curr_n);

%Solves Ax = b using the indicated method
x = solveWithIndicatedMethod(A, b, curr_n);

results = x;
residuums = vecnorm(A * x - b);

for i = 1:20
    
    r = A * x - b;
    dx = solveWithIndicatedMethod(A, r, curr_n);
    x = x - dx;
    
    results = [results x];
    if i ~= 1
        residuums = [residuums vecnorm(r)];
    end
end

plot(0:1:19, residuums, 'r-');
xlabel('Iteration'), ylabel('||r||2')
title('Function descibing the relation beetween the second norm of residuum vector and iteration'); 

grid on;
