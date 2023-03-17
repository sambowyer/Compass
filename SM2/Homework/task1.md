## Task 1

### Question 1

#### Unidentifiable model
Next we shall show that the constant kernel $k(x,x') = 1 \; \forall x \in \mathcal{x}$ leads to the model being unidentifiable.
Importantly, first note that the constant First is a valid kernel function, as it is positive definite and symmetric.

Now consider the vector space of functions $\mathcal{H}_k = \{f : f \text{ is a constant function}\}$ and the inner product $\langle \cdot, \cdot \rangle_k$ on this space given by $\langle f, g \rangle_k = fg$.
Observe that with this inner product, we obtain the reproducing property 

$$ f(x) = \langle f, k(x, \cdot) \rangle_k \;\; \forall x \in \mathcal{X}, \; \forall f \in \mathcal{H}_k.$$

Hence $(\mathcal{H}_k, \langle \cdot, \cdot \rangle_k)$ is the unique reproducing kernel Hilbert space induced by the kernel $k$.

Then by the definition of our space $\mathcal{K}$ we know that there exist two functions $f_1, f_2 \in \mathcal{H}_k$ such that $a = f_1 \neq f_2 = b$ for some $a,b \in \mathcal{R}$.
Finally note that the model parameterised by $(f_1, \alpha, \phi)$ is the same as the model parameterised by $(f_2, \alpha + a - b, \phi)$ since 
$$ \alpha + f_1(x) = \alpha + a - b + b = (\alpha + a - b) + f_2(x) = a \;\; \forall x \in \mathcal{X}.$$
Hence the kernel $k$ is leads to the model being unidentifiable.

#### Identifiable model
We shall now show that the Gaussian kernel $k(x,x') = \exp(\sigma \|x-x'\|^2)$ leads to the model being identifiable.
To this end, let us write the unique RKHS that this kernel induces as $(\mathcal{H}_k, \langle \cdot, \cdot \rangle_k$.

Since the parameter $\phi$ of the model is uniquely defined for given $f$ and $\alpha$, we know that the model will only be unidentifiable if there exist two distinct functions $f_1, f_2 \in \mathcal{H}_k$ such that $f_1 - f_2$ is a constant function. (For example, similarly to the previous question, if $f_1(x) -f_2(x) = c \in \mathbb{R}$ for all $x \in \mathcal{X}$, then the model parameterised by $(f_1, \alpha, \phi)$ is the same as the model parameterised by $(f_2, \alpha + c, \phi)$.)

However, we know that since $\mathcal{H}_k$ is a vector space and $f_1, f_2 \in \mathcal{H}$, then $f_1 - f_2 \in \mathcal{H}_k$.
Furthermore, a result given in the lecture notes (pg. 200) tells us that $\mathcal{H}_k$ contains no constant functions except for the zero function (and since $f_1$ and $f_2$ are distinct, we know that $f_1 - f_2$ is not the zero function). Hence no such functions $f_1, f_2 \in \mathcal{H}_k$ exist meaning the model is identifiable. 

### Question 2
Set $\lambda > 0$ and suppose that the function
$$\hat{f}_\lambda = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, \cdot)$$

is indeed such that 
$$(\hat{\alpha}_\lambda, \hat{\phi}_\lambda, \hat{f}_\lambda) \in \argmax_{\alpha \in \mathbb{R}, \phi \in (0, \infty), f \in \mathcal{H}_k} \frac{1}{2n}\sum_{i=1}^n \log \tilde{f}(y_i; g^{-1}(\alpha + f(x_i^0)), \phi) - \lambda||f||_{\mathcal{H}_k}^2.$$

As given in the question, we may assume that $\exists f_1 \in \tilde{\mathcal{H}}_n, f_2 \in \tilde{\mathcal{H}}_n^\perp$ such that $\hat{f}_\lambda = f_1 + f_2$.
Now since $f_1 \in \tilde{\mathcal{H}}_n$ and 
$$\tilde{\mathcal{H}}_n = \text{span}\{k(x_1^0, \cdot),...,k(x_n^0, \cdot)\},$$
then there exists $\hat{\beta}_{\lambda} \in \mathbb{R}^n$ such that $f_1 = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, \cdot)$.

