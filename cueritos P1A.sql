#Primero seleccionar la base de datos en la que se va a trabajar
USE prueba;
/*
Para ver de donde salen nuestros datos, aca dejo el codigo  proporcionado para crear la tabla 
y los registros
1. Crear la tabla
CREATE TABLE personajes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    afiliacion VARCHAR(30),
    edad INT,
    fecha_nacimiento DATE,
    altura DECIMAL (4,2),
    peso DECIMAL (5,2),
    fuerza_sable INT
);

2. Ingresar los registros
INSERT INTO personajes (nombre, especie, afiliacion, edad, fecha_nacimiento, altura, peso,
fuerza_sable)
VALUES ('Luke Skywalker', 'Humano', 'Alianza Rebelde', 19, '1977-09-25', 1.72, 77.00, 8),
('Darth Vader', 'Humano', 'Imperio Galáctico', 45, '1977-01-01', 2.02, 120.00, 10),
('Yoda', 'Desconocida', 'Orden Jedi', 900, '0896-01-01', 0.66, 17.00, 10),
('Han Solo', 'Humano', 'Alianza Rebelde', 32, '1975-01-01', 1.85, 80.00, 6),
('Chewbacca', 'Wookiee', 'Alianza Rebelde', 200, '1900-01-01', 2.28, 120.00, 5),
('Leia Organa', 'Humano', 'Alianza Rebelde', 19, '1977-09-25', 1.50, 49.00, 7),
('Obi-Wan Kenobi', 'Humano', 'Orden Jedi', 57, '1957-01-01', 1.82, 75.00, 9),
('Anakin Skywalker', 'Humano', 'Orden Jedi', 22, '1977-01-01', 1.88, 84.00, 9),
('Padmé Amidala', 'Humano', 'República Galáctica', 27, '1977-01-01', 1.65, 55.00, 3),
('Qui-Gon Jinn', 'Humano', 'Orden Jedi', 60, '1957-01-01', 1.93, 88.00, 10),
('Mace Windu', 'Humano', 'Orden Jedi', 42, '1972-01-01', 1.92, 87.00, 10),
('Jar Jar Binks', 'Gungan', 'República Galáctica', 52, '1970-01-01', 1.96, 66.00, 1),
('R2-D2', 'Droide', 'Alianza Rebelde', 37, '1985-01-01', 1.09, 32.00, 0),
('C-3PO', 'Droide', 'Alianza Rebelde', 112, '1912-01-01', 1.67, 75.00, 0),
('Lando Calrissian', 'Humano', 'Alianza Rebelde', 35, '1977-01-01', 1.79, 79.00, 5),
('Boba Fett', 'Humano', 'Imperio Galáctico', 36, '1973-01-01', 1.83, 78.00, 7),
('Jabba el Hutt', 'Hutt', 'Cartel Hutt', 604, '1420-01-01', 3.90, 1358.00, 2),
('Greedo', 'Rodiano', 'Cartel Hutt', 44, '1977-01-01', 1.73, 85.00, 4),
('Palpatine', 'Humano', 'Imperio Galáctico', 87, '1937-01-01', 1.75, 68.00, 8),
('Jango Fett', 'Humano', 'Confederación de Sistemas Independientes', 42, '1980-01-01', 1.83,
79.00, 8);
*/

/*
En el codigo proporcionado para ingresar los registros a la tabla, hay un error en la fila 17,
el peso excede el rango de valor de la propiedad. Tambien en la fila 20, con la afilicion, excede
los caracteres, para solucionarlo hay que modificar estas propiedades
*/

#modificar los atributos para no tener errores con los registros
ALTER TABLE personajes
MODIFY COLUMN peso DECIMAL(6,2),
MODIFY COLUMN afiliacion VARCHAR(100);

#1. Seleccionar todos los registros de la tabla personajes
SELECT * FROM personajes;

#2. Seleccionar los personajes que pertenecen a la alianza rebelde
SELECT * FROM personajes WHERE afiliacion = 'Alianza Rebelde';

#3. Seleccionar los personajes cuya edad sea mayor a 100 años
SELECT * FROM personajes WHERE edad > 100;

#4. Seleccionar los personajes ordenados por altura descendente
SELECT * FROM personajes
ORDER BY altura DESC;

#5. Actualizar el nivel de fuerza con el sable de luz de Luke Skywalker a 9
/*
Para este proceso no deja actualizar cuando se especifica el nombre, esto por el modo borracho
Para solucionar primero se busca el registro por el nombre y se le saca el ID, por el ID
entonces si deja actualizarlo por ser un PRIMARY KEY. Este problema se repite varias ocaciones 
y la solucion es la misma
*/
SELECT * FROM personajes WHERE nombre = 'Luke Skywalker';
UPDATE personajes SET fuerza_sable = 9 WHERE id = 1;
SELECT fuerza_sable FROM personajes WHERE nombre = 'Luke Skywalker';

