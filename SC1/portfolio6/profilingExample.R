f3 <- function(x){
  return(x*3)
}
f4 <- function(x){
  return(f3(x)+f3(sqrt(x)))
}
f5 <- function(x){
  for(i in 1:x){
    f4(f3(i))
  }
}