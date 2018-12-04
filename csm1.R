library(dplyr)
library(corrplot)

#Import and view Data
View(X2014_and_2015_CSM_dataset)

#Eliminate missing values
dataset <- na.omit(X2014_and_2015_CSM_dataset)

#Find correlation between variables.
corrdata <- select(dataset, 5,6,7,10,11,12,13,14)
M <- cor(corrdata)
corrplot(M, method = "number")
#It is evident that there is significant correlation betweeen likes,dislikes and comments.

#Convert relevant variables to factors.
dataset$Sequel = as.factor(dataset$Sequel)
dataset$Genre = as.factor(dataset$Genre)
dataset$Year = as.factor(dataset$Year)

#Prepare data for model. Select features based on the corrplot with minimum corelations between them.
data_model <- select(dataset, 2,3,4,5,6,7,8,9,10,14)
str(data_model)

#Build model with gorss as the target variable.
fit <- lm(Gross~.,data = data_model)
summary(fit)

plot(fit)
