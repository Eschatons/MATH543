% PROBLEM 12.3A
count = -1;
clf
for jj = 3:8
    count = count+1;
    m = 2.^jj;
    titleStr = strcat('\lambda and max(spectral radius)', ...
        sprintf(' of a random matrix of size %g', m));
    oldSpectral = 1;
    subplot(2, 3, jj-2)
    t = linspace(0, 2*pi, 200);
    plot(1*cos(t), 1*sin(t), 'r--', 'linewidth', 2.5)
    hold on
    plot(sqrt(2)*cos(t), sqrt(2)*sin(t), 'g--', 'linewidth', 2.5)
    plot(2*cos(t), 2*sin(t), 'b--', 'linewidth', 2.5);
    legend('1', '2^{1/2}', '2')
    for n=1:100;
        A = randn(m, m)/sqrt(m);
        lambda = eig(A);
        scatter(real(lambda), imag(lambda)), 'filled';
        spectral = max(abs(lambda));
        spectral = max(oldSpectral, spectral);
        oldSpectral = spectral;
        t = linspace(0, 2*pi, 200);
               
    end
    plot(spectral*cos(t), spectral*sin(t), 'k', 'linewidth', 2.5);
    axis([-2, 2, -2, 2])
    grid on
    xlabel('real(\lambda_i)');
    ylabel('imag(\lambda_i)');
    title(titleStr);
%    filename = sprintf('math543_hw5_problem_12_3_A_%02g.png', count);
%    saveas(current_figure, filename);
    
end
        
%% Problem 12.3B:
