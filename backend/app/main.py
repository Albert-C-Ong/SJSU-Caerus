from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from passlib.hash import sha256_crypt
import json
app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Cha0moinguoi'
app.config['MYSQL_DB'] = 'clubs'
mysql = MySQL(app)

# ---------------------------------------------------------------------------- #
#                                   Home page                                  #
# @param NA                                                                    #
# @return connect successful to server                                         #
# ---------------------------------------------------------------------------- #


@app.route("/")
def home():
    return {"status": "Connect successful to the webserver"}

# ---------------------------------------------------------------------------- #
#                                  Register Page                               #
# @param NA                                                                    #
# @post_value { name: "",                                                      #
#               user_email:"",                                                 #
#               password: ""}                                                  #
# @return "good" means correctly inserted into the database                    #
#         "error" means not correctly inserted into the database               #
# ---------------------------------------------------------------------------- #


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == 'POST':
        receive_value = request.get_json()
        cur = mysql.connection.cursor()
        try:
            cur.execute("SELECT COUNT(email) FROM student WHERE email = %s",
                        (receive_value.get("user_email"),))
            rv = list(cur.fetchone())
            if (rv[0] == 0):
                cur.execute("INSERT INTO student( student_name, email, e_password) VALUES (%s,%s,%s)", (receive_value.get(
                    "name"), receive_value.get("user_email"), sha256_crypt.hash(receive_value.get("password"))))
                mysql.connection.commit()
                cur.close()
                return{"status": "User successfully register to the database"}
            else:
                return {"status": "There is a user with same email in the database"}
        except Exception as e:
            cur.close()
            return e

# ---------------------------------------------------------------------------- #
#                                  Login Page                                  #
# @param NA                                                                    #
# @post_value {user_email:"",                                                  #
#              password:""}                                                    #
# @return {status:""                                                           #
#          club_id: "",                                                        #
#          club_name: "",                                                      #
#          club_avatar: "",                                                    #
#          club_background:"",                                                 #
#          club_email: "",                                                     #
#          club_about: "",                                                     #
#          club_award: "",                                                     #
#          club_location: ""                                                   #
#          club_type: "" }                                                     #
# ---------------------------------------------------------------------------- #


@app.route("/login", methods=["POST"])
def login():
    if request.method == 'POST':
        receive_val = request.get_json()
        cur = mysql.connection.cursor()
        try:
            cur.execute("SELECT e_password FROM student WHERE email=%s",
                        (receive_val.get("user_email"),))
            rv = list(cur.fetchone())

            if (sha256_crypt.verify(receive_val.get("password"), rv[0])):
                cur.execute('SELECT club.club_name, club.club_id , club.club_email, club.club_about, club.club_avatar, club.club_background, club.club_award, club.club_location, all_type.alltypes  FROM club LEFT JOIN club_types ON club.club_id =club_types.club_id LEFT JOIN all_type ON club_types.type_id = all_type.type_id')
                rv = cur.fetchall()
                payload = []
                content = {}
                for result in rv:
                    content = {
                        'club_name': result[0],
                        'club_email': result[1],
                        'club_about': result[2],
                        'club_avatar_img': result[3],
                        'club_background_img': result[4],
                        'club_award': result[5],
                        'club_location': result[6],
                        'club_type': result[7]
                    }
                    payload.append(content)
                    content = {}
                cur.close()
                payload[:0] = [{"status": "Login successful"}]
                return jsonify(payload)
            else:
                return jsonify([{"status": "Login Fail"}])
        except Exception as e:
            cur.close()
            return e

# ---------------------------------------------------------------------------- #
#                                All Club Info                                 #
# @param name of the clubs                                                     #
# @return {club_id: "",                                                        #
#          club_name: "",                                                      #
#          club_avatar: "",                                                    #
#          club_background:"",                                                 #
#          club_email: "",                                                     #
#          club_about: "",                                                     #
#          club_award: "",                                                     #
#          club_location: ""                                                   #
#          club_type: "" }                                                     #
# ---------------------------------------------------------------------------- #


@app.route("/clubs")
def all_clubs_info():
    cur = mysql.connection.cursor()
    try:
        cur.execute('SELECT club.club_id, club.club_name , club.club_email, club.club_about, club.club_avatar, club.club_background, club.club_award, club.club_location, all_type.alltypes  FROM club LEFT JOIN club_types ON club.club_id =club_types.club_id LEFT JOIN all_type ON club_types.type_id = all_type.type_id')
        rv = cur.fetchall()
        payload = []
        content = {}
        for result in rv:
            content = {
                'club_id': result[0],
                'club_name': result[1],
                'club_email': result[2],
                'club_about': result[3],
                'club_avatar_img': result[4],
                'club_background_img': result[5],
                'club_award': result[6],
                'club_location': result[7],
                'club_type': result[8]
            }
            payload.append(content)
            content = {}
        cur.close()
        return jsonify(payload)
    except Exception as e:
        cur.close()
        return e
# ---------------------------------------------------------------------------- #
#                                 One Club Info                                #
# @param name of the clubs                                                     #
# @return {club_id: "",                                                        #
#          club_name: "",                                                      #
#          club_avatar: "",                                                    #
#          club_background:"",                                                 #
#          club_email: "",                                                     #
#          club_about: "",                                                     #
#          club_award: "",                                                     #
#          club_location: ""                                                   #
#          club_type: "" }                                                     #
# ---------------------------------------------------------------------------- #


