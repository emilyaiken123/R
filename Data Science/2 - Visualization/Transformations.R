library(dslabs)
data(gapminder)

gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

## Using the histogram produced by the code below, we can see that the majority of countries
## live on an average of less than $10 per day.
past_year <- 1970
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black")

## To better illustrate how many people live on each daily income, we make a
## distribution of the log base 2 transformed values.
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")

## Notice that the histogram looks exactly the same. However, on the x-axis,
## instead of seeing the log values, we see the original values in a log scale.
## This means we can ver quickly interpret what this data means in terms of
## dollars per day.
gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2")