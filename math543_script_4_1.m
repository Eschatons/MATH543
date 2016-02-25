%% script to implement 4.1:

%% Determine the SVDs of the following matrices
a = [3 0 ; 0 -2];
b = [2 0; 0 3];
c = [0 2; 0 0; 0 0];
d = [1 1; 0 0];
e = [1 1; 1 1];

MATS = {a, b, c, d, e};

[Ua, Sa, Va] = svd(a);
[Ub, Sb, Vb] = svd(b);
[Uc, Sc, Vc] = svd(c);
[Ud, Sd, Vd] = svd(d);
[Ue, Se, Ve] = svd(e);

chars = ['a' 'b' 'c' 'd' 'e'];
U = {Ua, Ub, Uc, Ud, Ue}
S = {Sa, Sb, Sc, Sd, Se}
V = {Va, Vb, Vc, Vd, Ve}

for m=1:5
    fprintf('\nThe singular value decompositon of \n%s = \n', chars(m))
    disp(MATS{m})
    fprintf('\nis U = \n')
    disp(U{m})
    fprintf('\nS = \n')
    disp(S{m})
    fprintf('\nV = \n')
    disp(V{m})
end

fprintf('\nThank you MATLAB for having this function built in.')