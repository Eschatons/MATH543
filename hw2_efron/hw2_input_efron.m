% hw #2

%4.1:
diary('hw2_out.txt')
a = [3 0; 0 -2];
b = [2 0; 0 3];
c = [0 2; 0 0; 0 0];
d = [1 1; 0 0];d
e = [1 1; 1 1];
three_point_seven = [1 2; 0 2];

key = {'a', 'b', 'c', 'd', 'e', '3_7'};
M = {a, b, c, d, e, three_point_seven};

U = cell(5, 1);
S = cell(5, 1);
V = cell(5, 1);
for m=1:numel(M)
    [U{m}, S{m}, V{m}] = svd(M{m});
    fprintf('the singular value decomposition of \n 4.1(%s) \n', key{m})
    disp(M{m})
    fprintf('is \n')
    fprintf('U = \n')
    disp(U{m})
    fprintf('S = \n')
    disp(diag(S{m})')
    fprintf('V = \n')
    disp(V{m})
end

% 4.3
for m=1:numel(M)
    filename = sprintf('math543_hw_2_4_3_%s.png', key{m});
    try hw_2_4_3(M{m}, filename)
    catch % pass if error generated: eg, not 2x2 or linearly dependent
    end
end
