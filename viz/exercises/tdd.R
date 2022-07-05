# Load tidyverse package (which includes ggplot2 and many other useful functions for data processing)
# If you haven't installed tidyverse, uncomment and run this line:
# install.packages("tidyverse")
library(tidyverse)

# Load data frame
tdd <- read_csv("data/tdd.csv")

# Inspect data frame
glimpse(tdd)

# Get the mean and the standard deviation for each of the 13 data sets
# Convince yourself that all dataset have the same mean and standard deviation for x and y.
tdd %>% group_by(dataset) %>%
  summarise(across(c(x,y), list(mean = mean, sd = sd)))

# Regression lines illustrate this relationship for each of the 13 data sets.
ggplot(data = tdd, aes(y = y, x = x)) +
  facet_wrap(~dataset, labeller = label_both) + # show panels
  geom_smooth(method = "lm", fullrange = T, se = F) # add regression line

# The last line in the previous code creates the regression line.

# Task: Create a scatterplot with points instead of regression lines.
# Add geom_point(size = 0.5) to the plot
ggplot(data = tdd, aes(y = y, x = x)) +
  facet_wrap(~dataset, labeller = label_both)

# Convince yourself that the relationship between y and x are very different for each of the data sets.
