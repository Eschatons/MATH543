% problem 24.3:

t = linspace(0, 20, 250);
for n=1:3    
    currentfig = figure('Name', titlestr);
    for m=1:4
    
        % math
        A = normrnd(0, 1, [10 10]) - 2*eye(10);

        eigA = eig(A);

        spectral_abcissa = max(real(eigA));

        abcissa_index = find(real(eigA) == spectral_abcissa);
        abcissa_eig = eigA(abcissa_index);

        dominant_index = find(abs(eigA) == max(abs(eigA)));
        dominant_eig = eigA(dominant_index);

        ft = zeros(250, 1);
        gt = zeros(250, 1);
        for j=1:250
            ft(j) = norm(expm(t(j)*A));
            gt(j) = exp(t(j)*spectral_abcissa);
            ht(j) = abs(ft(j)-gt(j));
        end
        % formatting and output
        if      m == 1,               subplot(2, 2, 1);
        elseif  m == 2,               subplot(2, 2, 2);
        elseif  m == 3,               subplot(2, 2, 3);
        elseif  m == 4,               subplot(2, 2, 4);
        end
        grid on
        titlestr = strcat(sprintf('A_{%g, %g}:', n, m), ' dominant \lambda =', ...
            sprintf('%0.3f + %0.3fi', real(dominant_eig), imag(dominant_eig)), ...
            ' \alpha = ', sprintf('%0.3f', spectral_abcissa)); 
        
        filename = sprintf('problem_24_3_subplot_%n.png', n);

        plot(t, log(ft), t, log(gt), t, log(ht) );
        str1 = '||e^{(t*A)}||_2';
        str2 = 'e^{t*\alpha(a)}';
        str3 = ' | ||e^{(t*A)}||_2 - e^{t*\alpha(a)}|';
        title(titlestr);
        xlabel('t')
        ylabel('log(f(t)')
        legend(str1, str2, str3);
        saveas(currentfig, filename);
    end
end
 