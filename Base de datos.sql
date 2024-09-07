-- Creacion y uso de base de datos;

CREATE DATABASE evidencia4;
USE evidencia4;

-- Creación de tablas y restricciones;

CREATE TABLE paciente (
dni INT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
domicilio VARCHAR(45),
telefono INT NOT NULL,
email VARCHAR(45),
historia_clinica INT AUTO_INCREMENT NOT NULL UNIQUE);

CREATE TABLE maquina_dialisis(
id_maquina INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(20) NOT NULL,
fabricante VARCHAR(20) NOT NULL,
funcionando BOOL);

CREATE TABLE tratamiento(
id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
dni INT,
id_maquina INT,
CONSTRAINT fk_dni FOREIGN KEY (dni)
REFERENCES paciente(dni),
CONSTRAINT fk_id_maquina FOREIGN KEY (id_maquina)
REFERENCES maquina_dialisis(id_maquina));

-- Se realiza una modificación del tipo de dato de telefono, ya que no permitía los valores;

ALTER TABLE paciente MODIFY telefono INT UNSIGNED;

-- Sentencias INSERT;

INSERT INTO paciente (
dni, nombre, apellido, domicilio, telefono, email)
VALUES (32832214, 'Laura', 'Benitez', 'Tokio 717', 3513434343, 'laurabenitez@mail.com'),
(32495239, 'Jorge', 'Marchisone', 'Seul 1707', 3515252525, 'jorgemarchisone@mail.com'),
(52890890, 'Daniela', 'Zalazar', 'Madrid 531', 3519191919, 'danielazalazar@mail.com'),
(37294917, 'Antonio', 'Armando', 'Pekin 426', 3516868686, 'antonioarmando@mail.com'),
(28648392, 'German', 'Benitez', 'Buenos Aires 337', 3512727272, 'germanbenitez@mail.com');

INSERT INTO maquina_dialisis (modelo, fabricante, funcionando)
VALUES ("DBB-05", "NIKKISUS", 1),
("4008S", "FRESENIUS", 1),
("AK98", "GAMBRO", 0),
("Innova", "HOSPAL", 1),
("JL07", "MINI", 0);

INSERT INTO tratamiento (dni, id_maquina)
VALUES (32495239, 1),
(32832214, 2),
(37294917, 4),
(28648392, 1),
(32495239, 2),
(52890890, 4);

-- Sentencias SELECT;

SELECT * FROM paciente;

SELECT nombre, apellido FROM paciente 
WHERE apellido = 'Benitez';

SELECT modelo FROM maquina_dialisis
WHERE modelo LIKE 'I%';

SELECT dni, nombre, apellido, telefono FROM paciente
ORDER BY historia_clinica;

SELECT historia_clinica, nombre, apellido, email FROM paciente
WHERE historia_clinica = 7;

SELECT nombre, apellido, historia_clinica, modelo, fabricante  FROM paciente, maquina_dialisis, tratamiento
WHERE tratamiento.dni = paciente.dni AND tratamiento.id_maquina = maquina_dialisis.id_maquina;
