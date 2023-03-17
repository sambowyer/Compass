# Neural Networks

## Introduction

popular

### Setup
neurons w/ weights $w$ (+ biases $b$) and nonlinearity/activation $\phi$

$\phi(\sum_i x_i w_i + b_i)$

In layers w/ weights $W  \in \mathbb{R}^{n_l \times n_{l+1}}$ and biases $b_l \in \mathbb{R}^{n_k}$ w/ $n_l$ neurons in layer $l$:
$$\phi(W_{l}x_l + b_l)$$ 
(abuse of notation w/ $\phi$)

(if input points are $x \in \mathbb{R}^d$, then $n_l = d$)

Do this for all layers to get some output values in your final layer (*forward pass*)

set initial weights $W_{l}$ randomly

*Tons* of different shapes/types of NNs

split data into  train and test (80/20ish is good)

### Backpropagation
Loss $L(y)$ is a function of the output $y$ and the target $t$, e.g.:
$$L(y) = (t-j)^2$$

Calculate derivative wrt each weight $D_n = \frac{\partial L(y)}{\partial w_n}$ and use gradient descent to update weights:
$$w_n \leftarrow w_n - \eta D_n$$
for learning rate $\eta$
