# basic programming for data analyst
# 1. variable
# 2. data types
# 3. data structures
# 4. function
# 5. control flow

## finish live 22.30 PM today

## [0] basic calculation
1 + 1
2 - 5
5 * 2
5 / 2
5 ** 2
(100 - 5) * 2

## [1] variables
## reusable
new_income <- 35000 * 1.2

expense <- 22000

saving <- new_income - expense

## remove variable
rm(income)
rm(expense)


## assign operator
income <- 15000
8000 -> expense
income - expense

## [2] data types
## numeric, character, logical, date

money_in_my_pocket <- 150
my_age <- 35
my_name <- "kasidis toy"
movie_lover <- TRUE # FALSE

today_date <- as.Date("2024-07-02")

## check data types
class(my_age)
class(my_name)
class(movie_lover)
class(today_date)

## change data types
as.numeric("100")

## [3] data structures
## 1. vector
## 2. matrix
## 3. list
## 4. dataframe

## [3.1] vector, contains only single data type
friends <- c("toy", 
             "john", 
             "joe", 
             "anne", 
             "mary")

ages <- c(35, 32, 28, 29, 30)
marvel_lover <- c(T, F, T, F, F)

## [3.2] matrix
## 2D vector

m1 <- matrix(1:4, ncol=2)

m2 <- matrix(c(5,5,2,1), ncol=2)

## [3.3] list

john <- list(
    first_name = "john",
    last_name = "wick",
    age = 45,
    city = "Bangkok",
    occupation = "teacher",
    salary = 100000,
    marvel_fan = TRUE,
    marvel_movies = c("Thor",
                      "Loki Series",
                      "Infinity War")
)

## key = value data structure
## JSON
mary <- list(
  full_name = "mary anne",
  age = 28,
  city = "London",
  football_fan = TRUE,
  fav_team = c("Liverpool", "Chelsea")
)

## nested list
customers <- list(id_01 = john, 
                  id_02 = mary)

## data analyst
## know the last data structure
## [3.4] data frame => excel, csv

id <- 1:5
friends <- c("toy", "mary", "anne",
             "joe", "david")
ages <- c(35, 32, 28, 29, 30)
own_a_dog <- c(T, T, F, F, F)
city <- c("BKK", "LON", "LON",
          "TOK", "TOK")

## create a new dataframe
df <- data.frame(id, friends, ages, own_a_dog, city)

## three ways that we can subset in R
## []
## 1. by position
## 2. by name
## 3. by condition
df[ df$own_a_dog == TRUE, ]

## working with dataframe
df

## create new column
df$fav_menu <- c("somtum", "hotdog", "pizza",
                 "french fried", "hotdog")

## remove column
df$fav_menu <- NULL

## write csv file
write.csv(full_df, "result.csv", row.names = F)

## read csv file
df <- read.csv("result.csv")











## function
hello <- function() {
  print("hello world")
}

my_stupid_function <- function() {
  hello()
  hello()
  hello()
}

## create a new function `cube`
cube <- function(base, power) {
  base ** power
}







