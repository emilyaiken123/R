library("ggplot2")

x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)

x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)

replicate(3, 1 + 1)

replicate(10, roll())

## We expect after 10,000 rolls of two dice that the qplot function will produce a fairly symmetrical histogram.
rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)