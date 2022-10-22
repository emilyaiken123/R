beads <- rep(c("red", "blue"), times = c(2,3))
beads

## Using the sample function, this line of code produces 1 random outcome.
sample(beads, 1)

## We want to repeat this experiment over and over. This is a Monte Carlo Simulation.
## We use the replicate function.
B <- 10000
events <- replicate(B, sample(beads, 1))

## Use table to see the distribution
tab <- table(events)
tab

## to get the proportions
prop.table(tab)

## sample WITH REPLACEMENT to eliminate the need for using replicate() altogether
events <- sample(beads, B, replace = TRUE)
prop.table(table(events))