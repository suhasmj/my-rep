import os
from flask import Flask
from flaskext.mysql import MySQL

app = Flask(__name__)

mysql = MySQL()

#mysql_database_host = 'localhost'

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'sample_user'
app.config['MYSQL_DATABASE_PASSWORD'] = 'Passw0rd'
app.config['MYSQL_DATABASE_DB'] = 'sample_database'
app.config['MYSQL_DATABASE_HOST'] = '10.10.0.54'
#app.config['MYSQL_DATABASE_PORT'] = '3306'

mysql.init_app(app)

conn = mysql.connect()

cursor = conn.cursor()

@app.route("/")
def main():
    return "Welcome!"

@app.route('/howareyou')
def hello():
    return 'I am good, how about you?'

@app.route('/readfromdatabase')
def read():
    cursor.execute("SELECT * FROM sample_table")
    row = cursor.fetchone()
    result = []
    while row is not None:
      result.append(row[0])
      row = cursor.fetchone()

    return ",".join(result)

if __name__ == "__main__":
    app.run(debug=True)
