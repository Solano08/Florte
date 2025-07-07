from flask import Blueprint, render_template, request, redirect, url_for, current_app, session
from flask_bcrypt import Bcrypt
from werkzeug.utils import secure_filename
import os

from app.models.user_model import get_user_by_email, insert_user

user_bp = Blueprint('user_bp', __name__)
bcrypt = Bcrypt()

@user_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        connection = current_app.connection
        user = get_user_by_email(connection, email)
        if user and bcrypt.check_password_hash(user['contraseña'], password):
            session['user_id'] = user['id']
            return redirect(url_for('user_bp.inicio'))
        else:
            return "Login Failed"

    return render_template('inicio_sesion.html')

@user_bp.route('/register', methods=['GET', 'POST'])
def register():
    connection = current_app.connection

    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = bcrypt.generate_password_hash(request.form['password']).decode('utf-8')

        insert_user(connection, name, email, password)
        return redirect(url_for('user_bp.login'))
    return render_template('registro.html')

@user_bp.route('/inicio')
def inicio():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('user_bp.login'))
    return render_template('inicio.html')


@user_bp.route('/logout')
def logout():
    session.clear()
    return render_template('inicio.html')

from flask import Blueprint, request, jsonify
import mysql.connector
from db import get_connection  # Asegúrate de tener esto

user_bp = Blueprint('user', __name__)

@user_bp.route('/update_profile', methods=['POST'])
def update_profile():
    nombre = request.form['nombre']
    programa = request.form['programa']
    correo = request.form['correo']

    conn = get_connection()
    cursor = conn.cursor()

    # Aquí deberías usar el ID del usuario (esto es un ejemplo)
    usuario_id = 1  # ¡Usa la sesión o lo que manejes para saber quién actualiza!

    try:
        sql = """
        UPDATE usuarios
        SET nombre = %s, programa = %s, correo = %s
        WHERE id = %s
        """
        cursor.execute(sql, (nombre, programa, correo, usuario_id))
        conn.commit()
        return jsonify({'success': True})
    except Exception as e:
        print("Error:", e)
        return jsonify({'success': False, 'error': str(e)})
    finally:
        cursor.close()
        conn.close()
