### PROBLEM 24.3:
The script 'hw_6_24_3_efron' generates the figure seen  in 
'figure_24_3.png' or 'figure_24_3.fig'
 We answer the question on pg. 189:
"What property of a matrix leads to a ||e^(tA)|| curve that remains osciallatory as t -- > inf?"

Answer: We note from our trials that a spectral abscissa < 1 implies an oscillatory curve, and a spectral absicca > 1 implies a linear curve.

### Householder Reduction to Hessenberg Form:
Implementation is householder_hessenberg.m. 
Test generated by test_hessenberg_input.m
Output of test at test_hessenberg_output.rtf
My results are good!

### Rayleigh Quotient Iteration:
Implementation is rayleigh_quotient_iteration.m
Test generated by test_rayleigh_input.m
Test Output available at test_rayleigh_output.m
My results are good for matrix size size 8<=M<=256