@app.route("/clubs/info/<club_names>")
def one_club_info(club_names):
    cur = mysql.connection.cursor()
    try:
        cur.execute('SELECT club.club_name, club.club_email, club.club_about, club.club_avatar, club.club_background, club.club_award, club.club_location, all_type.alltypes FROM club, all_type WHERE club.club_id in (SELECT club_types.club_id FROM club_types where club_types.club_id in (SELECT club.club_id FROM club WHERE club.club_name= %s)) and all_type.type_id in (SELECT club_types.type_id FROM club_types where club_types.club_id in (SELECT club.club_id FROM club WHERE club.club_name= %s))', (club_names, club_names,))
        rv = cur.fetchall()
        payload = []
        content = {}
        for result in rv:
            content = {
                'club_name': result[0],
                'club_email': result[1],
                'club_about': result[2],
                'club_avatar_img': result[3],
                'club_background_img': result[4],
                'club_award': result[5],
                'club_location': result[6],
                'club_type': result[7]
            }
            payload.append(content)
            content = {}
        cur.close()
        return jsonify(payload)
    except Exception as e:
        cur.close()
        return e

# ---------------------------------------------------------------------------- #
#                            Clubs activities                                  #
# @param name of the clubs                                                     #
# @return {club_activities_id: "",                                             #
#          club_activities: "",                                                #
#          activities_date:"",                                                 #
#          activities_link:""}                                                 #
# ---------------------------------------------------------------------------- #


@app.route("/clubs/activities/<club_names>")
def clubs_activities(club_names):
    cur = mysql.connection.cursor()
    try:
        cur.execute("SELECT * FROM activities WHERE activities.activities_id IN (SELECT club_activities.activities_id FROM club_activities WHERE club_activities.club_id in (SELECT club.club_id FROM club WHERE club.club_name= %s))", (club_names,))
        rv = cur.fetchall()
        payload = []
        content = {}
        for result in rv:
            content = {'club_activities_id': result[0],
                       'club_activities': result[1],
                       'club_date': result[2],
                       'club_link': result[3]}
            payload.append(content)
            content = {}
        cur.close()
        return jsonify(payload)
    except Exception as e:
        cur.close()
        return e

# ---------------------------------------------------------------------------- #
#                           Show all the registered Clubs                      #
# @param email of user                                                         #
# @post_val {user_email:""}                                                    #
# @return {user_email: "",                                                     #
#          club_name: "",                                                      #
#          club_avatar: "",                                                    #
#          club_background:"",                                                 #
#          club_email: "",                                                     #
#          club_about: "",                                                     #
#          club_award: "",                                                     #
#          club_location: ""}                                                  #
# ---------------------------------------------------------------------------- #


@app.route("/clubs/registered", methods=["GET", "POST"])
def registered_clubs():
    if request.method == 'POST':
        receive_value = request.get_json()
        cur = mysql.connection.cursor()
        try:
            cur.execute('SELECT student.email, club.club_name, club.club_email, club.club_about, club.club_avatar, club.club_background, club.club_award, club.club_location FROM club, student WHERE club.club_id in (SELECT student_club.club_id FROM student_club where student_club.student_id in (SELECT student.student_id FROM student WHERE student.email= %s)) and student.student_id in (SELECT student_club.student_id FROM student_club where student_club.student_id in (SELECT student.student_id FROM student WHERE student.email= %s))', (receive_value.get("user_email"), receive_value.get("user_email"),))
            rv = cur.fetchall()
            payload = []
            content = {}
            for result in rv:
                content = {
                    'user_email': result[0],
                    'club_name': result[1],
                    'club_email': result[2],
                    'club_about': result[3],
                    'club_avatar': result[4],
                    'club_background': result[5],
                    'club_award': result[6],
                    'club_location': result[7]}
                payload.append(content)
                content = {}
            cur.close()
            return jsonify(payload)
        except Exception as e:
            cur.close()
            return e
# ---------------------------------------------------------------------------- #
#                           Register for a new club                            #
# @param NA                                                                    #
# @post_value {user_email:"",                                                  #
#              club_name: ""}                                                  #
# @return {status: "good"}                                                     #
# ---------------------------------------------------------------------------- #


@app.route("/clubs/registerednewclub", methods=["POST"])
def registered_new_club():
    if request.method == 'POST':
        receive_value = request.get_json()
        cur = mysql.connection.cursor()
        try:
            cur.execute("SELECT club_id FROM club WHERE club_name=%s",
                        (receive_value.get("club_name"),))
            club_aboutto_register = cur.fetchone()[0]
            cur.execute("SELECT student_id FROM student WHERE email=%s",
                        (receive_value.get("user_email"),))
            student_wantto_register = cur.fetchone()[0]
            cur.execute("INSERT student_club(student_id, club_id) VALUES(%s,%s)",
                        (student_wantto_register, club_aboutto_register,))
            mysql.connection.commit()
            return {"status": "good"}
        except Exception as e:
            cur.close()
            return e

# ---------------------------------------------------------------------------- #
#                           Removed Registered Clubs                           #
# @param email of user                                                         #
# @post_value: {user_email:"",                                                 #
#               club_name:""}                                                  #
# @return {status: ""}                                                         #
# ---------------------------------------------------------------------------- #


@app.route("/clubs/unregistered", methods=["POST"])
def unregistered_clubs():
    if request.method == 'POST':
        receive_value = request.get_json()
        cur = mysql.connection.cursor()
        try:
            cur.execute("SELECT club_id FROM club WHERE club_name=%s",
                        (receive_value.get("club_name"),))
            club_aboutto_unregister = cur.fetchone()[0]
            cur.execute("SELECT student_id FROM student WHERE email=%s",
                        (receive_value.get("user_email"),))
            student_wantto_unregister = cur.fetchone()[0]
            cur.execute("DELETE FROM student_club WHERE student_id = %s and club_id= %s",
                        (student_wantto_unregister, club_aboutto_unregister,))
            mysql.connection.commit()
            return {"status": "good"}
        except Exception as e:
            cur.close()
            return e


if __name__ == '__main__':
    app.run(debug=True)
