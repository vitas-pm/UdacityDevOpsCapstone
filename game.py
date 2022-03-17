from flask import Flask, request, jsonify, render_template, send_from_directory
from flask.logging import create_logger
import logging


app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)


@app.route("/")
def home():
    return render_template('index.html')

@app.route("/<folder>/<file>")
def get_from_folder(folder, file):
    return send_from_directory("templates", f"{folder}/{file}")

@app.route("/about")
def about():
    html = 'Created by Gabriele Cirulli.</br>' \
           'Based on 1024 by Veewo Studio and conceptually similar to Threes by Asher Vollmer.</br>' \
           '2048 is licensed under the <a href="https://github.com/gabrielecirulli/2048/blob/master/LICENSE.txt">MIT license.</a>'
    return html.format(format)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True)
