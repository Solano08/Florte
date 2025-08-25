-- CONSULTAS CON SUBCONSULTAS
-- 1. Nombre de usuario con más publicaciones
SELECT nombre FROM usuarios
WHERE id = (
  SELECT id_usuario FROM publicaciones
  GROUP BY id_usuario ORDER BY COUNT(*) DESC LIMIT 1
);
-- 2. Mostrar usuarios que reaccionaron con ❤️
SELECT nombre FROM usuarios
WHERE id IN (
  SELECT id_usuario FROM reacciones WHERE emoji = '❤️'
);

-- 3. Comentarios sobre publicaciones que tienen imagen
SELECT comentarios.contenido
FROM comentarios
WHERE comentarios.id_publicacion IN (
  SELECT publicaciones.id
  FROM publicaciones
  WHERE publicaciones.media_tipo = 'image'
);

-- 4. Nombre de los usuarios que han hecho publicaciones
SELECT usuarios.nombre
FROM usuarios
WHERE usuarios.id IN (
  SELECT publicaciones.id_usuario FROM publicaciones
);

-- 5. Publicaciones que tienen al menos una reacción
SELECT publicaciones.contenido
FROM publicaciones
WHERE publicaciones.id IN (
  SELECT reacciones.id_publicacion FROM reacciones
);

-- 6. Nombre completo de perfiles que crearon canales
SELECT perfiles.nombre_completo
FROM perfiles
WHERE perfiles.id IN (
  SELECT canales.creado_por FROM canales
);

-- 7. Nombre de canales donde se han enviado mensajes
SELECT canales.nombre
FROM canales
WHERE canales.id IN (
  SELECT mensajes.id_canal FROM mensajes
);

-- 8. Nombre de usuarios que han enviado mensajes (en canales)
SELECT usuarios.nombre
FROM usuarios
WHERE usuarios.id IN (
  SELECT perfiles.id_usuario
  FROM perfiles
  WHERE perfiles.id IN (
    SELECT mensajes.id_usuario FROM mensajes
  )
);

-- 9. Publicaciones que tienen comentarios de usuarios cuyo nombre comienza con 'J'
SELECT publicaciones.contenido
FROM publicaciones
WHERE publicaciones.id IN (
  SELECT comentarios.id_publicacion
  FROM comentarios
  WHERE comentarios.id_usuario IN (
    SELECT usuarios.id FROM usuarios WHERE usuarios.nombre LIKE 'J%'
  )
);

-- 10. Nombre de los usuarios que han comentado publicaciones que contienen la palabra "React"
SELECT usuarios.nombre
FROM usuarios
WHERE usuarios.id IN (
  SELECT comentarios.id_usuario
  FROM comentarios
  WHERE comentarios.id_publicacion IN (
    SELECT publicaciones.id
    FROM publicaciones
    WHERE publicaciones.contenido LIKE '%React%'
  )
);






