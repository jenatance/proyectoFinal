from flask import Flask, request

import mysql.connector as connection
import pandas as pd


app=Flask(__name__)        # se inicia la aplicacion en este archivo


data=None   # inicializo variables



@app.before_first_request   # antes de la primera llamada, haz esto...
def startup():

    global resultado1,resultado2,resultado3,resultado4,resultado5,resultado6,resultado7,resultado8

    try:
        mydb = connection.connect(host="jennatance.mysql.pythonanywhere-services.com", database = 'jennatance$Fackulty',user="jennatance", passwd="Iron12345",use_pure=True)

        query1 = "Select u.nombre, u.edad, un.nombre as Universidad, u.facultad from usuarios u inner join universidades un on u.iduniversidad = un.iduniversidad where edad < 18;"
        resultado1 = pd.read_sql(query1,mydb)
        query2 = "Select u.nombre, u.edad, un.nombre as Universidad, u.facultad from usuarios u inner join universidades un on u.iduniversidad = un.iduniversidad where edad > 45;"
        resultado2 = pd.read_sql(query2,mydb)
        query3 = "Select * from universidades where tipo = 'Pública';"
        resultado3 = pd.read_sql(query3,mydb)
        query4 = "Select * from universidades where tipo = 'Privada';"
        resultado4 = pd.read_sql(query4,mydb)
        query5 = "Select p.nombre as propuestas, u.nombre as organizador, u.facultad, un.nombre from propuestas p inner join usuarios u on u.idUsuario = p.idCreador inner join universidades un on u.iduniversidad = un.idUniversidad;"
        resultado5 = pd.read_sql(query5,mydb)
        query6 = "Select e.nombre as evento, e.fechaevento, u.nombre as organizador from eventos e inner join usuarios u on e.idcreador = u.idUsuario where fechaEvento > current_date() order by fechaEvento;"
        resultado6 = pd.read_sql(query6,mydb)
        query7 = "Select count(*) as numPropuestas, u.nombre, u.edad, u.facultad from usuarios u inner join propuestas p on u.idUsuario = p.idCreador group by u.idusuario having numPropuestas > 1 order by numPropuestas desc;"
        resultado7 = pd.read_sql(query7,mydb)
        query8 = "Select count(*) as numEventos, u.nombre, u.edad, u.facultad from usuarios u inner join eventos e on u.idUsuario = e.idCreador group by u.idusuario having numEventos > 1 order by numEventos desc;"
        resultado8 = pd.read_sql(query8,mydb)


        mydb.close() #close the connection
    except Exception as e:
        mydb.close()
        print(str(e))


@app.route('/')
def main():
    return 'Fackulty API'




@app.route('/resultado1/')
def resultado1():
    # devuelve la descripcion del dataframe
    return resultado1.to_json()

@app.route('/resultado2/')
def resultado2():
    # devuelve la descripcion del dataframe
    return resultado2.to_json()

@app.route('/resultado3/')
def resultado3():
    # devuelve la descripcion del dataframe
    return resultado3.to_json()

@app.route('/resultado4/')
def resultado4():
    # devuelve la descripcion del dataframe
    return resultado4.to_json()

@app.route('/resultado5/')
def resultado5():
    # devuelve la descripcion del dataframe
    return resultado5.to_json()

@app.route('/resultado6/')
def resultado6():
    # devuelve la descripcion del dataframe
    return resultado6.to_json()

@app.route('/resultado7/')
def resultado7():
    # devuelve la descripcion del dataframe
    return resultado7.to_json()

@app.route('/resultado8/')
def resultado8():
    # devuelve la descripcion del dataframe
    return resultado8.to_json()



if __name__== '__main__':   # cuando se ejecute este codigo...
    app.run(debug=True)    # ...inicia la app de flask. sin debug para jupyter, en .py debug=True