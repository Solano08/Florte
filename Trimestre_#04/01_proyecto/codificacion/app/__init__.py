from flask import Flask
import pymysql.cursors
from config import Config

import os
 
def create_app(): 
    app = Flask(__name__) 

    app.config.from_object(Config) 

    connection = pymysql.connect(
        host=app.config['DB_HOST'],
        user=app.config['DB_USER'],
        password=app.config['DB_PASSWORD'],
        database=app.config['DB_NAME'],
        cursorclass=pymysql.cursors.DictCursor
    )

    app.connection = connection

    from app.controllers.main_controller import main_bp
    from app.controllers.user_controller import user_bp

    app.register_blueprint(main_bp)
    app.register_blueprint(user_bp)


    return app 