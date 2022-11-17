library(pracma) # for meshgrid function
library(plotly)
f <- function(x1, x2) cos(2*x1+x2-1) + sin(3*x1*x2) + x1^2 + x2^2 + 1

x <- seq(-2, 2, length=1001)
grid_XY <- meshgrid(x)

z <- matrix(mapply(f, grid_XY$X, grid_XY$Y), nrow=1001)
print(min(z))
contour(x, x, z, nlevels=20)

fig <- plot_ly(x = grid_XY$X, y = grid_XY$Y, z = z) %>% add_surface()

f1 <- deriv(expression(cos(2*x1+x2-1) + sin(3*x1*x2) + x1^2 + x2^2 + 1),
            namevec = c('x1', 'x2'), function.arg=T, hessian=T)

opt = nlm(function(x) f1(x[1], x[2]), c(0,0))
cat(opt$minimum, " @ ", opt$estimate, "\n")

opt = optim(c(0,0), function(x) f1(x[1], x[2]))
cat( opt$value, " @ ", opt$par, "\n")
