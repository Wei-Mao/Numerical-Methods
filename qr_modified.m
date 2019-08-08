%function [Q,R] = qr_modified(A)
% Orthogonalize the A using Gram-Schmidit process
% Input: A: m by n matrix of independent columns
% Output: Q: m by n matrix of orthonormal columns
% and R: upper triangular square n-n matrix with R(i,j) = qi aj
% A = QR 
% Test Case
A = [1 2 3; -1 0 -3;];
% Check whether the A has independent columns
[m,n] = size(A);
if ((rank(A)< m) && (rank(A)< n))
    error('Columns of A must be indpependent!');
end

Q = zeros(size(A));
R = zeros(n);
% Gram-Schmidt
Q(:,1) = A(:,1)/ norm(A(:,1));
R(1,1) = Q(:,1)' * A(:,1);
for i = 2:n
    v = A(:,i);
    for j = 1: (i-1)
        R(j,i) = Q(:,j)' * A(:,i);
        v = v - R(j,i) * Q(:,j);
    end
    R(i,i) = norm(v);   % Hence, R is invertible!!!!
    Q(:,i) = v / R(i,i);
end

%
