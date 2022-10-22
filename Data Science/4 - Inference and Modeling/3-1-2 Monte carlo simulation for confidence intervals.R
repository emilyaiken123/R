B <- 10000
inside <- replicate(B, {
  X <- sample(c(0, 1), size = N, replace = TRUE, prob = c(1-p, p))
  X_hat <- mean(X)
  SE_hat <- sqrt(X_hat * (1 - X_hat)/N)
  
  # In this line we ask, "Is p included in the interval?"
  between(p, X_hat - 2 * SE_hat, X_hat + 2* SE_hat)
})
mean(inside)

