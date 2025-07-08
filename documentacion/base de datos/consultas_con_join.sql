-- consultas join

-- 1. Listado de los nombres de los grupos y su propietario
SELECT grupos.nombre, perfiles.nombre_completo AS propietario
FROM grupos
JOIN perfiles ON grupos.id_propietario = perfiles.id;

-- 2. Obtener nombre del usuario y su ocupación
SELECT usuarios.nombre, perfiles.ocupacion
FROM usuarios
JOIN perfiles ON usuarios.id = perfiles.id_usuario;

-- 3. Mostrar nombre del grupo y el nombre completo del propietario
SELECT grupos.nombre, perfiles.nombre_completo
FROM grupos
JOIN perfiles ON grupos.id_propietario = perfiles.id;

-- 4. Ver mensajes con el nombre del canal y del autor
SELECT mensajes.contenido, canales.nombre, perfiles.nombre_completo
FROM mensajes
JOIN canales ON mensajes.id_canal = canales.id
JOIN perfiles ON mensajes.id_usuario = perfiles.id;

-- 5. Listar miembros de cada grupo con su rol y nombre completo
SELECT grupos.nombre, perfiles.nombre_completo, miembros_grupo.rol
FROM miembros_grupo
JOIN grupos ON miembros_grupo.id_grupo = grupos.id
JOIN perfiles ON miembros_grupo.id_usuario = perfiles.id;

-- 6. Mostrar publicaciones y nombre del autor
SELECT publicaciones.contenido, usuarios.nombre
FROM publicaciones
JOIN usuarios ON publicaciones.id_usuario = usuarios.id;

-- 7. Mostrar comentarios y el nombre del usuario que comentó
SELECT comentarios.contenido, usuarios.nombre
FROM comentarios
JOIN usuarios ON comentarios.id_usuario = usuarios.id;

-- 8. Ver reacciones con nombre del usuario y emoji
SELECT reacciones.emoji, usuarios.nombre
FROM reacciones
JOIN usuarios ON reacciones.id_usuario = usuarios.id;

-- 9. Mostrar solicitudes de amistad con nombre de emisor y receptor
SELECT usuarios.nombre AS emisor, usuarios_2.nombre AS receptor, solicitudes_amistad.estado
FROM solicitudes_amistad
JOIN usuarios ON solicitudes_amistad.id_emisor = usuarios.id
JOIN usuarios AS usuarios_2 ON solicitudes_amistad.id_receptor = usuarios_2.id;


-- 10 Mostrar publicaciones junto al nombre del usuario que las hizo
SELECT usuarios.nombre, publicaciones.contenido
FROM publicaciones
JOIN usuarios ON publicaciones.id_usuario = usuarios.id;








