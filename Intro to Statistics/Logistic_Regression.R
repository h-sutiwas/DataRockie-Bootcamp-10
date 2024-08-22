## Logistic Regression
happiness <- c(10, 8, 9, 7, 8, 5, 9, 6, 8, 7, 1, 1, 3, 1, 4, 5, 6, 3, 2, 0)

divorce <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

df <- data.frame(happiness, divorce)

rep(0, 20)

## Fit Logistic Regression
model <- glm(divorce ~ happiness, data = df, family = "binomial")

summary(model)

## Predict and Evaluate model
df$prob_divorce <- predict(model, type = "response")
df$pred_divorce <- ifelse(df$prob_divorce >= 0.5, 1, 0)

## confusion matrix
confusion_matrix <- table(df$pred_divorce, df$divorce, 
                          dnn = c("Predicted", "Actual"))

## Model evaluation
confusion_matrix[1,1]
confusion_matrix[1,2]
confusion_matrix[2,1]
confusion_matrix[2,2]

cat("Accuracy:", (confusion_matrix[1,1] + confusion_matrix[2,2]) / sum(confusion_matrix))
cat("Precision:",  confusion_matrix[2,2] / (confusion_matrix[2,1] + confusion_matrix[2,2]))
cat("Recall:",  confusion_matrix[2,2] / (confusion_matrix[1,2] + confusion_matrix[2,2]))

acc <- (confusion_matrix[1,1] + confusion_matrix[2,2]) / sum(confusion_matrix)
preci <- confusion_matrix[2,2] / (confusion_matrix[2,1] + confusion_matrix[2,2])
recall <- confusion_matrix[2,2] / (confusion_matrix[1,2] + confusion_matrix[2,2])

cat("F1:", 2*(preci*recall)/(preci + recall))






