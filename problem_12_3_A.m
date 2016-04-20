% PROBLEM 12.3A

for jj = 3:8
    m = 2.^jj;
    titleStr = sprintf('Eigenvalues of a random matrix of size %g', m);
    figure('Name', titleStr);
    oldSpectral = 1;
    for n=1:100;
        A = randn(m, m)/sqrt(m);
        lambda = eig(A);
        scatter(real(lambda), imag(lambda)), 'filled';
        hold on
        spectral = max(abs(lambda));
        spectral = max(oldSpectral, spectral);
        
        t = linspace(0, 2*pi, 200);
        plot(spectral*cos(t), spectral*sin(t), 'k');
    end
    xlabel('real(\lambda_i)');
    ylabel('imag(\lambda_i)');
    title(titleStr);
end
        
%% Problem 12.3B:
