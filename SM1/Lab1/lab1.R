library(dplyr)
library(data.table)
library(RCurl)
#my.data <- read.table(file="prostate.data")
#my.data = fread('https://hastie.su.domains/ElemStatLearn/datasets/prostate.data')
my.data = getURL('https://hastie.su.domains/ElemStatLearn/datasets/prostate.data')
my.data = my.data[-c(10)]
my.data$bias = rep(1)
my.data = my.data[, colnames(my.data)[c(1:8,10,9)]]
#print(my.data)

removeCol = NULL

fit <- function(X, y){
  # X is a matrix with each column a training vector (plus an extra column of 1s for the bias)
  # y is a column vector
  w <- solve(t(X) %*% X) %*% t(X) %*% y
  return(w)
}

getXMatrix <- function(df){
  X = df[-c(10)]
  # print(X)
  if (!is.null(removeCol)){
    X = X[-c(removeCol)]
  }
  # print(X)
  return(as.matrix(X))
}

getYVector <- function(df){
  y = df$lpsa
  return(as.matrix(y))
}

getError <- function(df, w){
  X = getXMatrix(df)
  y = getYVector(df)
  # print(w)
  f = apply(X, 1, function(x) sum(x*w))
  # print(f)
  # print(y-f)
  return(sum((y-f)**2))
}

crossValidation <- function(df){
  totalError = 0
  crossVals  = 0
  n = nrow(df)
  k = n-1
  numTestRows = n-k
  firstTestRow = 1
  
  while (firstTestRow <= n){
    testRows = firstTestRow:min(c(firstTestRow+numTestRows, n))
    df_train = slice(df, -1*testRows)
    df_test = slice(df, testRows)
    
    X = getXMatrix(df_train)
    y = getYVector(df_train)
    
    # print(X)
    
    w = fit(X,y)
    
    e = getError(df_test, w)
    totalError = totalError + e
    # print(e)
    
    firstTestRow = firstTestRow + numTestRows
    crossVals = crossVals + 1
  }
  
  crossValError = totalError/crossVals
  return(crossValError)
}

# w = fit(getXMatrix(my.data), getYVector(my.data))
# print(w)
# print(getError(my.data, w))

error = crossValidation(my.data)
print(error)