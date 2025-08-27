CREATE DATABASE redsocial;
USE redsocial;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  correo VARCHAR(50),
  contraseña VARCHAR(50)
);

CREATE TABLE perfiles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  nombre_completo VARCHAR(100),
  avatar_url VARCHAR(255),
  bio TEXT,
  github_url VARCHAR(255),
  linkedin_url VARCHAR(255),
  ubicacion VARCHAR(100),
  ocupacion VARCHAR(100),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE grupos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  imagen_fondo VARCHAR(255),
  id_propietario INT NOT NULL,
  FOREIGN KEY (id_propietario) REFERENCES perfiles(id)
);

CREATE TABLE miembros_grupo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_grupo INT NOT NULL,
  id_usuario INT NOT NULL,
  rol VARCHAR(10) DEFAULT 'member' CHECK (rol IN ('admin', 'member')),
  FOREIGN KEY (id_grupo) REFERENCES grupos(id),
  FOREIGN KEY (id_usuario) REFERENCES perfiles(id)
);

CREATE TABLE canales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_grupo INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('text', 'voice')),
  descripcion TEXT,
  creado_por INT NOT NULL,
  FOREIGN KEY (id_grupo) REFERENCES grupos(id),
  FOREIGN KEY (creado_por) REFERENCES perfiles(id)
);

CREATE TABLE mensajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_canal INT NOT NULL,
  id_usuario INT NOT NULL,
  contenido TEXT,
  media_url VARCHAR(255),
  media_tipo VARCHAR(10) CHECK (media_tipo IN ('image', 'audio', 'video')),
  FOREIGN KEY (id_canal) REFERENCES canales(id),
  FOREIGN KEY (id_usuario) REFERENCES perfiles(id)
);

CREATE TABLE publicaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  contenido TEXT,
  media_url VARCHAR(255),
  media_tipo VARCHAR(20),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_publicacion INT NOT NULL,
  id_usuario INT NOT NULL,
  contenido TEXT,
  FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE reacciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_publicacion INT NOT NULL,
  id_usuario INT NOT NULL,
  emoji VARCHAR(10),
  FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE solicitudes_amistad (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_emisor INT NOT NULL,
  id_receptor INT NOT NULL,
  estado VARCHAR(10) DEFAULT 'pending' CHECK (estado IN ('pending', 'accepted', 'rejected')),
  FOREIGN KEY (id_emisor) REFERENCES usuarios(id),
  FOREIGN KEY (id_receptor) REFERENCES usuarios(id)
);

CREATE TABLE amistades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario1 INT NOT NULL,
  id_usuario2 INT NOT NULL,
  FOREIGN KEY (id_usuario1) REFERENCES usuarios(id),
  FOREIGN KEY (id_usuario2) REFERENCES usuarios(id)
);

CREATE TABLE chats_privados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario1 INT NOT NULL,
  id_usuario2 INT NOT NULL,
  FOREIGN KEY (id_usuario1) REFERENCES usuarios(id),
  FOREIGN KEY (id_usuario2) REFERENCES usuarios(id)
);

CREATE TABLE mensajes_privados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_chat INT NOT NULL,
  id_emisor INT NOT NULL,
  contenido TEXT,
  media_url VARCHAR(255),
  media_tipo VARCHAR(20),
  FOREIGN KEY (id_chat) REFERENCES chats_privados(id),
  FOREIGN KEY (id_emisor) REFERENCES usuarios(id)
);

