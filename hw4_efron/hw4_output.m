% experiment 1: SCRIPT: Discrete Legendre Polynomials

j = [4:2:14];
u = 2.^j;
clf
for m=1:numel(j)
    v = u(m);
    x = (-v:v)'./v;    %we could use linspace(-1, 1, 2^8+1)'
    A = [x.^0 x.^1 x.^2 x.^3];
    [Q, R] = qr(A, 0);
    scale = Q(end, :);
    Q = Q*diag(1 ./scale);
    B = [legendreP(0, x), legendreP(1, x), legendreP(2, x), legendreP(3, x)];
    

    GRIDSTR = sprintf('Approximate minus Real: %g-point grid', v);
    subplot(ceil(numel(j)/2), 2, m)
    plot(ln(Q-B))
    title(GRIDSTR)
    legend('ln(L_0-P_0)', 'ln(L_1-P_1)', 'ln(L_2-P_2)', 'ln(L_3-P_3)')
    axis([0, v, -1, 1])
end
%{
% plot approximate legendre polynomials
GRIDSTR = sprintf('Approximate Legendre Polynomial: %g-point grid', v);
figure('Name', 'Plot for exercise 9.1(b)')
subplot(3, 1, 1)
plot(Q)
axis([0, v, -1, 1])
title(GRIDSTR)
legend('P_0', 'P_1', 'P_2', 'P_3')

b0 = legendreP(0, x);
b1 = legendreP(1, x);
b2 = legendreP(2, x);
b3 = legendreP(3, x);
B = [b0, b1, b2, b3];
subplot(3, 1, 2)
plot(B, '--')
axis([0, v, -1, 1])
title('Actual Legendre Polynomials')
legend('L_0', 'L_1', 'L_2', 'L_3')

C = A-B;
subplot(3, 1, 3)
plot(C)
title('Differ')
axis([0, v, -1, 1])
legend('P_0-L_0', 'P_1-L_1', 'P_2-L_2', 'P_3-L_3')
%}