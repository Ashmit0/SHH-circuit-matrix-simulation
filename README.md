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

To get around this issue, we first  formulate the eigenvalues and eigenvectors for the hermitian matrix $J^{\dagger}(\epsilon)J(\epsilon)$, 
$$J^{\dagger} J \psi_{\alpha} = \sigma_{\alpha} \psi_{\alpha}$$
It can be proved that there exist orthonormal vectors $u_{\alpha}$
