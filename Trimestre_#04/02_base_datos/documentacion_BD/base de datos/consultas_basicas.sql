-- CONSULTAS BASICAS 
-- 1. Mostrar todos los usuarios
SELECT * FROM usuarios;

-- 2. Mostrar todos los perfiles
SELECT * FROM perfiles;

-- 3. Ver todas las publicaciones con imagen
SELECT * FROM publicaciones WHERE media_tipo = 'image';

-- 4. Ver canales de tipo 'text'
SELECT * FROM canales WHERE tipo = 'text';

-- 5. Mostrar nombre y correo concatenado
SELECT CONCAT(nombre, ' - ', correo) AS usuario_info FROM usuarios;
