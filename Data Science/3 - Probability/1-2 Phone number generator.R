library(gtools)

## This will generate ALL possible phone numbers, pick five at random, and then
## show them to you.
all_phone_numbers <- permutations(10, 7, v = 0:9)
n <- nrow(all_phone_numbers)
index <- sample(n, 5)
all_phone_numbers[index,]