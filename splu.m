function [P, L, U] = splu(A)
% splu square PA = LU factorization allowing row interchange
% Afterward, using Gaussian Elimination 
% Input: n-by-n Matrix A
% Output: n-by-n Matrices: P L U
% % Test
% clc,clear,close all
% A = [0 0 -1 1;1 1 -1 2;-1 -1 2 0;1 2 0 2];
% Input check
[m,n] = size(A);
if (m ~= n)
    error("Matrix must be square!");
end
P = eye(n,n);
L = eye(n,n);
U = zeros(n,n);
Tol = sqrt(eps); % Number less than Tol is regarded as zero

for i = 1:n-1  % Using 1 to n-1 rows to eliminate
    % check for the existence of pivot
    if (abs(A(i,i)) < Tol)
            % search for the nonnegative entry as a pivot
        for k = (i+1):n
            if (abs(A(k,i)) > Tol)
                break;
            end
            
            if (k == n)
                error("No pivot exist and matrix can not be LU factorized");
            end
        end
            % Row exchange
            A([i k],:) = A([k i],:);
            
            % Permuation matrix
            P([i k], :) = P([k i], :);% do the same operation from identity mat
            
            % update Elimation matrix from second row
            if (i > 1)
                L([i k],:) = L([k i],:);
            end
    end
    
    for j = i+1:n
        L(j,i) = A(j,i)/A(i,i);  % A(i,i) is pivot
        A(j,:) = A(j,:) - L(j,i) * A(i,:);
    end
end
U =A;
