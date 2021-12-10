from flask import Flask

app = Flask(__name__)

@app.route('/version')
def current_version():
    return('Version 1')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000, debug=True)