Next observe that via the reproducing property of the RKHS $(\mathcal{H}_k, \langle \cdot, \cdot \rangle_k)$, we have that, for each $j \in \{1,...,n\}$,
$$\begin{aligned}
\hat{f}_\lambda(x_j^0) = \langle \hat{f}_\lambda, k(x_j^0, \cdot)\rangle_k &= \langle f_1 + f_2, k(x_j^0, \cdot)\rangle_k \\
&= \langle f_1, k(x_j^0, \cdot)\rangle_k + \langle f_2, k(x_j^0, \cdot)\rangle_k \\
&= f_1(k(x_j^0) + 0 \\
&= \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, x_j^0)
\end{aligned}$$

Where we have also used the linearity of the inner product and the fact that $x_j^0 \in \tilde{\mathcal{H}}_n \implies x_j^0 \notin \tilde{\mathcal{H}}_n^\perp \implies  \langle f_2, k(x_j^0, \cdot)\rangle_k= 0$.

Now we have shown that $\hat{f}_\lambda(x_j^0) = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, x_j^0)$ for all $j \in \{1,...,n\}$, however, we must still prove that $\hat{f}_\lambda(x) = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, x)$ for all $x \in \mathbb{R}^p$.

To do this, note that the first term of the optimisation problem's objective function
$$\frac{1}{2n}\sum_{i=1}^n \log \tilde{f}(y_i; g^{-1}(\alpha + f(x_i^0)), \phi)$$
only requires us to evaluate $f=\hat{f}_\lambda$ at $x_1^0,...,x_n^0$, which is independent of $f_2$ if we set $f_1(x) = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, x)$ $\forall x \in \mathbb{R}^p$. 

Finally, note that the second term of the objective function is given by
$$\begin{aligned}
\lambda||f||_{\mathcal{H}_k}^2 = \lambda \langle f, f \rangle_k &= \lambda \langle f_1 + f_2, f_1 + f_2 \rangle_k \\
&= \lambda \langle f_1, f_1 \rangle_k + \lambda \langle f_2, f_2 \rangle_k + 2 \lambda \langle f_1, f_2 \rangle_k \\
&= \lambda ||f_1||^2_{\mathcal{H}_k} + \lambda ||f_2||^2_{\mathcal{H}_k} + 0.
\end{aligned}$$
This clearly this is minimised when $f_2 = 0$ and hence $||f_2||^2_{\mathcal{H}_k} = 0$ in which case we arrive at the desired result:
$$\hat{f}_\lambda = f_1 = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, \cdot).$$

### Question 3
Since question 2 has showed us that $\hat{f}_\lambda(x_i^0) = \sum_{j=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, x_j^0)$, rewriting the first term of the objective function is trivial.
What remains is to show that the norm inside the second term of the objective function can be written as follows:
$$\begin{aligned}
||\hat{f}_\lambda||^2_{\mathcal{H}_k} &= \langle \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, \cdot), \sum_{j=1}^n \hat{\beta}_{\lambda, j} k(x_j^0, \cdot) \rangle_k \\
&= \sum_{i=1}^n \sum_{j=1}^n \hat{\beta}_{\lambda, i} \hat{\beta}_{\lambda, j} \langle k(x_i^0, \cdot), k(x_j^0, \cdot) \rangle_k \\
&= \sum_{i=1}^n \sum_{j=1}^n \hat{\beta}_{\lambda, i} \hat{\beta}_{\lambda, j} k(x_i^0, x_j^0) \\
&= \hat{\beta}_{\lambda}^T K \hat{\beta}_{\lambda}
\end{aligned}$$

where $K$ is the $n \times n$ matrix with entries $K_{ij} = k(x_i^0, x_j^0)$.

