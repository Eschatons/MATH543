## 12.3.A:
The MATLAB file that generates the plot is problem_12_3_A_efron.m

###Question: "What do the eigenvalues of a random matrix look like?"
Ans: They are in the complex plane |Z| < 2, but denser on the real number line.
###Question: How does the spectral radius rho(A) behave as m --> infinity?
Ans: The spectral radius approaches 1.

##12.3.B:
The MATLAB file that generates the plot is problem_12_3_B_efron.m.
###Question: How does the 2-norm of a random atrix behave as m --> infinity?
Ans: The 2-norm appears to average around sqrt(2) for a 2x2 matrix. As the size of the matrix increases, the average norm increases (converging to 2) and the distribution of the norms appears to become denser (again, apparently converging to 2). The convergence appears to have a logmarithimc behavior.

##12.3.C:
The MATLAB file that generates the plot is problem_12_3_C_efron.m.
###Question: What proportions of random matrices seem to have singular_min <= 2^-1, 2^-2, 2^-3 ... etc.
Ans:
The larger the size of the matrix, the smaller the smallest singular value appears to be. This makes sense intuitively: singular values allow us to construct a very close approximation of a matrix from the 'most representative' vectors.