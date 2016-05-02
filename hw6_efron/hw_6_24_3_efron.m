% problem 24.3:

t = linspace(0, 20, 250);;
titlestr = 'default'
for n=1:10
    
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
    subplot(2, 5, n)
grid on
titlestr = strcat('\lambda_{max} =', ...
    sprintf('%0.3f + %0.3fi', real(dominant_eig), imag(dominant_eig)), ...
    ' \alpha = ', sprintf('%0.3f', spectral_abcissa));

filename = sprintf('problem_24_3_subplot_%n.png', n);

plot(t, log(ft), t, log(gt), t, log(ht) );
grid on
str1 = '||e^{(t*A)}||_2';
str2 = 'e^{t*\alpha(a)}';
str3 = ' | ||e^{(t*A)}||_2 - e^{t*\alpha(a)}|';
title(titlestr);
xlabel('t')
ylabel('log(f(t)')
if n ==1
    legend(str1, str2, str3);
end
saveas(currentfig, filename);

end
