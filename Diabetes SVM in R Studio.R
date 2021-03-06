# Read the Data
dataset <- read.csv("C:\\Program Files\\Weka-3-8\\data\\diabetes.csv", sep = ',', header = FALSE)
str(dataset)
head(dataset)
#80% training and 20% testing
intrain <- createDataPartition(y = dataset$V9, p= 0.8, list = FALSE)
training <- dataset[intrain,]
testing <- dataset[-intrain,]
dim(training); 
dim(testing);
anyNA(dataset)
summary(dataset)
training[["V9"]] = factor(training[["V9"]])
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
#Model
svm_Linear <- train(V9 ~., data = training, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)
svm_Linear
test_pred <- predict(svm_Linear, newdata = testing)
test_pred
#Evaluation
confusionMatrix(table(test_pred, testing$V9))

