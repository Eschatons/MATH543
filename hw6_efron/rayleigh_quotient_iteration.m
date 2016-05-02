function [vec, val] = rayleigh_quotient_iteration(A, varargin)
%% MAGIC NUMBERS
MAX_ITERATIONS = 100;
TOL = 10^-7;

%% INPUT HANDLING
if nargin > 2
    TOL = varargin{1};
end

assert(isreal(A) && issymmetric(A), 'A should be real and symmetric')
[m, ~] = size(A);


%% RAYLEIGH QUOTIENT ITERATION
vec = rand(m, 1);
val = vec'*A*vec;
lastval = val + 10^3;   % arbitrary

jj = 0;
while(jj < MAX_ITERATIONS && abs(val-lastval) > TOL)
    jj = jj+1;
    lastval = val;
    w = (A-(lastval*eye(m)))\vec;
    vec = w / norm(w);
    val = vec'*A*vec;
end

%% OUTPUT
if jj == MAX_ITERATIONS
    warningstr = sprintf('no convergence after %g iterations', ...
        MAX_ITERATIONS);
    warning(warningstr);
end

end