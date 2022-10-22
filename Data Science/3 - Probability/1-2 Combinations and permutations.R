## Building a deck of cards
suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight",
             "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
deck <- paste(deck$number, deck$suit)

## Check the probabilty that you will get a king
kings <- paste("King", suits)
mean(deck %in% kings)

## What is the probability that the second card is a king given that the first
## is a king?
## We will need to load the gtools library.

library(gtools)
permutations(5, 2)

## To compute all possible ways that we can choose two cards when the order 
## matters, we type:
hands <- permutations(52, 2, v = deck)

first_card <- hands[,1]
second_card <- hands[,2]

## How many cases have the first card that is a king?
sum(first_card %in% kings)

## What proportion of these cases ALSO have a king in the second card?
sum(first_card %in% kings & second_card %in% kings) / 
  sum(first_card %in% kings)

## Notice the difference between the permutations() function and the 
## combinations() function.
permutations(3, 2)
combinations(3, 2)

## Compute the probability of a natural 21 in blackjack
aces <- paste("Ace", suits)

facecard <- c("King", "Queen", "Jack", "Ten")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)

hands <- combinations(52, 2, v = deck)
mean(hands[,1] %in% aces & hands[,2] %in% facecard)

## We can also use a Monte Carlo simulation to calculate the probability of a natural 21.
hand <- sample(deck, 2)

B <- 10000
results <- replicate(B, {
  hand <- sample(deck, 2)
  (hand[1] %in% aces & hand[2] %in% facecard) |
    (hand[2] %in% aces & hand[1] %in% facecard)
})
mean(results)