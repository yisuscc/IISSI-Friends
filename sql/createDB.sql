  -- El autor es Alvaro Caño Soto con correcciones y modificaciones  de jesús carrascosa 
DROP DATABASE IF EXISTS IISSI_Friends;
CREATE DATABASE IF NOT EXISTS IISSI_Friends;
USE IISSI_Friends;
DROP TABLE if EXISTS usuarios;
DROP TABLE if EXISTS fotos;
DROP TABLE if EXISTS ubicaciones;
DROP TABLE if EXISTS fichasDePreferencias;
DROP TABLE if EXISTS conversaciones;
DROP TABLE if EXISTS mensajes;
DROP TABLE if EXISTS vinculos_amistades;
DROP TABLE if EXISTS aficiones;
DROP TABLE if EXISTS aficiones_usuarios;
DROP TABLE if EXISTS aficiones_preferidas;

CREATE TABLE if NOT EXISTS  usuarios(
usuarioID  INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
nombre VARCHAR(50) NOT NULL,
fechaNacimiento DATE NOT NULL,
estatura INTEGER  DEFAULT(170) NOT NULL,
peso INTEGER  DEFAULT(75) NOT NULL,
genero  ENUM ('masculino','femenino','otros') NOT NULL, 
email  VARCHAR(250) NOT NULL ,
password VARCHAR(250) NOT NULL,
fechaAlta DATE DEFAULT(CURDATE()) NOT NULL,
fechaBaja DATE,
estaActivo BOOLEAN DEFAULT TRUE NOT NULL,  -- solo la pongo por el silence
colorPelo   ENUM ('negro','castaño','rubio','rojo','blanco','gris')DEFAULT ('Negro'),
colorOjo  ENUM ('negro','castaños','azules','verdes','grises' ) NOT NULL,

PRIMARY KEY (email),
CONSTRAINT estaturaNegativa CHECK (estatura >0),
CONSTRAINT pesoNegativo CHECK (peso >0),
CONSTRAINT fechaNoCoherente1 CHECK (fechaNacimiento<fechaAlta),
CONSTRAINT fechaNoCoherente2 CHECK (fechaAlta<fechaBaja),
CONSTRAINT usuarioMenorDeEdad CHECK (TIMESTAMPDIFF(YEAR, fechaNacimiento, fechaAlta)>= 18)
);

CREATE TABLE if NOT EXISTS  fotos(
fotoID  INT(11) NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
url VARCHAR(250) NOT NULL,
email  VARCHAR(250) NOT NULL,
descripcion VARCHAR(500) NOT NULL,
fecha DATE  DEFAULT(CURDATE()),
PRIMARY KEY (fotoID),
FOREIGN KEY(email) REFERENCES usuarios(email)
);

CREATE TABLE if NOT EXISTS  ubicaciones(
ubicacionID  INT(11) NOT NULL AUTO_INCREMENT,
email  VARCHAR(250) NOT NULL,
codigoPostal INT(5) NOT NULL,
municipio VARCHAR(20) NOT NULL,
provincia VARCHAR(20) NOT NULL,
PRIMARY KEY (ubicacionID),
FOREIGN KEY(email) REFERENCES usuarios(email)
);

CREATE TABLE if NOT EXISTS  fichasDePreferencias(
fichaID  INT(11) NOT NULL AUTO_INCREMENT,
edad_maxima INTEGER DEFAULT 110 NOT NULL,
edad_minima INTEGER DEFAULT 18 NOT NULL,
codigoPostal INT(5),
municipio VARCHAR(20),
provincia VARCHAR(20),
estatura_maxima INTEGER DEFAULT 230 NOT NULL,
estatura_minima INTEGER DEFAULT 130 NOT NULL,
peso_maximo INTEGER DEFAULT 350 NOT NULL,
peso_minimo INTEGER DEFAULT 40 NOT NULL,
email  VARCHAR(250) NOT NULL,
colorPelo ENUM ('negro','castaño','rubio','rojo','blanco','gris')NOT NULL,
colorOjo ENUM ('negro','castaños','azules','verdes','grises' ) NOT NULL,
genero ENUM ('masculino','femenino','otros') NOT NULL,
PRIMARY KEY (fichaID),
FOREIGN KEY(email) REFERENCES usuarios(email),
CONSTRAINT edadNegativa CHECK(edad_maxima >0 AND edad_minima >0),
CONSTRAINT estaturaNegativa CHECK (estatura_maxima >0 AND estatura_minima >0 ),
CONSTRAINT estaturaRango CHECK (estatura_maxima >estatura_minima),
CONSTRAINT pesoNegativo CHECK (peso_maximo >0 AND peso_minimo > 0),
CONSTRAINT pesoRango CHECK (peso_maximo >peso_minimo),
CONSTRAINT fechaRango CHECK (edad_minima<edad_maxima)
);



