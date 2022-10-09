# -*- coding: utf-8 -*-
"""
Created on Tue Nov 17 21:40:41 2020
@author: win10
"""

# 1. Library imports
from sklearn.model_selection import train_test_split
import uvicorn
from fastapi import FastAPI
from typing import Union

from fastapi import FastAPI, Query
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
import pickle
import pandas as pd
# 2. Create the app object
app = FastAPI()
tfvect = TfidfVectorizer(stop_words='english', max_df=0.7)
loaded_model = pickle.load(open('API/model.pkl', 'rb'))


fake_df = pd.read_csv('API/Fake.csv')
real_df = pd.read_csv('API/True.csv')
fake_df.drop(['date', 'subject'], axis=1, inplace=True)
real_df.drop(['date', 'subject'], axis=1, inplace=True)

fake_df['class'] = 0
real_df['class'] = 1


news_df = pd.concat([fake_df, real_df], ignore_index=True, sort=False)
news_df['text'] = news_df['title'] + news_df['text']
news_df.drop('title', axis=1, inplace=True)


features = news_df['text']
targets = news_df['class']


X_train, X_test, y_train, y_test = train_test_split(
    features, targets, test_size=0.20, random_state=18)


def fake_news_det(news):
    tfid_x_train = tfvect.fit_transform(X_train)
    tfid_x_test = tfvect.transform(X_test)
    input_data = [news]
    vectorized_input_data = tfvect.transform(input_data)
    prediction = loaded_model.predict(vectorized_input_data)
    # print(classification_report(y_test,prediction))
    # return precision_score(y_test,prediction)
    return prediction

# 3. Index route, opens automatically on http://127.0.0.1:8000
@app.get('/')
def index():
    return {'message': 'Hello, World'}

# 4. Route with a single parameter, returns the parameter within a message
#    Located at: http://127.0.0.1:8000/AnyNameHere
# @app.get('/{name}')
# def get_name(name: str):
#     return {'Welcome To Krish Youtube Channel': f'{name}'}

# 3. Expose the prediction functionality, make a prediction from the passed
#    JSON data and return the predicted Bank Note with the confidence
# @app.get('/predict')
# def predict():
#     message = request
#     if request.method == 'GET':
#         message = request.args['query']
#         pred = fake_news_det(message)
#         print(pred)
#         return str(pred)
#     else:
#         return render_template('index.html', prediction="Something went wrong")

@app.get('/{predict}')
def get_name(predict: str):
    pred = fake_news_det(predict)

    return str(pred)

# 5. Run the API with uvicorn
#    Will run on http://127.0.0.1:8000
if __name__ == '__main__':
    uvicorn.run(app, host='127.0.0.1', port=8000)
    
#uvicorn app:app --reload