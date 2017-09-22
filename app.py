#!/usr/bin/env python3

from bottle import Bottle, route, request, app
import keras
from DeepSPADE import data_helpers


app = Bottle()

@app.route('/')
def index():
    return 'The main HTTP API is a POST request on /spam with JSON {"body": "text"}'

@app.route('/spam')
def spam():
    body = request.query.body
    filtered = data_helpers.filterinput(body)
    score = float(app.model.predict(filtered))
    result = round(score) == 1.0
    return {'spam': result, 'score': score, 'text': body}


def main():
    from sys import argv
    try:
        host = argv[1]
    except IndexError:
        host = '0.0.0.0'
    app.model = keras.models.load_model('save_ensemble3_1.h5')
    app.run(host=host, port=8080)


if __name__ == '__main__':
    main()