#6. Eliminar el registro de Darth Vader de la tabla
#Se repite la solucion del modo borracho
SELECT id FROM personajes WHERE nombre = 'Darth Vader';
DELETE FROM personajes WHERE id = 2;

#7. Insertar un nuevo personaje con los datos que elijan
INSERT INTO personajes (nombre, especie, afiliacion, edad, fecha_nacimiento, altura, peso, fuerza_sable)
VALUES ('Alejandro El PicaFLor', 'Humano', 'Ingenieros del mal', 19, '2005-03-10', 1.82, 75.00, 9);

#8. Seleccionar los personajes cuya especie sea "Humano" y su afiliación sea "Alianza Rebelde"
SELECT * FROM personajes WHERE especie = 'Humano' AND afiliacion = 'Alianza Rebelde';

#9. Contar el número de personajes de cada afiliación
SELECT afiliacion, COUNT(*) AS cantidad_personajes
FROM personajes
GROUP BY afiliacion;

#10. Calcular la suma de las edades de todos los personajes.
SELECT SUM(edad) AS suma_edades FROM personajes;

#11. Seleccionar los personajes que nacieron después del año 1970 
SELECT * FROM personajes WHERE YEAR(fecha_nacimiento) > 1970;

#12. Actualizar el peso de Jabba el Hutt a 1400 kg
SELECT id FROM personajes WHERE nombre = 'Jabba el Hutt';
UPDATE personajes SET peso = 1400 WHERE id = 17;



#13. Eliminar todos los personajes que pertenecen al "Cartel Hutt".
/*
aca no deja eliminar de esa manera, no pude usar la misma solucion anterior
Para solucionarlo desactive el modo borracho y luego lo active de nuevo con el siguiente query

SET SQL_SAFE_UPDATES = 0;

Para activarlo de nuevo se coloca como valor 1

SET SQL_SAFE_UPDATES = 1;
*/

SET SQL_SAFE_UPDATES = 0;

DELETE FROM personajes WHERE afiliacion = 'Cartel Hutt';

SET SQL_SAFE_UPDATES = 1;
#14. Seleccionar los personajes ordenados por fecha de nacimiento ascendente.
SELECT * FROM personajes 
ORDER BY fecha_nacimiento ASC; 

#15. Calcular el promedio de altura de los personajes de la especie "Humano"
SELECT AVG(altura) AS promedio_altura FROM personajes WHERE especie = 'Humano';

#16. Seleccionar los personajes cuyo nombre empiece con la letra "A".
SELECT * FROM personajes WHERE nombre LIKE 'A%';

#17. Contar el número de personajes de cada especie
SELECT especie, COUNT(*) AS cantidad_personajes
FROM personajes
GROUP BY especie;

#18. Actualizar la afiliación de Anakin Skywalker a "Imperio Galáctico"
#aca es el mismo del moodo borracho y se usa la primera solucion de buscar su ID 

SELECT id FROM personajes WHERE nombre = 'Anakin Skywalker';
UPDATE personajes SET afiliacion = 'Imperio Galáctico' WHERE id = 8;

#19. Eliminar todos los personajes cuya fuerza con el sable de luz sea menor a 5
/*
Acá está de nuevo el bendito modo borracho, pero hay otra solucion ya que puede ser tedioso
activar y desactivar este modo, para eso se puede hacer subconsultas dentro de una consulta.

Se usa una subconsulta interna esta subconsulta selecciona todos los id de los personajes cuya "fuerza_sable" sea menor a 5.

Luego está la subconsulta itermedia: Aquí, la subconsulta interna se envuelve en otra 
subconsulta. La razón de hacer esto es para evitar el error que MySQL arroja cuando intentamos
referenciar la misma tabla que estamos actualizando/eliminando en una subconsulta directa. 
Al darle un alias (temp), estamos creando una tabla temporal que MySQL puede procesar sin conflicto.

Luego la consulta principal: utilizamos la cláusula DELETE FROM para eliminar los registros en la tabla "personajes". La cláusula 
WHERE id IN (...) especifica que solo los registros cuyos id se encuentran en el resultado de 
la subconsulta intermedia serán eliminados.
*/
DELETE FROM personajes WHERE fuerza_sable < 5;
DELETE FROM personajes 
WHERE id IN (
    SELECT id FROM (
        SELECT id FROM personajes WHERE fuerza_sable < 5
    ) AS temp
);

#20. Seleccionar los personajes cuya edad esté entre 30 y 50 años, ordenados por peso descendente
SELECT * FROM personajes WHERE edad BETWEEN 30 AND 50 
ORDER BY peso DESC;
#between es necesario porque se trabaja dentro de un rango de valores y no como dos valores especificos
