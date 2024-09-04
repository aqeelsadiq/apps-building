
#import sys
#from datetime import datetime
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
 #   now = datetime.now()
    return f"Hello, World!This is my python application"
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)

