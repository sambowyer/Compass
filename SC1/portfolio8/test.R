n = 4

# install.packages("qdapDictionaries")
library(qdapDictionaries)
isWord  <- function(x) tolower(x) %in% GradyAugmented

fitness <- function(grid){
  # Add row scores
  score = sum(isWord(apply(grid, 1, function(x) paste(unlist(x), collapse=""))))
  
  # Add column scores
  score = score + sum(isWord(apply(grid, 2, function(x) paste(unlist(x), collapse=""))))
  
  # Add diagonal scores
  score = score + isWord(paste(diag(as.matrix(grid)), collapse="")) 
  score = score + isWord(paste(diag(as.matrix(rev(grid[n:1,n:1]))), collapse=""))
  
  return(score)
} 

getGrid <- function(){
  grid = data.frame(matrix(sample(LETTERS, n*n, replace=TRUE), ncol=n, nrow=n))
  colnames(grid) = 1:n
  return(grid)
}
grid = getGrid()
print(grid)
print(fitness(grid))

getNeighbour <- function(grid, dist=3){
  newGrid = grid
  for (d in 1:dist){
    pos = sample(1:n, 2, rep=TRUE)
    val = grid[pos[1], pos[2]]
    
    newGrid[pos[1], pos[2]] = sample(setdiff(LETTERS, val), 1)
  }
    return(newGrid)
}
neighbour = getNeighbour(grid)
print(neighbour)
print(fitness(neighbour))

SA <- function(s0, t0, tempUpdate, maxIter, neighbourhoodSize){
  best = s0
  bestFitness = fitness(s0)
  
  temp = t0
  
  iter = 1
  while(bestFitness < (2*n + 2) & iter <= maxIter){
    neighbour = getNeighbour(best, neighbourhoodSize)
    neighbourFitness = fitness(neighbour)
    # difference = neighbourFitness - bestFitness
    
    # if (neighbourFitness > bestFitness) print(neighbour)
    
    temp = tempUpdate(t0, iter)
    rand = runif(1)
    
    if (neighbourFitness >= bestFitness | rand < exp((neighbourFitness - bestFitness)/temp)){
      best = neighbour
      bestFitness = neighbourFitness
    }
    
    if (iter %% 1000 == 0) {
      print(best)
      cat("Iteration ", iter, ": ", bestFitness, "\n")
    }
    
    iter = iter + 1
  }
  print(best)
  print(bestFitness)
}

SA(grid, 1, function(t, i) t/(1+i/700), 100000, 3)