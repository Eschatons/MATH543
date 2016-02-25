function experiment_9_2(varargin)
% construct a square matrix A with random singualr vectors and widely
% varying singular values spaced by factors of 2 between 2^-1 and 2^-N
%experiment 9-2

%% N defaults to 2
if nargin == 1
    N = varargin{1};
    assert(N > 0, 'N should be a positive integer')
    assert(N - uint8(N) == 0, 'N should be an integer 0<N<255')
else
    N = 80;
end

[U, X] = qr(randn(N));
[V, X] = qr(randn(N));
S = diag(2.^(-1:-1:-N));
A = U*S*V;
[QC, RC] = qr_gsc(A);
[QM, RM] = qr_gsm(A);

% plot log base 2 of diagonal elements
log_RM = log2(diag(RM));
log_RC = log2(diag(RC));

clf
figure('name', 'Classical vs Modified Gram-Schmidt')
title('Stability of Classical vs. Modified Gram-Schmidt')
plot(log_RM, 'b')

hold on
plot(log_RC, 'r')

machine_epsilon = zeros(N, 1) + 2^-53; 
plot(log2(sqrt(machine_epsilon)), '--r')
plot(log2(machine_epsilon), '--b')
legend('Modified Gram-Schmidt', 'Classical Gram-Schmidt', '\epsilon_{machine}^{(1/2)} ~ 2^', '\epsilon_{machine}');

ylabel('Log_2(r_{jj})')
title('Stability of Classical vs. Modified Gram-Schmidt')
end