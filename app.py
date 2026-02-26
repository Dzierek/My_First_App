from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello DevOps Cierek - deployment works again!	"

@app.route("/write")
def write_file():
    with open("/home/ec2-user/output.txt", "a") as f:
        f.write(f"Deployed at: {datetime.now()}\n")
    return "File written successfully!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
