# SHH-circuit-matrix-simulation

An electrical circuit can be identified with its 'circuit laplacian' - $J$.
For a $N$ node circuit, the $J$ matrix is defined as $J(i , j) = -C_{i,j}$ when $i \neq j$ and $J(i,i) = \sum\limits_{j \neq i} c_{i,j}$. 
The circuital equation in this formalism is given as; 
$$V = JI$$
where $V$ and $I$ are node voltage and current column vectors.

The equivalant impedance between two nodes $a$ and $b$ is formulatied by appling an external voltage between the node and deducing the current through the source,
$$Z_{a,b} = \frac{V_a - V_b}{I}$$
where $I$ is the current entering at $a$ or leaving at $b$

This naturally involves inverting $V = JI$, but it should be noted that $J$ matrix is singular from construction and thus is non-invertable. 

To get around this issue, we first  formulate the eigenvalues and eigenvectors for the hermitian matrix $J^{\dagger}(\epsilon)J(\epsilon)$, where $J(\epsilon)$ is a small identity perturbation in the circuit laplacian. 

$$J^{\dagger} J \psi_{\alpha} = \sigma_{\alpha} \psi_{\alpha}$$

It can be proved that there exist orthonormal vectors $u_{\alpha}$ such that 
$$J u_{\alpha} = \lambda_{\alpha} u_{\alpha}^{\star}$$
where $\lambda_{\alpha} = \sqrt{\sigma_{\alpha}}e^{\iota \theta_{\alpha}}$. 

thus we have 
$U^{T}JU = \Delta(\epsilon)$ and $J^{-1} = U\Delta^{-1}(\epsilon)U^{T}$, this allows us to invert the above stated equation, and taking $I_{i} = I(\delta_{a ,i} - \delta_{b , i })$ after some calulation we can show that 

$$Z_{a,b} = \sum\limits_{\lambda_{k} \neq 0 } \frac{(\psi_{k,a} - \psi_{k,b})^2}{\lambda_{k}}$$


Refreances

[1.] F Y Wu 2004 J. Phys. A: Math. Gen. 37 6653

[2.] W J Tzeng and F Y Wu 2006 J. Phys. A: Math. Gen. 39 8579

[3.] Lee, Ching Hua, et al. "Topolectrical circuits." Communications Physics 1.1 (2018): 39.

