## connect to PostgreSQL server
library(RPostgreSQL)
library(tidyverse)

## create connection
con <- dbConnect(
  PostgreSQL(),
  host = "arjuna.db.elephantsql.com",
  dbname = "hcmsanst",
  user = "hcmsanst",
  password = "n9MIT1wNqy6HG5HsO-ypvf8SLD4VfMCh",
  port = 5432
)

## db List Tables
dbListTables(con)

dbWriteTable(con, "products", products)

## get data
df <- dbGetQuery(con, "select id, product_name from products")

## HW02 - restaurant pizza SQL
## create 3-5 dataframes => write table into server


