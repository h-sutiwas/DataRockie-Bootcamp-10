# load library
library(tidyverse)
library(glue)
library(lubridate)

# glue messages
my_name <- "toy"
my_age <- 35

glue("Hi! my name is {my_name}. Today I'm {my_age} years old.")

# library tidyverse
# data transformation => dplyr

# 1. select
# 2. filter
# 3. arrange
# 4. mutate => create new column
# 5. summarise + group_by

mtcars <- rownames_to_column(mtcars, "model")
view(mtcars)

## pipeline
select(mtcars, mpg, hp, wt)

m2 <- mtcars %>%
  select(mpg, hp, wt) %>%
  filter(hp > 200)

## filter am==0
m3 <- mtcars %>%
  select(model, mpg, hp, wt, am) %>%
  filter(between(hp, 100, 200)) %>%
  arrange(am, desc(hp))
  
## write csv file
write_csv(m3, "result.csv")

## mutate to create new columns
mtcars %>%
  filter(mpg >= 20) %>%
  select(model, mpg, hp, wt, am) %>%
  mutate(
         ## =IF(am=0, "auto", "manual")
         am_label = if_else(am==0, "auto", "manual"))

## summarise, summarize
## aggregate function in SQL
m4 <- mtcars %>%
  mutate(am = if_else(am==0,
                      "Auto","Manual")) %>%
  group_by(am) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            min_mpg = min(mpg),
            max_hp = max(hp),
            n = n())

## random sampling 
mtcars %>%
  sample_n(2) %>%
  pull(model)

mtcars %>%
 # sample_frac(0.20) %>%
  summarise(avg_hp = mean(hp))

## count
mtcars <- mtcars %>%
  mutate(am = if_else(am==0, "Auto",
                      "Manual"))

mtcars %>%
  count(am)




