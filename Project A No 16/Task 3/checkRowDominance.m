%Function checks if matrix A is strongly row dominant. 
%N is the size of A
function [retv] = checkRowDominance(A, N)

    for i = 1:N
        sum = 0.0;
        for j = 1:N
            if i == j
                continue;
            end
            
            sum = sum + abs(A(i, j));    
        end
        
        if abs(A(i, i)) <= sum
            retv = false;
            return;
        end
    end    
    retv = true;
end

