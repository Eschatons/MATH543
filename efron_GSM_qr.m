function [Q, R] = efron_GSM_qr(A, varargin)
% classical gram-schmidt QR-factorization for Dr. Blomgren's MATH543 HW#3.  
% Algorithm taken from Numerical Linear Algebra by Trefethen and Bau
% Program written by Efron Licht. No rights reserved. Go nuts.

%% INPUT: if varargin = 'full', then computes full QR factorizaiton:
% otherwise, computes reduced QR factorization.

assert(nargin < 3, 'at most three arguments')
if nargin == 2
    assert(strcmp(varargin{1}, 'full'), ['second argument: \n "%s" \n not recognized. ' ...
        'did you mean "full?"'], num2str(varargin{1}))
    FULL_DECOMPOSITION = 1;
else
    FULL_DECOMPOSITION = 0;
end


[m, n] = size(A);
if m<n
    error('Matrix is wider than it is tall. Try input of the transpose')
end

try assert(rank(A) >= n, '')
catch
    warning('Input is rank deficient! This output is not to be trusted.');
end

if FULL_DECOMPOSITION
    V = zeros(m, n);
    Q = zeros(m, n);
    R = zeros(n);
else
    V = zeros(m, n);
    Q = zeros(m);
    R = zeros(m, n);
end

%% QR DECOMPOSITION
for j=1:n
    V(:, j) = A(:, j);
    for i=1:(j-1)
        R(i, j) = Q(:, i)'*A(:, j);
        V(:, j) = V(:, j)-(R(i,j)*Q(:, i));
    end
    R(j, j) = norm(V(:, j));
    Q(:, j) = V(:, j)./R(j, j);
end

end