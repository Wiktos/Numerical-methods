%Function solves Ax = b. N is the size of matrix A.
function [x] = solveWithIndicatedMethod(A, b, N)

%Append solution to matrix A
A = [A b];

for i = 1:N-1
    %Find the row with maximal abs value at current central element
    curr_max = A(i, i);
    row = i;
    for j = i+1:N
        if curr_max < abs(A(j, i))
            row = j;
            curr_max = abs(A(j, i));
        end
    end
    
    %Swap rows if needed
    if row ~= i
        temp = A(i,:);
        A(i,:) = A(row,:);
        A(row,:) = temp;
    end
    
    %The Elimination phase of Gaussian algorithm
    for j = i+1:N
        curr_l = A(j, i) / A(i, i);
        
        for k = i:N+1
            A(j, k) = A(j, k) - curr_l * A(i, k);
        end
    end
    
end

%The back-substitution phase
x = zeros(N, 1);  %vector of solutions 

for i = N:-1:1
    row_sum = 0;
    for j = 1:N
        row_sum = row_sum + A(i, j) * x(j);
    end
    x(i) = (A(i, N+1) - row_sum) / A(i, i);
end

end