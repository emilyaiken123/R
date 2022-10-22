library(gridExtra)
library(ggplot2)
library(tidyverse)

B <- 10000
N <- 1000
p <- 0.45
X_hat <- replicate(B, {
 X <- sample(c(0, 1), size = N, replace = TRUE, prob = c(1-p, p))
 mean(X) 
})
X_hat
mean(X_hat)
sd(X_hat)

p1 <- data.frame(X_hat = X_hat) %>% ggplot(aes(X_hat)) +
  geom_histogram(binwidth = 0.005, color = "black")
p2 <- data.frame(X_hat = X_hat) %>% ggplot(aes(sample = X_hat)) +
  stat_qq(dparams = list(mean = mean(X_hat), sd = sd(X_hat))) +
  geom_abline() +
  ylab("X_hat") +
  xlab("THeoretical normal")
grid.arrange(p1, p2, nrow = 1)