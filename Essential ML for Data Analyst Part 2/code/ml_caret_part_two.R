## recap ML workflow (simple)
## 1. split data
## 2. train model
## 3. score (predict test data)
## 4. evaluate model (train error vs. test error)

## the biggest problem = overfitting
## optimization vs. machine learning (time)

library(tidyverse)
library(caret)
library(mlbench) ## training dataset for ml problem

## split
split_data <- function(data) {
    set.seed(42)
    n <- nrow(data)
    id <- sample(1:n, size=0.7*n)
    train_df <- data[id, ]
    test_df <- data[-id, ]
    return( list(train=train_df, test=test_df) )
}

prep_df <- split_data(mtcars)

## k-fold cross validation

set.seed(42)

grid_k <- data.frame(k = c(3,5))

## repeated k-fold cv
ctrl <- trainControl(method = "repeatedcv",
                     number = 5, # k
                     repeats = 5,
                     verboseIter = TRUE) 

knn <- train(mpg ~ ., 
             data = prep_df$train,
             method = "knn",
             metric = "MAE",
             trControl = ctrl,
             ## ask program to random K
             tuneLength = 3)

## --------------------------------------
## classification problem

data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

## check/ inspect data
mean(complete.cases(df)) == 1

## glimpse
glimpse(df)

## logistic regression method = "glm"
set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5)

logit_model <- train(diabetes ~ . - triceps,
                     data = df,
                     method = "glm",
                     metric = "Accuracy",
                     trControl = ctrl)

## final model
logit_model$finalModel

## variable importance
varImp(logit_model)

## confusion matrix
p1 <- predict(logit_model, newdata=df)
p2 <- predict(logit_model, newdata=df, type="prob")

p2 <- ifelse(p2$pos >= 0.7, "pos", "neg")

t1 <- table(p1, df$diabetes, dnn = c("Predict", "Actual"))
t2 <- table(p2, df$diabetes, dnn = c("Predict", "Actual"))

## caret: confusion matrix
confusionMatrix(p, df$diabetes, 
                positive="pos",
                mode = "prec_recall")

## regression => high bias
## data change => model doesn't change that much

## save model .RDS
saveRDS(logit_model, "logistic_reg.RDS")





