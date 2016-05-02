function [Q, R] = qr_gsc(A, varargin)
% classical gram-schmidt QR-factorization for Dr. Blomgren's MATH543 HW#3.  
% Algorithm taken from Numerical Linear Algebra by Trefethen and Bau
% Program written by Efron Licht. No rights reserved. Go nuts.

%% INPUT: if varargin = 'full', then computes full QR factorizaiton:
% otherwise, computes reduced QR factorization.


%% input checking
assert(nargin < 3, 'at most two arguments')
FULL_DECOMPOSITION = 0;
if nargin > 1
    if strcmp(varargin{1}, 'full')
		FULL_DECOMPOSITION = 1;
	else
		warning('variable argument %s not recognized. did you mean "full?"', varargin{1})
    end
end

[m, n] = size(A);
if m<n
    error('Matrix is wider than it is tall. Try the transpose')
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
        R(i, j) = Q(:, i)' *A(:, j);
        V(:, j) = V(:, j)-( R(i,j)*Q(:, i) );
    end
    
    R(j, j) = norm(V(:, j));
    Q(:, j) = V(:, j)./R(j, j);
end

end