# app/controllers/main_controller.py
from flask import Blueprint, render_template

main_bp = Blueprint('main_bp', __name__)

@main_bp.route('/')
def home():
    return render_template('registro.html')

main_bp.route('/feed')
def feed():
    return render_template('feed.html')


@main_bp.route('/afinidad')
def afinidad():
    return render_template('afinidad.html')

@main_bp.route('/perfil')
def perfil():
    return render_template('perfil.html')

@main_bp.route('/explorar')
def explorar():
    return render_template('explorar.html')

@main_bp.route('/login')
def login():
    return render_template('login.html')