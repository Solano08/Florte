-- 1. usuarios registrados:
SELECT * FROM usuarios;

-- 2. Ver todos los perfiles
SELECT * FROM perfiles;

-- 3. Ver los usuarios con correo
SELECT nombre, correo FROM usuarios;

-- 4. Ver nombre y ubicacion de todos los perfiles
SELECT nombre, ubicacion FROM perfiles;

-- 5. Perfil de usuario ID 1
SELECT * FROM perfiles WHERE id_usuario = 1;

-- 6. Ver todos los perfiles con su nombre:
SELECT nombre_completo, ocupacion FROM perfiles;


-- 7. Ver los grupos creado
SELECT nombre, descripcion FROM grupos;

-- 8. Ver todos los usuarios que un grupo
SELECT * FROM miembros_grupo WHERE id_grupo = 1;

-- 9. Ver los perfiles que pertenecen a un grupo
SELECT id_usuarios FROM miembros_grupos WHERE id_grupo = 1;

-- 10 Canales existentes
SELECT * FROM canales;

-- 11. Ver mensajes enviados en el canal 1
SELECT * FROM mensajes WHERE id_canal = 1;

-- 12. Ver publicaciones
SELECT * FROM publicaciones;

-- 13. Comentarios de la publicacion ID 2
SELECT * FROM comentarios WHERE id_publicaciones = 2;

-- 14. Reacciones con emoji 👍
SELECT * FROM reacciones WHERE emoji = '👍';

-- 15. Ver solicitudes de amistad pendientes
SELECT * FROM solicitudes_Amistad WHERE estado = 'pending';
