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
            return redirect(url_for('user_bp.feed'))
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


@user_bp.route('/feed')
def feed():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('user_bp.login'))
    return render_template('feed.html')


@user_bp.route('/perfil')
def perfil():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('user_bp.login'))
    return render_template('perfil.html')


@user_bp.route('/explorar')
def explorar():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('user_bp.login'))
    return render_template('explorar.html')


@user_bp.route('/afinidad')
def afinidad():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('user_bp.login'))
    return render_template('afinidad.html')


@user_bp.route('/mensajes')
def mensajes():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('user_bp.login'))
    return render_template('mensajes.html')


@user_bp.route('/logout')
def logout():
    session.clear()
<<<<<<< Updated upstream
    return render_template('inicio.html')
=======
    return render_template('feed.html')
>>>>>>> Stashed changes
