library(dplyr)

set.seed(16)
act_scores <- rnorm(10000, 20.9, 5.7)
m <- mean(act_scores)
s <- sd(act_scores)
sum(act_scores >= 36)
mean(act_scores >= 30)
mean(act_scores <= 10)

x <- 1:36
f_x <- dnorm(x, 20.9, 5.7)
lines(x, f_x)

z <- (act_scores - m)/s
mean(z >= 2)
(2*s)+m
qnorm(.975, m, s)

F <- function(a){
  mean(act_scores <= a)
}

s <- sapply(1:36, F)
which(s >= 0.95)

qnorm(0.95, 20.9, 5.7)

p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores, p)
sample_quantiles

theoretical_quantiles <- qnorm(p, 20.9, 5.7)

plot(theoretical_quantiles, sample_quantiles)