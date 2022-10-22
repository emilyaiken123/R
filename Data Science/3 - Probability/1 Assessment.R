library(gtools)
library(tidyverse)

B <- 10000

runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
set.seed(1)
jrunners <- replicate(B, {
  sample <- sample(runners, 3)
  jamaica <- ("Jamaica" == sample)
  sum(jamaica) == 3
})

mean(jrunners)
