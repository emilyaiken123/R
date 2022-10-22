library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex == "Male") %>% .$height
F <- function(a){
  mean(x <= a)
} 

## If I pick one of the male students at random, what is the chance that he is taller than 70.5 inches?
1 - F(70)

1- pnorm(70.5, mean(x), sd(x))

plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(X = a)")