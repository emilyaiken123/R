
## Recall that our goal was to determine whether the Western vs. Developing 
## world dichotomy was correct.
## While the previous exercise revealed there were two distinct groups,
## it did not show whether or not these were western or developing countries.
## It will be more useful for us to stratify the data into regions and then 
## examine the distribution for each.

library(dslabs)
data(gapminder)

gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)

## Determine the number of regions. We get 22.
length(levels(gapminder$region))

## Rather than creating a series of histograms/smooth density plots,
## we stack boxplots next to each other.
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day))
p + geom_boxplot()

## Note that we cannot read the region names because they overlap due to the 
## default ggplot settings.
## We fix this by rotating the labels.
## The hjust = 1 argument justifies the text so that it's next to the axis.
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(region, dollars_per_day))
p + geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

## It helps to order the regions in some other order that is not alphabetical.
## The reorder() function can help us achieve this. 

## EXAMPLE: Suppose we want to order the levels based on the mean value of each.
fac <- factor(c("Asia", "Asia", "West", "West", "West"))
levels(fac)
value <- c(10, 11, 12, 6, 4)
fac <- reorder(fac, value, FUN = mean)
levels(fac)

## Reorder the regions based on median income level
p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot(aes(region, dollars_per_day, fill = continent)) + 
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("")
p 

## Add the layer for log base 2 transformation 
p + scale_y_continuous(trans = "log2")

## Last change we can make is to show the data (add the individual points).
p + scale_y_continuous(trans = "log2") + geom_point(show.legend = FALSE)