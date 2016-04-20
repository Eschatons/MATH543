%problem 12_3_b

for jj=1:10c
    m = 2.^jj;
    A = randn(m, m, 100)/sqrt(m);
    A_norms = zeros(100, 1);
    for n=1:100
        A_norms(n) = norm(A(:, :, n));
    end
    x_component = zeros(100, 1) + jj;
    scatter(x_component, A_norms);
    hold on
end
title('||A||_2 for size m')
    xlabel('Matrix of Size: 2^m')
    ylabel('||A||_2')
    axis([0, 10, 0, 3])


    
    