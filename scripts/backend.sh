#!/bin/bash

# Update system
apt update -y

# Install Python + pip
apt install -y python3-pip

# Install Flask
pip3 install flask

# Create backend API app
cat <<EOF > /home/backend_app.py
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "message": "Hello from backend API"
    })

app.run(host="0.0.0.0", port=5000)
EOF

# Run the app in background
nohup python3 /home/backend_app.py > /home/backend.log 2>&1 &