CREATE TABLE proyectos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  descripcion TEXT,
  imagen_url VARCHAR(255),
  proyecto_url VARCHAR(255),
  github_url VARCHAR(255),
  tecnologias TEXT,
  FOREIGN KEY (id_usuario) REFERENCES perfiles(id)
);
-- Usuarios
INSERT INTO usuarios (nombre, correo, contraseña) VALUES
('Camila Torres', 'camila@example.com', 'clave123'),
('Mateo Ramírez', 'mateo@example.com', 'clave123'),
('Valentina Gómez', 'valentina@example.com', 'clave123'),
('Juan López', 'juan@example.com', 'clave123'),
('Sofía Rojas', 'sofia@example.com', 'clave123'),
('Andrés Pérez', 'andres@example.com', 'clave123'),
('Isabella Martínez', 'isabella@example.com', 'clave123'),
('Santiago Herrera', 'santiago@example.com', 'clave123'),
('Laura Vargas', 'laura@example.com', 'clave123'),
('Carlos Nieto', 'carlos@example.com', 'clave123');

-- Perfiles
INSERT INTO perfiles (id_usuario, nombre_completo, avatar_url, bio, github_url, linkedin_url, ubicacion, ocupacion) VALUES
(1, 'Camila Torres García', 'https://avatar.com/camila.jpg', 'Diseñadora UX/UI', 'https://github.com/camila', 'https://linkedin.com/in/camila', 'Bogotá', 'Diseñadora'),
(2, 'Mateo Ramírez Ortiz', 'https://avatar.com/mateo.jpg', 'Amante del backend', 'https://github.com/mateo', 'https://linkedin.com/in/mateo', 'Medellín', 'Programador'),
(3, 'Valentina Gómez Ruiz', 'https://avatar.com/valentina.jpg', 'Frontend con React', 'https://github.com/valentina', 'https://linkedin.com/in/valentina', 'Cali', 'Desarrolladora'),
(4, 'Juan López Pérez', 'https://avatar.com/juan.jpg', 'Product Designer', 'https://github.com/juanl', 'https://linkedin.com/in/juanl', 'Cartagena', 'Diseñador'),
(5, 'Sofía Rojas Méndez', 'https://avatar.com/sofia.jpg', 'Proyectos creativos', 'https://github.com/sofia', 'https://linkedin.com/in/sofia', 'Pereira', 'Diseñadora Gráfica'),
(6, 'Andrés Pérez Santos', 'https://avatar.com/andres.jpg', 'Desarrollo Full Stack', 'https://github.com/andres', 'https://linkedin.com/in/andres', 'Barranquilla', 'Ingeniero'),
(7, 'Isabella Martínez Díaz', 'https://avatar.com/isabella.jpg', 'Aprendiendo Angular', 'https://github.com/isabella', 'https://linkedin.com/in/isabella', 'Manizales', 'Programadora'),
(8, 'Santiago Herrera León', 'https://avatar.com/santiago.jpg', 'Scrum Master', 'https://github.com/santiago', 'https://linkedin.com/in/santiago', 'Bucaramanga', 'Analista'),
(9, 'Laura Vargas Castillo', 'https://avatar.com/laura.jpg', 'Diseñadora Industrial', 'https://github.com/laura', 'https://linkedin.com/in/laura', 'Armenia', 'Diseñadora'),
(10, 'Carlos Nieto Guzmán', 'https://avatar.com/carlos.jpg', 'DevOps entusiasta', 'https://github.com/carlos', 'https://linkedin.com/in/carlos', 'Ibagué', 'Ingeniero');

-- Grupos
INSERT INTO grupos (nombre, descripcion, imagen_fondo, id_propietario) VALUES
('Dev Creators', 'Grupo de programadores creativos', 'https://img.com/bg1.jpg', 2),
('Diseño y Arte', 'Diseñadores compartiendo ideas', 'https://img.com/bg2.jpg', 1),
('Frontend Lovers', 'Todo sobre frontend', 'https://img.com/bg3.jpg', 3),
('Backenders Club', 'Programación backend', 'https://img.com/bg4.jpg', 6),
('Full Stack Team', 'Hablamos de Full Stack', 'https://img.com/bg5.jpg', 6),
('Diseño UX', 'Espacio para UX', 'https://img.com/bg6.jpg', 5),
('React Fans', 'Solo React developers', 'https://img.com/bg7.jpg', 4),
('PHP Lovers', 'Compartiendo código PHP', 'https://img.com/bg8.jpg', 8),
('Ideas Creativas', 'Comparte tus ideas', 'https://img.com/bg9.jpg', 9),
('Tecnología Hoy', 'Noticias de tecnología', 'https://img.com/bg10.jpg', 10);

