prev <- 0.00025
N <- 100000
outcome <- sample(c("Disease", "Healthy"), N, replace = TRUE, prob = c(prev, 1-prev))
 N_D <- sum(outcome == "Disease")
 N_D
 N_H <- sum(outcome == "Healthy")
 N_H
 
 
 # Each person has a 99% chance of the test giving them the right answer.
 # 
 accuracy <- 0.99
 test <- vector("character", N)
 test[outcome == "Disease"] <- sample(c("+", "-"), N_D, replace = TRUE, prob = c(accuracy, 1-accuracy))
 test[outcome == "Healthy"] <- sample(c("-", "+"), N_H, replace = TRUE, prob = c(accuracy, 1-accuracy))
 
 # Use the table command to display test results. We see that there are a lot of people who got a positive outcome
 # despite the accuracy. This is because there are so many more healthy people.
 table(outcome, test)