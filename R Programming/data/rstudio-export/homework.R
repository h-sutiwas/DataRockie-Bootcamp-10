## homework

## transform nycflights13

library(nycflights13)
library(tidyverse) # dplyr

## ask 5 questions about this dataset
data("flights")
data("airlines")

## select filter arrange mutate summarise count

## Q1. most flight carrier in Sep 2013
flights %>%
  filter(month == 9, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  head(5) %>%
  left_join(airlines)