Hence the objective function then becomes
$$\begin{aligned}
\hat{\gamma}_\lambda = (\hat{\alpha}_\lambda, \hat{\phi}_\lambda, \hat{\beta}_\lambda) \in \argmax_{\alpha \in \mathbb{R}, \phi \in (0, \infty), \beta_\lambda \in \mathbb{R}^p} \frac{1}{2n}&\sum_{i=1}^n \log \tilde{f}(y_i; g^{-1}(\alpha + \sum_{j=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, x_j^0)), \phi) \\ 
&- \lambda\hat{\beta}_{\lambda}^T K \hat{\beta}_{\lambda}.
\end{aligned}$$

### Question 4
To reduce the dimension of the optimisation problem from $n+2$ to $m$ we can use the Nyström method. This method is based on the idea that we can approximate the kernel matrix $K$ by a matrix $\tilde{K}^{(d)}$ of rank at most $d \vcentcolon= m-2$ such that $\tilde{K}^{(d)} \approx K$.
In particular, we let 
$$\tilde{K}^{(d)} = K_{n,d} (K_{d,d})^{-1} K_{d,n}$$
where by $K_{a,b}$ we denote the submatrix of $K$ consisting of the first $a$ rows and $b$ columns. (Note in particular that this means that $K_{n,d} = K_{d,n}^T$.)

Now we may examine how the function $\hat{f}_\lambda$ is affected by the approximation $\tilde{K}^{(d)}$, i.e. using the Nyström kernel 
$$\tilde{k}^{(d)}(x, \cdot) = k_d(x)^T (K_{d,d})^{-1} k_d(\cdot)$$
where $k_d(\cdot) = (k(x_1^0, \cdot), ..., k(x_d^0, \cdot)) \in \mathbb{R}^d$.
Observe that
$$\begin{aligned}
\hat{f}_\lambda(\cdot) = \sum_{i=1}^n \hat{\beta}_{\lambda, i} k(x_i^0, \cdot) &\approx \sum_{i=1}^n \hat{\beta}_{\lambda, i} \tilde{k}^{(d)}(x_i^0, \cdot) \\
&= \sum_{i=1}^n \hat{\beta}_{\lambda, i} k_d(x_i^0)^T (K_{d,d})^{-1} k_d(\cdot) \\
&= \left(\sum_{i=1}^n \hat{\beta}_{\lambda, i} k_d(x_i^0)^T \right)(K_{d,d})^{-1} k_d(\cdot)\\
&= \hat{\beta}_\lambda K_{n,d}(K_{d,d})^{-1} k_d(\cdot)\\
&= \hat{\nu}_\lambda^T k_d(\cdot)
\end{aligned}$$
where $\hat{\nu}_\lambda^T \vcentcolon= \hat{\beta}_\lambda^T K_{n,d}(K_{d,d})^{-1} \in \mathbb{R}^d$ (and thus $\hat{\nu}_\lambda = (K_{d,d})^{-1} K_{n,d}^T \hat{\beta}_\lambda$ since $K_{d,d}$ is diagonal means that so is its inverse).

Now we have parameters $\hat{\nu}_\lambda \in \mathbb{R}^d$, $\alpha \in \mathbb{R}$ and $\hat{\phi} \in (0, \infty)$, i.e. we have reduced the dimension of the optimisation problem from $n+2$ to $d+2=m$.
However, we need to reformulate the penalty term in the objective function to work with our new parameter $\hat{\nu}_\lambda$ instead of $\hat{\beta}_\lambda$.
We can do this by noting that
$$\begin{aligned}

\hat{\beta}_{\lambda}^T K \hat{\beta}_{\lambda} \approx \hat{\beta}_{\lambda}^T \tilde{K}^{(d)} \hat{\beta}_{\lambda} 
&= \hat{\beta}_{\lambda}^T K_{n,d} (K_{d,d})^{-1} K_{n,d}^T \hat{\beta}_{\lambda} \\
&= \left(\hat{\beta}_{\lambda}^T K_{n,d} (K_{d,d})^{-1}\right) (K_{d,d}) \left((K_{d,d})^{-1} K_{n,d}^T \hat{\beta}_{\lambda}\right) \\
&= \hat{\nu}_\lambda^T K_{d,d} \hat{\nu}_\lambda. \\
\end{aligned}$$

