import flask
from flask import request,Flask
import os
import socket
import platform
import sys
import time
from datetime import datetime
import logging

app = Flask(__name__)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s"
)

logger = logging.getLogger(__name__)

@app.before_request
def before_request():
    request.start_time = time.time()

@app.after_request
def after_request(response):
    duration = round(time.time() - request.start_time, 4)

    logger.info(
        '%s %s %s %.4fs',
        request.method,
        request.path,
        response.status_code,
        duration
    )
    return response

@app.route("/")
def index():
    return "Hello World! This is the Test Site for Docker compose"

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
