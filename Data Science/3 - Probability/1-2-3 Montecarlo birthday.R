compute_prob <- function(n, B = 10000){
  same_day <- replicate(B, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  mean(same_day)
}

n <- seq(1, 60)

## This function does not work element-wise for a table, since it's expecting
## a scalar value.
## Therefore, we use sapply().

prob <- sapply(n, compute_prob)

## We create a plot for the probability of two people having the same birthday
## against the size of the group.
plot(n, prob)