-- Miembros del grupo
INSERT INTO miembros_grupo (id_grupo, id_usuario, rol) VALUES
(1, 2, 'admin'),
(2, 1, 'admin'),
(3, 3, 'admin'),
(4, 6, 'admin'),
(5, 6, 'admin'),
(6, 5, 'admin'),
(7, 4, 'admin'),
(8, 8, 'admin'),
(9, 9, 'admin'),
(10, 10, 'admin');

-- Canales
INSERT INTO canales (id_grupo, nombre, tipo, descripcion, creado_por) VALUES
(1, 'general', 'text', 'Canal general del grupo', 2),
(2, 'ideas', 'text', 'Comparte ideas creativas', 1),
(3, 'react', 'text', 'Todo sobre ReactJS', 3),
(4, 'backend', 'text', 'Programación backend', 6),
(5, 'fullstack', 'text', 'Proyectos Full Stack', 6),
(6, 'ux-discussion', 'text', 'Intercambio de experiencias', 5),
(7, 'proyectos', 'text', 'Proyectos ReactJS', 4),
(8, 'php', 'text', 'Consultas PHP', 8),
(9, 'ideas-locuras', 'text', 'Locuras creativas', 9),
(10, 'tech-news', 'text', 'Noticias tecnológicas', 10);

-- Mensajes en canales
INSERT INTO mensajes (id_canal, id_usuario, contenido, media_url, media_tipo) VALUES
(1, 2, 'Hola a todos 👋', NULL, NULL),
(2, 1, 'Aquí va mi idea...', NULL, NULL),
(3, 3, '¿Quién trabaja con React?', NULL, NULL),
(4, 6, '¿Conocen frameworks nuevos?', NULL, NULL),
(5, 6, '¿Qué opinan de Next.js?', NULL, NULL),
(6, 5, 'Nuevo diseño disponible', 'https://img.com/d1.jpg', 'image'),
(7, 4, 'Proyecto nuevo en React', NULL, NULL),
(8, 8, 'Les comparto un código en PHP', NULL, NULL),
(9, 9, 'Se me ocurrió esto...', NULL, NULL),
(10, 10, 'Nueva actualización de tecnología', NULL, NULL);

-- Publicaciones
INSERT INTO publicaciones (id_usuario, contenido, media_url, media_tipo) VALUES
(1, 'Mi nuevo diseño web', 'https://img.com/web.jpg', 'image'),
(2, 'Nuevo proyecto en Laravel', NULL, NULL),
(3, 'Probando React Native', NULL, NULL),
(4, 'Diseño UX para ecommerce', 'https://img.com/ux.jpg', 'image'),
(5, 'Tutorial Full Stack', NULL, NULL),
(6, 'Plantillas PHP', NULL, NULL),
(7, 'Ideas para portafolio', NULL, NULL),
(8, 'Consulta sobre CSS Grid', NULL, NULL),
(9, 'Nueva app en desarrollo', NULL, NULL),
(10, 'Hackathon en Bogotá', NULL, NULL);

-- Comentarios
INSERT INTO comentarios (id_publicacion, id_usuario, contenido) VALUES
(1, 2, 'Muy buen diseño 👏'),
(2, 3, 'Laravel es genial'),
(3, 4, 'React Native es potente'),
(4, 5, 'Excelente propuesta UX'),
(5, 6, 'Quiero ver ese tutorial'),
(6, 7, '¿Dónde está el repositorio?'),
(7, 8, 'Ideas geniales'),
(8, 9, 'CSS Grid me encanta'),
(9, 10, '¿Cuándo estará lista la app?'),
(10, 1, 'Me apunto al hackathon');

