library(dslabs)
library(dplyr)
library(ggplot2)
data(gapminder)

gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

west <- c("Western Europe", "Northern Europe", "Southern Europe", 
          "Northern America", "Australia and New Zealand")


## We can see that the income distribution of the developing world has shifted 
## more towards the left than that of the western world. 
past_year <- 1970
present_year <- 2010
gapminder %>%
  filter(year %in% c(past_year, present_year) & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

## NOTE: There are more countries represented in the 2010 histograms than in the 1970 ones.
## Several countries were founded after 1970.
## Because of this, we are going to remake the plots using data only available for BOTH years.
country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1, country_list_2)

## We used the intersect function in line 30 to find the countries for which
## data exists for both years.

gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(group = ifelse(region%in%west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

p <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("") + scale_y_continuous(trans = "log2")
p + geom_boxplot(aes(region, dollars_per_day, fill = continent)) +
  facet_grid(year ~ .)

p + geom_boxplot(aes(region, dollars_per_day, fill = factor(year)))