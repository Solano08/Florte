import os 
from dotenv import load_dotenv 

load_dotenv() 
 
class Config: 
    SECRET_KEY = os.getenv("SECRET_KEY") 
    DB_HOST = os.getenv("DB_HOST") 
    DB_USER = os.getenv("DB_USER") 
    DB_PASSWORD = os.getenv("DB_PASSWORD") 
    DB_NAME = os.getenv("DB_NAME")
    MYSQL_DB = os.getenv('MYSQL_DB')
    SESSION_COOKIE_SECURE = os.getenv('SESSION_COOKIE_SECURE', 'False').lower() in ['true', '1']