-- Reacciones
INSERT INTO reacciones (id_publicacion, id_usuario, emoji) VALUES
(1, 3, '❤️'),
(2, 4, '🔥'),
(3, 5, '👍'),
(4, 6, '❤️'),
(5, 7, '🔥'),
(6, 8, '👍'),
(7, 9, '🔥'),
(8, 10, '👍'),
(9, 1, '❤️'),
(10, 2, '🔥');

-- Solicitudes de amistad
INSERT INTO solicitudes_amistad (id_emisor, id_receptor, estado) VALUES
(1, 2, 'pending'),
(2, 3, 'accepted'),
(3, 4, 'pending'),
(4, 5, 'accepted'),
(5, 6, 'pending'),
(6, 7, 'accepted'),
(7, 8, 'pending'),
(8, 9, 'accepted'),
(9, 10, 'pending'),
(10, 1, 'accepted');

-- Amistades
INSERT INTO amistades (id_usuario1, id_usuario2) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- mostrar usuarios registrados 
SELECT * FROM usuarios;

-- Listado de los nombres de los grupos y su propietario
SELECT g.nombre, p.nombre_completo AS propietario
FROM grupos g
JOIN perfiles p ON g.id_propietario = p.id_usuario;

-- Ver los mensajes del canal 'general
SELECT m.contenido, u.nombre AS autor
FROM mensajes m
JOIN usuarios u ON m.id_usuario = u.id_usuario
JOIN canales c ON m.id_canal = c.id_canal
WHERE c.nombre = 'general';

-- Obtener todas las publicaciones con el usuario que publico
SELECT p.contenido, u.nombre
FROM publicaciones p
JOIN usuarios u ON p.id_usuario = u.id_usuario;

-- Buscar los proyectos que usen 'React' en su lista de tecnologías
SELECT * FROM proyectos
WHERE tecnologias LIKE '%React%';

-- Listado de  las solicitudes de amistad pendientes del usuario 'Camila Torres'
SELECT sa.*
FROM solicitudes_amistad sa
JOIN usuarios u ON sa.id_emisor = u.id_usuario
WHERE u.nombre = 'Camila Torres' AND sa.estado = 'pending';

--  Mostrar las publicaciones que tengan imágenes (media_tipo = 'image')
SELECT * FROM publicaciones
WHERE media_tipo = 'image';

-- Mostrar el nombre del grupo al que pertenece 'Mateo Ramírez'
SELECT g.nombre
FROM grupos g
WHERE g.id_grupo IN (
  SELECT mg.id_grupo
  FROM miembros_grupo mg
  WHERE mg.id_usuario = (
    SELECT id_usuario FROM usuarios WHERE nombre = 'Mateo Ramírez'
  )
);

-- Obtener las reacciones de la publicación con más comentarios
SELECT r.*
FROM reacciones r
WHERE r.id_publicacion = (
  SELECT id_publicacion
  FROM comentarios
  GROUP BY id_publicacion
  ORDER BY COUNT(*) DESC
  LIMIT 1
);

-- Listado de  los nombres completos de quienes tengan publicaciones con reacciones de tipo '❤️'
SELECT DISTINCT p.nombre_completo
FROM publicaciones pub
JOIN reacciones r ON pub.id_publicacion = r.id_publicacion
JOIN perfiles p ON pub.id_usuario = p.id_usuario
WHERE r.emoji = '❤️';

-- Listado de nombres completos de los  usuarios con el nombre del grupo al que pertenecen
SELECT u.nombre AS usuario, g.nombre AS grupo
FROM usuarios u
INNER JOIN miembros_grupo mg ON u.id_usuario = mg.id_usuario
INNER JOIN grupos g ON mg.id_grupo = g.id_grupo;

-- Mostrar el nombre completo y correo de los usuarios concatenados
SELECT CONCAT(nombre, ' - ', correo) AS usuario_info
FROM usuarios;
 



