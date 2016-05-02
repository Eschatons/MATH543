%script that tests the output of homework #3: 
wd = pwd;
filename = strcat(wd, '\hw3_out.txt');
strrep(filename, '\', '/');
diary(filename)

rank_deficient = reshape(1:30, [], 5);
ill_conditioned = [[2 4 8 16 32 64]; ...
    [2 5 8 16 32 64.001]; ...
    [2 4 8.001 16 32 64.002]; ...
    [2 4 2^30 1 2 3]; ...
    [2 8 12 1 1 19]; ...
    [1 1 1 1 1 1]; ...
    ];
ill_conditioned_2 = [1 1; 1+(10^-10), 1-(10^-10)];

fprintf('this is a rank-deficient matrix: \n')
disp(rank_deficient)
[Q00, R00] = qr_gsc(rank_deficient);
[Q01, R01] = qr(rank_deficient);
fprintf('it should have a QR decomposition that looks like this: \n')
fprintf('Q = \n')
disp(Q01)
fprintf('\nR = \n')
disp(R01)
fprintf('\nbut it looks like this: \n')
fprintf('Q = \n')
disp(Q00);
fprintf('R = \n')
disp(R00);
fprintf('\n Q if off by: \n')
offset = abs(abs(Q00)-abs(Q01));
disp(offset.*(offset>(10^-8)))

fprintf('this is an ill-conditioned matrix: \n')
disp(ill_conditioned)
[Q00, R00] = qr_gsc(ill_conditioned);
[Q01, R01] = qr(ill_conditioned);
[~, S, ~] = svd(ill_conditioned);

fprintf('examine the singular values: \n')
disp(nonzeros(S))
fprintf('\nit should have a QR decomposition that looks like this: \n')
fprintf('Q = \n')
disp(Q01)
fprintf('\nR = \n')
disp(R01)
fprintf('\nbut it looks like this: \n')
fprintf('Q = \n')
disp(Q00);
fprintf('R = \n')
disp(R00);
fprintf('\n Q is off by: \n')
offset = abs(abs(Q00)-abs(Q01));
disp(offset.*(offset>(10^-8)))




fprintf('this is another ill-conditioned matrix: \n')
disp(ill_conditioned_2)
[Q00, R00] = qr_gsc(ill_conditioned_2);
[Q01, R01] = qr(ill_conditioned_2);
[U, S, V] = svd(ill_conditioned_2);

fprintf('examine the singular values: \n')
disp(nonzeros(S))
fprintf('\nit should have a QR decomposition that looks like this: \n')
fprintf('Q = \n')
disp(Q01)
fprintf('\nR = \n')
disp(R01)
fprintf('\nbut it looks like this: \n')
fprintf('Q = \n')
disp(Q00);
fprintf('R = \n')
disp(R00);
fprintf('\n Q is off by: \n')
offset = abs(abs(Q00)-abs(Q01));
disp(offset.*(offset>(10^-8)))
diary off
 