library(dslabs)
data(gapminder)

## We can plot United States fertility rates against years using the geom_point() function...
gapminder %>% filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_point() 

## However, we may want to connect the individual points using the geom_line() function
gapminder %>% filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_line() 

## We subset the data to include two countries: South Korea and Germany.
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility)) +
  geom_line()

## However, this code has produced a line that goes through the points for both countries rather than producing one line for each country.
## We fix this by assigning each POINT to a GROUP. 
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, group = country)) +
  geom_line()

## We can use color to distinguish between the two countries.
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country)) +
  geom_line()

## We can label the curves rather than using legends. We demonstrate this using life expectancy data.
countries <- c("South Korea", "Germany")
labels <- data.frame(country = countries, x = c(1975, 1965), y = c(60, 72))
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy, col = country)) +
  geom_line() +
  geom_text(data = labels, aes(x, y, label = country), size = 5) +
  theme(legend.position="none")

