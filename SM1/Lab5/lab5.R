data = read.table("prostate.data")

polynomialKernel <- function(x1, x2, b){
  return(((t(x1) %*% x2) + 1) ^ b)
}

linearKernel <- function(x1, x2){
  return(t(x1) %*% x2)
}

RBFKernel <- function(x1, x2, sigma){
  return(exp(-(norm(matrix(x1-x2))^2)/(2*sigma^2)))
}

calculateSigma <- function(xs){
  pairwiseDistances = c()
  for (i in 1:(nrow(xs)-1)){
    for (j in (i+1):nrow(xs)){
      # print(xs[i,]-xs[j,])
      pairwiseDistances = c(pairwiseDistances, norm(matrix(xs[i,]-xs[j,])))
    }
  }
  return(median(pairwiseDistances))
}

calculate_k <- function(x, xs, kernel){
  k = rep(NA, nrow(xs))
  for (i in 1:length(k)){
    k[i] = kernel(xs[i,], x)
  }
  return(k)
}

calculate_K <- function(xs, kernel){
  K = matrix(NA, nrow=nrow(xs), ncol=nrow(xs))
  for (i in 1:nrow(xs)){
    for (j in 1:nrow(xs)){
      K[i,j] = kernel(xs[i,], xs[j,])
    }
    # K = cbind(K, calculate_k(xs[i], xs, kernel))
  }
  return(K)
}

predict <- function(k, K, ys, lambda=0){
  # print(k)
  # print(K)
  # print(ys)
  # print(lambda*diag(nrow(K)))
  # print(dim(t(k)))
  # print(dim(K))
  # print(dim(ys))
  # print(dim(lambda*diag(nrow(K))))
  return(t(k) %*% solve(K+ lambda*diag(nrow(K))) %*% ys)
}

predictWithXs <- function(x, xs, ys, kernel, lambda=0){
 k = calculate_k(x, xs, kernel)
 K = calculate_K(xs, kernel)
 return(predict(k, K, ys, lambda))
}

CVError <- function(data, numSplits, kernel, lambda=0){
  sumErr = 0
  data = data[sample(1:nrow(data)), ] # shuffles the dataset

  groupSize = ceiling(nrow(data)/(numSplits))

  for (i in 1:numSplits){
    # print(i)
    testRows = (1+(i-1)*groupSize):min(i*groupSize, nrow(data))
    # print(testRows)
    # print(length(testRows))
    testSet = data[testRows, ]
    trainSet = data[-testRows, ]

    xs = data.matrix(subset(trainSet, select=-c(lpsa, train)))
    ys = data.matrix(trainSet$lpsa)

    K = data.matrix(calculate_K(xs, kernel))
    # print(K)
    # print(666)
    # # input()
    # print(testSet)
    testXs = data.matrix(subset(testSet, select=-c(lpsa, train)))
    testYs = testSet$lpsa
    
    tempErr = 0
    for (j in 1:nrow(testSet)){
      # print(j)
      # test = testSet[j,]
      # x = data.matrix(subset(test, select=-c(lpsa, train)))
      x = testXs[j,]
      # print(x)
      k = data.matrix(calculate_k(x, xs, kernel))
      # trueY = data.matrix(testSet[i,]$lspa)
      predY = predict(k, K, ys, lambda)
      # print(predY)
      # print(testYs[j])
      # print(predY - testYs[j])
      tempErr = tempErr + (predY - testYs[j])^2
      # print(sumErr)
    }
    sumErr = sumErr + tempErr/nrow(testSet)
  }

  return (sumErr/nrow(data))
}
poly2 <- function(x1, x2) polynomialKernel(x1, x2, 2)
poly3 <- function(x1, x2) polynomialKernel(x1, x2, 3)
poly4 <- function(x1, x2) polynomialKernel(x1, x2, 4)
poly5 <- function(x1, x2) polynomialKernel(x1, x2, 5)
poly6 <- function(x1, x2) polynomialKernel(x1, x2, 6)

heuristicSigma = calculateSigma(data.matrix(subset(data, select=-c(lpsa, train))))
rbf1 <- function(x1,x2) RBFKernel(x1, x2, heuristicSigma)
rbf2 <- function(x1,x2) RBFKernel(x1, x2, heuristicSigma*1.5)
rbf3 <- function(x1,x2) RBFKernel(x1, x2, heuristicSigma/1.5)

lambdaVals = c(seq(0.1,2.5,0.1), 3:10, seq(15, 50, 5))
par(mfrow=c(2,3))
for (kernel in c(linearKernel, poly2, poly3, rbf1, rbf2, rbf3)){
  errs = c()
  for (lambdaVal in lambdaVals){
    errs = c(errs, err = CVError(data, 14, kernel, lambda=lambdaVal))
  }
  plot(lambdaVals, errs)
}

