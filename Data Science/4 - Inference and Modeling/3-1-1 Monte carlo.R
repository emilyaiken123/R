p <- 0.45
N <- 1000

X <- sample(c(0,1), size = N, replace = TRUE, prob = c(1-p, p))
X_hat <- mean(X)
SE_hat <- sqrt(X_hat * (1 - X_hat)/N)

# Notice that each time we run this code, the interval changes. 
# This is due to random variation.
c(X_hat - 2* SE_hat, X_hat + 2 * SE_hat)