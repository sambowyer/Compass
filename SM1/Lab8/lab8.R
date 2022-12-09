library(dplyr)

library(caTools)
library(ROCR)

names = read.csv("senate109/name.csv")
votes = t(read.csv("senate109/votes.csv"))

names(votes) = names

votes[votes ==-1] = 0
names(votes) <- paste("V", 1:ncol(votes), sep = "")

senator = "CLINTON"
senatorID = 64

xs = votes[-64,]
ys = votes[64,]
print()
logistic_model <- glm( ~ .,
                      data = votes,
                      family = "binomial")


# # Splitting dataset
# split <- sample.split(mtcars, SplitRatio = 0.8) # bool list
# 
# train_reg <- subset(mtcars, split == "TRUE")
# test_reg <- subset(mtcars, split == "FALSE")
# 
# # print(summary(mtcars))
# # print(test_reg)
# 
# # Training model
# logistic_model <- glm(vs ~ wt + disp,
#                       data = train_reg,
#                       family = "binomial")
# 
# # Summary
# print(summary(logistic_model))
# 
# # Predict test data based on model
# predict_reg <- predict(logistic_model,
#                        test_reg, type = "response")
# print(predict_reg)
# 
# # Changing probabilities
# predict_reg <- ifelse(predict_reg >0.5, 1, 0)
# print(predict_reg)
# 
# # Evaluating model accuracy
# # using confusion matrix
# print(table(test_reg$vs, predict_reg))
# 
# missing_classerr <- mean(predict_reg != test_reg$vs)
# print(paste('Accuracy =', 1 - missing_classerr))
