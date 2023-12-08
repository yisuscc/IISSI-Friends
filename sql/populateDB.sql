-- realizado por Álvaro Caño Soto y mejprado/ corregido  por jesus carrascosa 
 SET SESSION sql_mode='NO_AUTO_VALUE_ON_ZERO';
 SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE fotos;
TRUNCATE TABLE ubicaciones;
TRUNCATE TABLE fichasDePreferencias;
TRUNCATE TABLE aficiones;
TRUNCATE TABLE vinculos_amistades;

TRUNCATE TABLE conversaciones;


TRUNCATE TABLE aficiones_usuarios;
TRUNCATE TABLE aficiones_preferidas;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO usuarios (usuarioID , nombre, fechaNacimiento, estatura, peso, genero, email, password, fechaAlta, fechaBaja,estaActivo, colorPelo, colorOjo) VALUES
	(0, 'Pablo Ruíz Mármol', '2002-02-18', 182, 76, 'masculino', 'pablillocartaya43@gmail.com', 'JonNieve1044', '2021-12-25', NULL, TRUE,'rubio', 'castaños'),
	(12, 'Francisco Wu Lei', '2000-10-03', 170, 58, 'masculino', 'franbetis2000@gmail.com', 'Michael23Scott', '2021-12-13', NULL, TRUE,'negro', 'verdes'),
	(2, 'Rosa Carvalho', '2001-08-03', 165, 55, 'femenino', 'rosavenenosa2014@gmail.com', '11razonesAitana', '2021-12-01', NULL, TRUE,'rubio', 'azules'),
  	(3, 'Leticia Soto Barrón', '1987-05-08', 178, 67, 'femenino', 'letisoba87@gmail.com', '1234Leti2Cia', '2021-12-29',  NULL,TRUE, 'rojo', 'negro'),
  	(4, 'María Becerra Santos', '1999-07-01', 168, 60, 'femenino', 'maritu99s@gmail.com', 'colacao1234','2021-12-25',  NULL,TRUE, 'gris', 'grises');

INSERT INTO fotos (fotoID, nombre, url, email, descripcion, fecha) VALUES
	(0, 'chilena del bicho', 'https://e00-marca.uecdn.es/assets/multimedia/imagenes/201aficionesaficiones8/08/28/15354563833179.jpg', 'pablillocartaya43@gmail.com', 'Gol de Cristiano de chilena', 26/12/2021),
	(1, 'Sevilla tan sonriente', 'https://cadenaser00.epimg.net/ser/imagenes/2021/10/09/cultura/1633766690_671000_1633767040_noticia_normal.jpg', 'franbetis2000@gmail.com', 'Plaza de España en verano', 16/12/2021),
	(2, 'Aitana!!!', 'https://www.elnacional.cat/enblau/uploads/s1/15/29/91/71/aitana-portada.jpeg', 'rosavenenosa2014@gmail.com', 'Mi cantante favorita!!!', 20/12/2021),
	(3, 'EL PLAN', 'https://fotografias.lasexta.com/clipping/cmsimages01/2021/11/22/CBB3123A-4901-4A1A-AFAE-507D3F24A5E3/98.jpg?crop=3060,1722,x0,y0&width=1900&height=1069&optimize=low&format=webply', 'letisoba87@gmail.com', 'Fernando Alonso ganará el mundial 2022', 31/12/2021);
	
INSERT INTO ubicaciones (ubicacionID, email, codigoPostal, municipio, provincia) VALUES
	(0, 'pablillocartaya43@gmail.com', 41012, 'Sevilla', 'Sevilla'),
	(1, 'franbetis2000@gmail.com', 41015, 'Sevilla', 'Sevilla'),
	(2, 'rosavenenosa2014@gmail.com', 21440, 'Lepe', 'Huelva' ),
	(3, 'letisoba87@gmail.com', 21410, 'Isla Cristina', 'Huelva'),
	(4, 'maritu99s@gmail.com', 41006, 'Sevilla', 'Sevilla');

INSERT INTO fichasDePreferencias (fichaID, edad_maxima, edad_minima,codigoPostal, municipio, provincia, estatura_maxima,estatura_minima,peso_maximo,peso_minimo,email, colorPelo, colorOjo, genero) VALUES
	(0, 23, 18, 41012, 'Sevilla', 'Sevilla', 182, 150, 75, 40, 'pablillocartaya43@gmail.com', 'rubio', 'azules', 'femenino' ),
	(2, 30, 20, 41006, 'Sevilla', 'Sevilla', 192, 168, 95, 65, 'franbetis2000@gmail.com', 'rubio', 'castaños', 'masculino' ),
	(3, 21, 18, 23740, 'Andújar', 'Jaén', 185, 170, 90, 65, 'rosavenenosa2014@gmail.com', 'negro', 'verdes', 'masculino' ),
	(4, 23, 18, 41015, 'Sevilla', 'Sevilla', 172, 160, 65, 52, 'letisoba87@gmail.com', 'blanco', 'azules', 'femenino' ),
	(5, 23, 18, 41011, 'Sevilla', 'Sevilla', 190, 150, 90, 40, 'maritu99s@gmail.com', 'rojo', 'negro', 'femenino' );
	
INSERT INTO aficiones (aficionID, aficion) VALUES
	(1, 'fútbol'),
	(2, 'cine'),
	(3, 'series'),
	(4, 'yoga'),
	(5, 'comida'),
	(6, 'videojuegos'),
	(7, 'política'),
	(8, 'música'),
	(9, 'arte'),
	(10, 'pasear');	

INSERT INTO vinculos_amistades (vinculoID, email1, email2, fecha_solicitud, fecha_aceptación, fecha_revocacion_solicitud, fecha_revocacion_aceptación, VinculoActivo) VALUES
	(0, 'pablillocartaya43@gmail.com', 'rosavenenosa2014@gmail.com',  '2021-01-01', '2022-01-02', NULL, NULL, TRUE),
	(1, 'rosavenenosa2014@gmail.com', 'letisoba87@gmail.com', '2021-05-20','2022-01-02', NULL, NULL, FALSE),
	(2, 'letisoba87@gmail.com', 'pablillocartaya43@gmail.com', '2020-12-01', NULL , NULL, NULL, TRUE),
	(3, 'franbetis2000@gmail.com', 'rosavenenosa2014@gmail.com','2020-05-01', '2020-12-02', '2021-12-03', NULL, FALSE);
		
INSERT INTO conversaciones (conversacionID, vinculoID, fecha_inicio, fecha_fin, new_message) VALUES
	(1, 0, '2021-12-31', NULL, 1),
	(2, 3, '2022-01-01', '2022-01-02', 0);
	

INSERT INTO aficiones_usuarios (aficionesUsuarioID, aficionID, email) VALUES
	(0, 5, 'pablillocartaya43@gmail.com'),
	(2, 3, 'pablillocartaya43@gmail.com'),
	(3, 7, 'maritu99s@gmail.com'),
	(4, 1, 'franbetis2000@gmail.com'),
	(5, 8, 'rosavenenosa2014@gmail.com');	
	
INSERT INTO aficiones_preferidas (aficionesPreferidasID, aficionID, fichaID) VALUES
	(0, 9, 0),
	(1, 1, 2),
	(2, 8, 3),
	(3, 2, 4),
	(4, 3, 5),
	(5, 4, 3),
	(6, 7, 5);	
