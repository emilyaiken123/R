library(dslabs)
data(gapminder)

ds_theme_set()
filter(gapminder, year == 1962) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) +
  geom_point()