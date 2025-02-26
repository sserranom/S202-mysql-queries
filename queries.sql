USE tienda;
-- BD TIENDA
-- 1. Lista el nombre de todos los productos que hay en la mesa producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la mesa producto.
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT *FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, ROUND(precio, 2) AS precio_EUROS, ROUND(precio * 1.05, 2) AS precio_USD FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS 'Nombre de producto',  ROUND(precio, 2) AS Euros, ROUND(precio * 1.05, 2) AS Dolares FROM producto;
 
-- 6. Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS 'NOMBRE DEL PRODUCTO', precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS 'nombre del producto', precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante
SELECT nombre AS NOMBRE, UPPER(SUBSTRING(nombre, 1, 2)) AS SIGLAS FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la mesa producto, redondeando el valor del precio.
SELECT nombre AS 'NOMBRE DE PRODUCTO', ROUND(precio) AS 'PRECIO REDONDEADO', precio FROM producto;

-- 10. Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre AS 'NOMBRE DE PRODUCTO', TRUNCATE(precio, 0) AS 'PRECIO SIN DECIMALES' FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la mesa producto.
SELECT  f.codigo AS 'CODIGO de fabricante' FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 12. Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT f.codigo AS 'CODIGO DE FABRICANTE' FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la mesa fabricante.
SELECT *FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT *FROM fabricante LIMIT 2 OFFSET 3;

-- 18. Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA : Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM fabricante WHERE codigo=2;

-- 21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICATE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;

-- 23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.codigo AS 'CODIGO PRODUCTO', p.nombre AS 'NOMBRE PRODUCTO', p.codigo_fabricante AS 'CODIGO FABRICANTE', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);

-- 25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);

-- 26. Devuelve una lista de todos los productos del fabricante Lenovo. 
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

-- 27 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 29 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT p.nombre AS 'NOMBRE PODUCTO', p.precio AS 'PRECIO PRODUCTO' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

-- 31 Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%W%';

-- 32 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 33 Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 34 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre AS FABRICANTE, p.nombre AS PRODUCTO FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35 Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 36 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT nombre, precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT *FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 38 Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre AS PRODUCTO, p.precio AS PRECIO FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;

-- 39 Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre AS PRODUCTO, p.precio AS PRECIO FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

-- 40 Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT *FROM producto WHERE precio >= (SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 50 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p2.precio) FROM producto p2 INNER JOIN fabricante f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Asus');

-- BASE DE DATOS UNIVERSIDAD
USE universidad;

-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 2. Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo ='alumno' AND telefono IS NULL;

-- 3 Devuelve el listado de los alumnos que nacieron en 1999.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND SUBSTRING(fecha_nacimiento, 1, 4) = '1999';

-- 4. Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo ='profesor' AND telefono IS NULL;

-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT a.nombre AS 'NOMBRE ASIGNATURA' FROM asignatura a INNER JOIN grado g ON a.id_grado = g.id WHERE g.id = 7 AND a.curso = 3 AND a.cuatrimestre = 1; 

-- 6. Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT p.apellido1 AS 'PRIMER APELLIDO', p.apellido2  AS 'SEGUNDO APELLIDO', p.nombre AS NOMBRE, d.nombre AS DEPARTAMENTO FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor INNER JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC; 

-- 7. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT a.nombre AS ASIGNATURAS, ce.anyo_inicio AS 'AÑO DE INICIO', ce.anyo_fin AS 'AÑO FIN' FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN asignatura a ON asma.id_asignatura = a.id INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE p.nif = '26902806M'; 

-- 8. Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT d.nombre AS 'NOMBRE DEPARTAMENTO' FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento INNER JOIN asignatura a ON p.id_profesor = a.id_profesor INNER JOIN grado g ON a.id_grado = g.id INNER JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'; 
  
-- 9. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT p.nombre AS 'NOMBRE ALUMNO', p.apellido1 AS 'PRIMER APELLIDO', p.apellido2 AS 'SEGUNDO APELLIDO' FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = '2018' AND anyo_fin = '2019';

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT d.nombre AS 'NOMBRE DEPARTAMENTO', p.apellido1 AS 'PRIMER APELLIDO', p.apellido2 AS 'SEGUNDO APELLIDO', p.nombre AS 'NOMBRE PROFESOR' FROM profesor pr RIGHT JOIN persona p ON pr.id_profesor = p.id LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 2. Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT p.nombre, p.apellido1, p.apellido2  FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados. 
SELECT d.nombre AS 'NOMBRE DEPARTAMENTO' FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;

-- 4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT p.nombre AS NOMBRE, p.apellido1 AS 'PRIMER APELLIDO', p.apellido2 AS 'SEGUNDO APELLIDO' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;

-- 5 . Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT nombre from asignatura WHERE id_profesor IS NULL; 
SELECT a.nombre FROM profesor pr RIGHT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_profesor IS NULL;

-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.nombre AS DEPARTAMENTO FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura ama ON a.id = ama.id_asignatura WHERE ama.id_asignatura IS NULL AND a.id IS NULL AND p.id_profesor IS NULL;

-- Consultas resumen:
-- 1. Devuelve el número total de alumnos existentes.
SELECT COUNT(*) AS 'TOTAL ALUMNOS' FROM persona WHERE tipo = 'alumno';

-- 2. Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) AS 'TOTAL ALUMNOS NACIDOS EN 1999' FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3. Calcula cuántos profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.
SELECT d.nombre AS DEPARTAMENTO, COUNT(pr.id_profesor) AS NUMERO_DE_PROFESORES FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NOT NULL GROUP BY d.nombre ORDER BY NUMERO_DE_PROFESORES DESC;

-- 4. Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también deben aparecer en el listado. 
SELECT d.nombre AS 'NOMBRE DEPARTAMENTO', COUNT(pr.id_profesor) AS NUMERO_PROFESORES FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;

-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre AS GRADO, COUNT(a.id_grado) AS TOTAL_ASIGNATURAS from grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY TOTAL_ASIGNATURAS DESC;

-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas
SELECT g.nombre AS GRADO, COUNT(a.id) AS TOTAL_ASIGNATURAS FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40;

-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
SELECT g.nombre AS GRADO, a.tipo AS TIPO_ASIGNATURA, SUM(a.creditos) AS TOTAL_CREDITOS FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo;

-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT ce.anyo_inicio AS AÑO_INICIO, COUNT(DISTINCT asma.id_alumno) AS TOTAL_MATRICULADOS FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio;

-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT p.id AS ID, p.nombre AS NOMBRE, p.apellido1 AS PRIMER_APELLIDO, p.apellido2 AS SEGUNDO_APELLIDO, COUNT(a.id) AS NUMERO_ASIGNATURAS FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY NUMERO_ASIGNATURAS DESC;

-- 10. Devuelve todos los datos del alumno/a más joven.
SELECT *FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;

-- 11. Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NOT NULL AND a.id IS NULL;





