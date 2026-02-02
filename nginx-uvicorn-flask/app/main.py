from flask import Flask, jsonify
from asgiref.wsgi import WsgiToAsgi

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Hello from Flask via Uvicorn and Nginx!"})

asgi_app = WsgiToAsgi(app)
