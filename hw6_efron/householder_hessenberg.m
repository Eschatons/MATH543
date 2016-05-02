function A = householder_hessenberg(A)
%householder reduction to hessenberg form, following Trefethen & Bau pg.
%198, 'Numerical Linear Algebra'

[m, n, ~] = size(A);
assert(m == n, 'A should be a square matrix');
assert(isnumeric(A), 'A should be a square numeric matrix')

    % we need a sign function such that sgn(0) != 0. we choose sgn(0) = 1;
    function sign = sgn(A)
        if A >= 0
            sign = 1;
        else
            sign = -1;
        end
    end


v = cell(m-2, 1);
for k=1:(m-2)
    x = A( (k+1):m, k);
    v{k} = sgn(x(1)) * norm(x) *  eye(length(x), 1) + x;
    v{k} = v{k} / norm(v{k});
    A((k+1):m, k:m) = A( (k+1):m, k:m) - 2*v{k}*(v{k}'*A( (k+1):m, k:m));
    A(1:m, (k+1:m)) = A(1:m, (k+1):m) - 2*(A(1:m, (k+1):m) * v{k}) * v{k}';
end
end