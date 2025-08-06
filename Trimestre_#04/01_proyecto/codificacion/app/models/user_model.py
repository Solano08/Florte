def get_user_by_email(connection, email):
    with connection.cursor() as cursor:
        cursor.execute("SELECT id, contraseña FROM usuarios WHERE correo=%s", (email,))
        return cursor.fetchone()

def insert_user(connection, name, email, hashed_password):
    with connection.cursor() as cursor:
        cursor.execute(
            "INSERT INTO usuarios (nombre, correo, contraseña) VALUES (%s, %s, %s)",
            (name, email, hashed_password)
        )
        connection.commit()