% experiment 1: SCRIPT: Discrete Legendre Polynomials
function approx_legendre(varargin)
if nargin == 1
   v = varargin{1};
   assert(uint16(v) - v == 0, 'v should be an integer between 0 and 65535')
else
    v = 2^8;
end


l = @(n, x) legendreP(n, x);
x = (-v:v)'/v;    %we could use linspace(-1, 1, 2^8+1)'
clf
A = [x.^0 x.^1 x.^2 x.^3];
[Q, R] = qr(A, 0);
L = [l(0, x), l(1, x), l(2, x), l(3,x)];

scaleQ = Q(end, :);
scaleL = L(end, :);
Q = Q*diag(1 ./scaleQ);
L = L*diag(1./scaleL);

subplot(2, 1, 1)
plot(x, Q)
hold on
plot(x, L, '--')
legend('Q_0', 'Q_1', 'Q_2', 'Q_3', 'L_0', 'L_1', 'L_2', 'L_3');
title('Approximate "Q" vs exact "L" legendre polynomials');
grid on

subplot(2, 1, 2)
plot(x, D)
title('Difference in polynomials')
legend('Q_0-L_0', 'Q_1-L_1', 'Q_2-L_2', 'Q_3-L_3')
grid on
end