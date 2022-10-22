options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(ggplot2)
library(dplyr)
library(titanic)

params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))