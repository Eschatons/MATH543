%problem 12_3_b
current_figure = figure;
avg_A_norm= zeros(8, 1);
for jj=1:8
    m = 2.^jj;
    A = randn(m, m, 100)/sqrt(m);
    A_norms = zeros(100, 1);
    for n=1:100
        A_norms(n) = norm(A(:, :, n));
    end
    avg_A_norm(jj) = mean(A_norms);
    x_component = zeros(100, 1) + jj;
    scatter(x_component, A_norms);
    hold on
end
scatter(1:8, avg_A_norm, 'k', 'filled');
plot(1:8, avg_A_norm);
title('||A||_2 for size m')
xlabel('Matrix of Size: 2^m')
ylabel('||A||_2')
axis([0, 8, 0, 3])
filename = 'math543_hw5_problem_12_3_b.png';
saveas(current_figure, filename);