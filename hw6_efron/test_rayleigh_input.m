%% test rayleigh_quotient_iteration

%% turn off nearlySingularMatrix warning for sanity's sake:
warning_id = 'MATLAB:nearlySingularMatrix';
warning('off', warning_id);
max_val_diff = zeros(8, 1);
avg_val_diff = zeros(8, 1);

%% create 500 different random matrices of size 2^m for m=1:7
for m=1:7
    
    j = 2^m;
    % pre-allocation
    
    ray_vec = zeros(500, j);
    ray_val = zeros(500, 1);
    true_vec = zeros(500, j);
    true_val = zeros(500, 1);
    
    for n=1:500
        A = rand(j);
        A = (A+A')/2;	% make symmetric
        
        [ray_vec(n, :), ray_val(n, :)] = rayleigh_quotient_iteration(A);
        
        [true_vec(n, :), true_val(n, :)] = eigs(A, 1);
    end
    max_val_diff(m) = max(abs(ray_val-true_val));
    avg_val_diff(m) = mean(abs(ray_val-true_val));
end

%% output
    output = fopen('test_rayleigh_output.rtf', 'w+');
for m=1:8
    j = 2^m;
    fprintf(output, 'for 500 random symmetric matrices of size %g\n', j);
    fprintf(output, 'avg(true_eig-rayleigh_eig|) = %f\n', avg_val_diff(m));
    fprintf(output, 'max(true_eig-rayleigh_eig|) = %f\n', max_val_diff(m));
end
    fclose('all')

%% restore warnings
warning('on', 'all');