CREATE TABLE if NOT EXISTS  vinculos_amistades(
vinculoID  INT(11) NOT NULL AUTO_INCREMENT,
email1  VARCHAR(250) NOT NULL ,
email2  VARCHAR(250) NOT NULL ,
fecha_solicitud DATE NOT NULL  default CURDATE(),
fecha_aceptación DATE,
fecha_revocacion_solicitud DATE,
fecha_revocacion_aceptación DATE,
VinculoActivo BOOLEAN NOT NULL DEFAULT false,
PRIMARY KEY (vinculoID),
UNIQUE(email1,email2,fecha_solicitud),
FOREIGN KEY(email1) REFERENCES usuarios(email),
FOREIGN KEY(email2) REFERENCES usuarios(email),
CONSTRAINT fechaRango1 CHECK (fecha_solicitud<fecha_aceptación),
CONSTRAINT fechaRango2 CHECK (fecha_solicitud<fecha_revocacion_solicitud),
CONSTRAINT fechaRango3 CHECK (fecha_aceptación<fecha_revocacion_aceptación)
);
CREATE TABLE if NOT EXISTS  conversaciones(
conversacionID  INT(11) NOT NULL AUTO_INCREMENT,
vinculoID  INT(11) NOT NULL,
fecha_inicio DATE NOT NULL DEFAULT CURDATE(),
fecha_fin DATE ,
new_message BOOLEAN NOT NULL DEFAULT TRUE ,
PRIMARY KEY (conversacionID),
FOREIGN KEY(vinculoID) REFERENCES vinculos_amistades(vinculoID),
CONSTRAINT fechaNoCoherente2 CHECK (fecha_inicio<fecha_fin)

);
CREATE TABLE if NOT EXISTS  mensajes(
mensajeID  INT(11) NOT NULL AUTO_INCREMENT,
conversacionID  INT(11) NOT NULL,
instante DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
texto VARCHAR(500) NOT NULL,
PRIMARY KEY (mensajeID),
FOREIGN KEY(conversacionID) REFERENCES conversaciones(conversacionID)
);


CREATE TABLE if NOT EXISTS aficiones (
aficionID  INT(11) NOT NULL AUTO_INCREMENT,
aficion  VARCHAR(20) NOT NULL UNIQUE,
PRIMARY KEY (aficionID)
);

CREATE TABLE if NOT EXISTS  aficiones_usuarios(
aficionesUsuarioID  INT(11) NOT NULL AUTO_INCREMENT,
aficionID  INT(11) NOT NULL ,
email  VARCHAR(250) NOT NULL,
PRIMARY KEY (aficionesUsuarioID),
UNIQUE(aficionID, email),
FOREIGN KEY(aficionID) REFERENCES aficiones(aficionID),
FOREIGN KEY(email) REFERENCES usuarios(email)
);

CREATE TABLE if NOT EXISTS  aficiones_preferidas(
aficionesPreferidasID  INT(11) NOT NULL AUTO_INCREMENT,
aficionID  INT(11) NOT NULL,
fichaID  INT(11) NOT NULL ,
PRIMARY KEY (aficionesPreferidasID),
UNIQUE(aficionID, fichaID),
FOREIGN KEY(aficionID) REFERENCES aficiones(aficionID),
FOREIGN KEY(fichaID) REFERENCES fichasDePreferencias(fichaID)
);

