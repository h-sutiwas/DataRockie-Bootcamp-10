
library(RSQLite)
library(tidyverse)

## connect to sqlite.db file
con <- dbConnect(SQLite(), "chinook.db")

## list tables
dbListTables(con)

## list fields/ columns
dbListFields(con, "customers")

## get data from database tables
m1 <- dbGetQuery(con, "select firstname, email from customers
            where country = 'USA' ")

## create dataframe 
products <- tribble(
  ~id, ~product_name,
  1, "chocolate",
  2, "pineapple",
  3, "samsung galaxy S23"
)

## write table to database
dbWriteTable(con, "products", products)

## remove table
dbRemoveTable(con, "products")

## close connection
dbDisconnect(con)








