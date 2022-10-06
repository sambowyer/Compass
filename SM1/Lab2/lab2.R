
# Generate the data
n = 200
xs = seq(0, 2.5, length.out=n)
ys = exp(1.5*xs - 1) + rnorm(n, 0, 0.64)

# Choose default hyperparameters (max degree of feature transform, deg, and regularization coefficient, lambda)
deg    = 7
m      = deg+1
lambda = 4


#' Perform feature transformation of input data x
#'
#' @param x input data
#' @param d maximum degree of feature transform
#'
#' @return transformed data x
phi <- function(x, d=deg){
  phiX = matrix(NA, nrow=n, ncol=m)
  for(i in 1:n){
    row = rep(x[i], d+1)
    for (j in 0:d){
      row[j+1] = row[j+1]**j
    }
    phiX[i, ] = row
  }
  return(phiX)
}

#' Find regularized least-squares weights
#'
#' @param X input values
#' @param y target values
#' @param regcoeff regularization coefficient
#'
#' @return vector of optimal weights
fit <- function(X, y, regcoeff=lambda){
  w <- solve(t(X) %*% X + diag(regcoeff, dim(X)[2], dim(X)[2])) %*% t(X) %*% y
  return(w)
}

#' Calculate the predicted output value for a single input x using weights w
#'
#' @param x input value
#' @value w weights
#'
#' @return predicted output
predict <- function(x){
  y = 0
  for (i in 0:deg){
    y = y + w[i+1] * (x**i)
  }
  return(y)
}

crossValidation <- function(xs=xs, ys=ys, deg=deg, lambda=lambda){
  # TODO: Fill this in and use it to find an optimal lambda (for a given deg)
}

phiX = phi(xs, deg)

w = fit(phiX, ys, lambda)

plotVsTrue <- function(xs, ys, w){
  # TODO: Organize the plotting stuff into this function
  #       And find a way to get the 'tube' of standard deviation
}

plot(xs, ys, xlab="x", ylab="y")


curve(exp(1.5*x -1), add=TRUE, lty=2, lwd=4)
curve(predict, add=TRUE, col="red", lwd=2)
# curve(phi(x)%*%w, add=TRUE, col="red", lwd=2)

legend("topleft", legend=c("True", "Prediction"),
       col=c("black", "red"), lty=c(2,1), cex=0.8)
# lines(xs, phiX%*%w, col="red", lwd=2)