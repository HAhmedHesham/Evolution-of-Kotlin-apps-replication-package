# Start Flask Server
The Flask server must be started locally on the Raspberry Pi before an experiment can be run.

## Requirements
- Python 3 (https://www.python.org/downloads/)
- Flask (https://flask.palletsprojects.com/en/2.0.x/)

## Usage
In the app.py file the local IP adress of the Raspberry Pi must be added. The port number can be left at the default value of 5000 unless that port is being used by a different service. The example code must be run from within the Flask-folder.
Then run:
``python3 app.py``

##### Example expected behaviour:
###### Input
``python3 app.py``

###### Output

\* Serving Flask app "app" (lazy loading)
\* Environment: production
WARNING: Do not use the development server in a production environment.
Use a production WSGI server instead.
\* Debug mode: on
 \* Running on http://192.168.0.243:5000/ (Press CTRL+C to quit)
 \* Restarting with stat
 \* Debugger is active!
 \* Debugger PIN: 627-449-393