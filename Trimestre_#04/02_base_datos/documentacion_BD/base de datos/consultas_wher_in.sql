-- CONSULTAS WHERE IN

-- 1. Usuarios que han publicado algo
SELECT nombre
FROM usuarios
WHERE id IN (SELECT id_usuario FROM publicaciones);

-- 2. Perfiles ubicados en ciudades específicas
SELECT nombre_completo, ubicacion
FROM perfiles
WHERE ubicacion IN ('Bogotá', 'Medellín', 'Cali');

-- 3. Comentarios sobre publicaciones con imagen
SELECT contenido
FROM comentarios
WHERE id_publicacion IN (
  SELECT id FROM publicaciones WHERE media_tipo = 'image'
);

-- 4. Reacciones en publicaciones de los usuarios con ID 1, 2 y 3
SELECT emoji
FROM reacciones
WHERE id_usuario IN (1, 2, 3);

-- 5. Mensajes de los canales 'general', 'ideas' o 'react'
SELECT mensajes.contenido
FROM mensajes
WHERE id_canal IN (
  SELECT id FROM canales WHERE nombre IN ('general', 'ideas', 'react')
);

-- CONSULTAS WHERE NOT IN

-- 1. Perfiles que no están en Bogotá ni Cali
SELECT nombre_completo, ubicacion
FROM perfiles
WHERE ubicacion NOT IN ('Bogotá', 'Cali');

-- 2. Perfiles que no han creado ningún grupo
SELECT nombre_completo
FROM perfiles
WHERE id NOT IN (SELECT id_propietario FROM grupos);



