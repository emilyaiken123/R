library(dslabs)
library(ggplot2)
library(dplyr)
data(us_contagious_diseases)
str(us_contagious_diseases)

the_disease <- "Measles"
dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii", "Alaska") & disease == the_disease) %>%
  mutate(rate = count / population * 10000) %>%
  mutate(state = reorder(state, rate))

## We add a vertical line at 1963 since this is when the vaccine for measles
## was introduced.
dat %>% filter(state == "California") %>%
  ggplot(aes(year, rate)) +
  geom_line() + ylab("Cases per 10,000") +
  geom_vline(xintercept = 1963, col = "blue")

## Using sequential color palettes on a grid for measles case data
## makes a powerful case for the effectiveness of vaccines.
dat %>% ggplot(aes(year, state, fill = rate)) +
  geom_tile(color = "grey50") +
  scale_x_continuous(expand = c(0,0)) +
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") +
  geom_vline(xintercept = 1963, col = "blue") + 
  theme_minimal() + theme(panel.grid = element_blank()) +
  ggtitle(the_disease) +
  ylab("") +
  xlab("")
