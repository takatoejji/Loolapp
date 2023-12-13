
from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse
app = Flask(__name__)

@app.route("/", methods=['GET'])
def hello():
    return "hey"

@app.route('/predict', methods=['POST'])
def predict():
	model = joblib.load("modelfinal.pkl")
	if model:
		try:
			data = request.get_json(force=True)	 
			dataframe=pd.DataFrame.from_dict(data)
			prediction = model.predict(dataframe)
			output = prediction[0]
			return jsonify(output)
		except:        
			return jsonify({'trace': traceback.format_exc()})
	else:
		return (' Sorry no model here to use')
    


if __name__ == '__main__':
    app.run(debug=True ,host='105.108.143.74', port=5000)
    