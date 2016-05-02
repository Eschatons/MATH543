%MATH543 Homework # 6: 
% Trefethen and Bau Problem 24.3

for m=1:10
    
    A = normrnd(0, 1, 10, 10) - 2*eye(10);
    t = 0:20;

    for n=1:21
        f1(n) = norm(exp(t(n)*A));
    end
    [~, val] = eigs(A);
    val = diag(val);
    spectral_abcessa = max(real(val));
    f2 = exp(t*spectral_abcessa);

maxy = max(max(log(f1)), max(abs(log(f2))));

subplot(1, 3, 1);
plot(t, log(f1));
title('||e^{t*A}||_2')
axis([0, 21, -maxy, maxy])

subplot(1, 3, 2);   
plot(t, log(f2));
axis([0, 21, -maxy, maxy])
title('e^{t*\alpha(A)}')

subplot(1, 3, 3);
plot(t, abs( abs(log(f1)) - abs(log(f2))))
title('||e^{t*A}||_2 -  |e^{t*\alpha(A)}|')
axis([0, 21, -maxy, maxy])

filename = sprintf('hw6_%03.g.png', m);
print(filename, '-dpng');
end