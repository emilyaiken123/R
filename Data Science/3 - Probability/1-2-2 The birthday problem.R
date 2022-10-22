n <- 50
bdays <- sample(1:365, n, replace = TRUE)

any(duplicated(bdays))

B <- 10000
results <- replicate(B, {
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})

mean(results)