% problem 12_3_c
current_figure = figure('Name', 'Minimum Singular Values of Random M x M matrices');
    s_min = zeros(8, 100);
    y_axis = zeros(8, 100);
for jj=1:8
    m = 2.^jj;
    for n=1:100;
        A = randn(m, m) / sqrt(m);
        S = svd(A);
        s_min(jj, n) = min(S);
    end
    y_axis(jj, :) = log2(s_min(jj, :));
    x_axis = zeros(100, 1) + jj;
    scatter(x_axis, y_axis(jj, :));
    axis([0, 8, -12, 1]);
    grid on
    hold on
end

filename = 'math543_hw5_problem_12_3_c_000.png';
xlabel('2^m')
ylabel('log_2(\sigma_{min})x')
title('Minimum Singular Values of Random M x M matrices');
saveas(current_figure, filename);

% ------------------------------------------------------------
clear x_axis y_axis;

x_axis = 1:8;
for ii = 1:6
    m = ii*2;
    titleStr = sprintf('Proportion of Minimum Singular Values Less Than 2^{-%g}', m);
    current_figure = figure('Name', titleStr);
    

    less_than = s_min < 2^-m;
    
    y_axis = zeros(8, 1);   
    for jj = 1:8
        y_axis(jj) = numel(nonzeros(less_than(jj, :))) / 100;
    end
    plot(x_axis, y_axis);
    grid on
    hold on
    scatter(x_axis, y_axis, 'k');
    axis([0, 8, 0, 1])
    title(titleStr)
    xlabel('size of matrix: 2^m')
    filename = sprintf('math543_hw5_problem_12_3_c_%03g.png', (ii+1) );
    saveas(current_figure, filename);
end
