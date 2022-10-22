library(gtools)
library(tidyverse)

## To estimate the probability of someone being taller than 76 inches:
avg <- mean(x)
s <- sd(x)
1 - pnorm(76, avg, s) 