color <- rep(c("Black", "Red", "Green"), c(18, 18, 2))

## 1000 independent draws:
n <- 1000
X <- sample(ifelse(color == "Red", -1, 1), n, replace = TRUE)
X[1:10]

## We can generate the draws with one line of code w/o defining color.
## We call this approach a SAMPLING MODEL.
X <- sample(c(-1, 1), n, replace = TRUE, prob = c(9/19, 10/19))
S <- sum(X)
S

## We run a Monte Carlo simulation of 1000 people playing roulette 10,000 times.
n <- 1000
B <- 10000
S <- replicate(B, {
  X <- sample(c(-1, 1), n, replace = TRUE, prob = c(9/19, 10/19))
  sum(X)
})
mean(S <= 0)