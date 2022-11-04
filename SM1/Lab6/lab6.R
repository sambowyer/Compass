set.seed(4)
n = 100

x1s = rnorm(n)
x2s = rnorm(n)
xs = cbind(x1s, x2s)

g <- function(x){
  return(x[2] + x[1])
}
# print(xs)
posXs = c()
negXs = c()
ys = c()
for (i in 1:n){
  if (g(xs[i,]) > 0) {
    y = 1 
    posXs = rbind(posXs, xs[i,])
  } else {
    y = -1
    negXs = rbind(negXs, xs[i,])
  }
  ys = c(ys, y)
}
# print(posXs)
# print(negXs)
# print(cbind(xs, ys))

# Add two outliers
xs = rbind(xs, c(-1,-1))
posXs = rbind(posXs, c(-1,-1))
ys = c(ys, 1)

xs = rbind(xs, c(1,1))
negXs = rbind(negXs, c(1,1))
ys = c(ys, -1)

refresh <- function(){
  plot(x1s, x2s, type='n', xlab='x1', ylab='x2')
  points(posXs[,1], posXs[,2], col="red")
  points(negXs[,1], negXs[,2], col="blue")
}
refresh()

maxIteration = 100
stepSize0 = 10

w = rnorm(3)
f <- function(x) c(x, 1) %*% w
plot_f <- function(x) -(w[3] + x*w[1])/w[2]

for(i in 1:maxIteration){
  for (j in 1:nrow(xs)){
    if (f(xs[j,])*ys[j] <= 0){
      w = w + ys[j]*(stepSize0/i^1.3)*(c(xs[j,],1))/norm(matrix(c(xs[j,],1)))
    }
  }
  print(w)
  # curve(plot_f, add=TRUE)
  # points = seq(-2,2,100)
  # contour(points,points, f(points), levels=0)
  refresh()
  abline(w[3], -w[2]/w[1])
  Sys.sleep(0.1)
}
