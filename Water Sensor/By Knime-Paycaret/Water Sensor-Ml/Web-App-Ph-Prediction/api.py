import pandas as pd
from pycaret.regression import load_model, predict_model
from fastapi import FastAPI
import uvicorn
from starlette.middleware.cors import CORSMiddleware as CORSMiddleware 

# Create the app
app = FastAPI()

origins = [
    "https://www.example.com",
    "https://example.com",
		"https://api.example.com"
]

app.add_middleware(
    CORSMiddleware,
   
    allow_credentials=True,
    allow_methods=["POST", "GET"],
		allow_headers=["*"],
    max_age=3600,
    allow_origins=["*"]
)
# Load trained Pipeline
model = load_model('Ph_Predictor')

# Define predict function
@app.get("/")
async def root():
    return {"message": "Hello World"}
@app.get('/predict')
def predict(Date, MonthName, Year, Area, Sub_Area, lat, long, Type):
    data = pd.DataFrame([[Date, MonthName, Year, Area, Sub_Area, lat, long, Type]])
    data.columns = ['Date', 'MonthName', 'Year', 'Area', 'Sub Area', 'lat', 'long', 'Type']
    predictions = predict_model(model, data=data) 
    return {'prediction': list(predictions['Label'])}

if __name__ == '__main__':
    uvicorn.run(app, host='127.0.0.1',port=8000)