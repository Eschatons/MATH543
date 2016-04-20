% problem 12_3_c
    s_min = zeros(100, 8);
    y_axis = zeros(100, 8);
for jj=1:8
    m = 2.^jj;
    for n=1:100;
        A = randn(m, m) / sqrt(m);
        S = svd(A);
        s_min(jj, n) = min(S);
    end
    y_axis(:, jj) = log(s_min(:, jj));
    x_axis = zeros(100, 1) + jj;
    scatter(x_axis, y_axis(:, jj));
    hold on
end

xlabel('2^m')
ylabel('log(\sigma_{min})x')
title('Minimum Singular Values of Random M x M matrices');
for ii = 1:8
    titleStr = sprintf('proportion of \sigma_{min} under 2^-%g', ii);
    figure('Name', titleStr);

    for jj=1:8
        number_less_than = numel(nonzeros(s_min(:, jj) < 2^-ii) / 100);
        scatter(jj, number_less_than)
        title(titleStr);
        hold on
    end
    xlabel('Size of A: 2^m');
    ylabel('Proportion of ');
end
