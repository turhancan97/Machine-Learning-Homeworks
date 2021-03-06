import numpy as np
import pandas as pd # library for loading dataset
diabetes_dataset= pd.read_csv("C:/Program Files/Weka-3-8/data/diabetes.csv") #loading dataset to pandas dataframe
 # Assign data from first four columns to X variable
X = diabetes_dataset.iloc[:, 0:4]
# Assign data from first fifth columns to y variable
y = diabetes_dataset.select_dtypes(include=[object])
from sklearn.model_selection import train_test_split # Train-Test Split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.20)
from xgboost import XGBClassifier #Applying Model
model = XGBClassifier()
model.fit(X_train, y_train)
print(model)
# make predictions for test data
predictions = model.predict(X_test)
# evaluate predictions
from sklearn.metrics import accuracy_score
accuracy = accuracy_score(y_test, predictions)
print("Accuracy: %.2f%%" % (accuracy * 100.0))
