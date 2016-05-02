% run_and_test hessenberg

%--------------------------- presumably not_symmetric matrices: ----------

for m=1:5
    fprintf('\n random, non-symmetric matrices of size %g \n', 2^m);
    A = cell(10, 1);
    H_matlab = cell(100, 1);
    H_efron = cell(100, 1);
    H_diff = zeros(100, 1);
    for n=1:100
        A{n} = rand(2^m);
        H_matlab{n} = hess(A{n});
        H_efron{n} = householder_hessenberg(A{n});
        H_diff(n) = norm(H_efron{n}-H_matlab{n});
    end
    fprintf(['\naverage ||H_matlab-H_efron|| for 100 random' ...
            ' matrices is \n']);
    disp(mean(H_diff))
    
    fprintf(['\nmax ||H_matlab-H_efron|| for 100 random' ...
            ' matrices is \n']);
    disp(max(H_diff))
end

% ----------------symmetric matrices ---------------------
    
fprintf('symmetric')
for m=1:5
    fprintf('\nsymmetric matrices of size %g\n', 2^m);
    A_S = cell(100, 1);
    H_matlab_S = cell(100, 1);
    H_efron_S = cell(100, 1);
    H_diff_S = zeros(100, 1);
    for n=1:10
        A{n} = rand(2^m);
        A{n} = A{n}*A{n}';
        H_matlab_S{n} = hess(A{n});
        H_efron_S{n} = householder_hessenberg(A{n});
        H_diff_S(n) = norm((H_efron_S{n} - H_matlab_S{n}));
    end
    fprintf(['\naverage ||H_matlab-H_efron|| for 100 random, symmetric' ...
        ' matrices is\n']);
    disp(mean(H_diff_S))
    
    fprintf(['\nmax ||H_matlab-H_efron|| for 100 \n random, symmetric' ...
        ' matrices is\n']);
    disp(max(H_diff_S))
    if m<=3
        fprintf(['\nthis is because the MATLAB implementation further ', ...
        'reduces to tridiagonal form, but mine does not.' ])
        fprintf('\n EG:\n')
        disp(H_efron_S{n}-H_matlab_S{n});
        fprintf('\n note the differences are on the tridiagonal\n')
    end
end