Thus, the objective function of the $m$-dimensional optimisation problem is:
$$\begin{aligned}
(\hat{\alpha}_\lambda, \hat{\phi}_\lambda, \hat{\nu}_\lambda) \in \argmax_{\alpha \in \mathbb{R}, \phi \in (0, \infty), \nu\_lambda \in \mathbb{R}^p} \frac{1}{2n}&\sum_{i=1}^n \log \tilde{f}(y_i; g^{-1}(\alpha + \nu_\lambda^T k_d(x_i^0)), \phi) \\ 
&- \lambda\nu_\lambda^T K_{d,d} \nu_\lambda.
\end{aligned}$$

### Question 5
In order to use the `R` package `glmnet` in solving this problem, we need to convert the penalty term into an $\lambda$ multiplied by an L2 norm (an L1 norm would also work with `glmnet`, however, we'll see that an L2 norm arises fairly easily after some manipulation).

We do this by first obtaining the spectral decomposition of $K_{d,d}$, i.e. $K_{d,d} = U D U^T$ where $U$ is an orthogonal matrix and $D$ is a diagonal matrix. 
With this, the penalty term easily takes on the desired L2 norm form:
$$\begin{aligned}

\lambda \hat{\nu}_\lambda^T K_{d,d} \hat{\nu}_\lambda = \lambda \hat{\nu}_\lambda^T U D U^T \hat{\nu}_\lambda 
&= \lambda (\hat{\nu}_\lambda^T U D^{1/2})(D^{1/2} U^T \hat{\nu}_\lambda) \\
&= \lambda (D^{1/2} U^T \hat{\nu}_\lambda)^T(D^{1/2} U^T \hat{\nu}_\lambda) \\
&= \lambda ||D^{1/2} U^T \hat{\nu}_\lambda||_2^2.
\end{aligned}$$

However, `glmnet` actually requires that the norm is taken on the parameter that is being multiplied by the data inside the objective function. 
Previously this parameter was $\hat{\nu}_\lambda^T$ being multiplied by our (kernelised) data $k_d(x_i^0)$, but now we want to transform the data so that the corresponding parameter is $(D^{1/2} U^T \hat{\nu}_\lambda)^T$.
We do this by observing that
$$\begin{aligned}\hat{\nu}_\lambda^T k_d(x_i^0) 
&= \hat{\nu}_\lambda^T (U D^{1/2} D^{-1/2} U^T) k_d(x_i^0) \\
&= (\hat{\nu}_\lambda^T U D^{1/2})(D^{-1/2} U^T k_d(x_i^0)) \\
&= (D^{1/2} U^T \hat{\nu}_\lambda)^T(D^{-1/2} U^T k_d(x_i^0)) \\
\end{aligned}$$

Hence denoting our transformed data as $x_i^\text{new} = D^{-1/2} U^T k_d(x_i^0)$ we would call `glmnet` with the command `glmnet(X_new, y, alpha = 0)` (see question 6) where $X_\text{new} = (D^{-1/2} U^T K_{d,n})^T = K_{n,d} U D^{-1/2}$. (Note that we have also set `alpha = 0` since we are using an L2 norm penalty, rather than an L1 norm penalty that would require `alpha=1`).

This is solving the same optimisation problem as in the previous question, however, it might be clearer to now write the objective function as

$$\begin{aligned}
(\hat{\alpha}_\lambda, \hat{\phi}_\lambda, \hat{\nu}_\lambda) \in \argmax_{\alpha \in \mathbb{R}, \phi \in (0, \infty), \nu\lambda \in \mathbb{R}^p} \frac{1}{2n}&\sum_{i=1}^n \log \tilde{f}(y_i; g^{-1}(\alpha + (D^{1/2} U^T \nu_\lambda)^Tx_i^\text{new}), \phi) \\ 
&- \lambda ||D^{1/2} U^T \nu_\lambda||_2^2.
\end{aligned}$$