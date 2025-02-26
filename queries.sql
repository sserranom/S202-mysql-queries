USE tienda;
-- BD TIENDA
-- 1
SELECT nombre FROM producto;

-- 2
SELECT nombre, precio FROM producto;

-- 3
SELECT *FROM producto;

-- 4
SELECT nombre, ROUND(precio, 2) AS precio_EUROS, ROUND(precio * 1.05, 2) AS precio_USD FROM producto;

-- 5
SELECT nombre AS 'Nombre de producto',  ROUND(precio, 2) AS Euros, ROUND(precio * 1.05, 2) AS Dolares FROM producto;
 
-- 6
SELECT UPPER(nombre) AS 'NOMBRE DEL PRODUCTO', precio FROM producto;

-- 7
SELECT LOWER(nombre) AS 'nombre del producto', precio FROM producto;

-- 8
SELECT nombre AS NOMBRE, UPPER(SUBSTRING(nombre, 1, 2)) AS SIGLAS FROM fabricante;

-- 9
SELECT nombre AS 'NOMBRE DE PRODUCTO', ROUND(precio) AS 'PRECIO REDONDEADO', precio FROM producto;

-- 10
SELECT nombre AS 'NOMBRE DE PRODUCTO', TRUNCATE(precio, 0) AS 'PRECIO SIN DECIMALES' FROM producto;

-- 11
SELECT  f.codigo AS 'CODIGO de fabricante' FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 12
SELECT DISTINCT f.codigo AS 'CODIGO DE FABRICANTE' FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16
SELECT *FROM fabricante LIMIT 5;

-- 17
SELECT *FROM fabricante LIMIT 2 OFFSET 3;

-- 18
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20
SELECT nombre FROM fabricante WHERE codigo=2;

-- 21
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICATE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;

-- 23
SELECT p.codigo AS 'CODIGO PRODUCTO', p.nombre AS 'NOMBRE PRODUCTO', p.codigo_fabricante AS 'CODIGO FABRICANTE', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);

-- 25
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);

-- 26 
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

-- 27
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 29
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'NOMBRE FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30
SELECT p.nombre AS 'NOMBRE PODUCTO', p.precio AS 'PRECIO PRODUCTO' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

-- 31
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%W%';

-- 32
SELECT p.nombre AS 'NOMBRE PRODUCTO', p.precio AS 'PRECIO PRODUCTO', f.nombre AS 'FABRICANTE' FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 33
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 34
SELECT f.nombre AS FABRICANTE, p.nombre AS PRODUCTO FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 36
SELECT nombre, precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37
SELECT *FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 38
SELECT p.nombre AS PRODUCTO, p.precio AS PRECIO FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;

-- 39
SELECT p.nombre AS PRODUCTO, p.precio AS PRECIO FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

-- 40
SELECT *FROM producto WHERE precio >= (SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 41
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p2.precio) FROM producto p2 INNER JOIN fabricante f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Asus');

-- BASE DE DATOS UNIVERSIDAD
USE universidad;

-- 1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo ='alumno' AND telefono IS NULL;

-- 3
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND SUBSTRING(fecha_nacimiento, 1, 4) = '1999';

-- 4
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo ='profesor' AND telefono IS NULL;

-- 5
SELECT a.nombre AS 'NOMBRE ASIGNATURA' FROM asignatura a INNER JOIN grado g ON a.id_grado = g.id WHERE g.id = 7 AND a.curso = 3 AND a.cuatrimestre = 1; 

-- 6
SELECT p.apellido1 AS 'PRIMER APELLIDO', p.apellido2  AS 'SEGUNDO APELLIDO', p.nombre AS NOMBRE, d.nombre AS DEPARTAMENTO FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor INNER JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC; 

-- 7
SELECT a.nombre AS ASIGNATURAS, ce.anyo_inicio AS 'AÑO DE INICIO', ce.anyo_fin AS 'AÑO FIN' FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN asignatura a ON asma.id_asignatura = a.id INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE p.nif = '26902806M'; 

-- 8
SELECT DISTINCT d.nombre AS 'NOMBRE DEPARTAMENTO' FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento INNER JOIN asignatura a ON p.id_profesor = a.id_profesor INNER JOIN grado g ON a.id_grado = g.id INNER JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'; 
  
-- 9
SELECT DISTINCT p.nombre AS 'NOMBRE ALUMNO', p.apellido1 AS 'PRIMER APELLIDO', p.apellido2 AS 'SEGUNDO APELLIDO' FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = '2018' AND anyo_fin = '2019';

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1
SELECT d.nombre AS 'NOMBRE DEPARTAMENTO', p.apellido1 AS 'PRIMER APELLIDO', p.apellido2 AS 'SEGUNDO APELLIDO', p.nombre AS 'NOMBRE PROFESOR' FROM profesor pr RIGHT JOIN persona p ON pr.id_profesor = p.id LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 2
SELECT p.nombre, p.apellido1, p.apellido2  FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;

-- 3
SELECT d.nombre AS 'NOMBRE DEPARTAMENTO' FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;

-- 4
SELECT p.nombre AS NOMBRE, p.apellido1 AS 'PRIMER APELLIDO', p.apellido2 AS 'SEGUNDO APELLIDO' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;

-- 5
SELECT nombre from asignatura WHERE id_profesor IS NULL; 
SELECT a.nombre FROM profesor pr RIGHT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_profesor IS NULL;

-- 6
SELECT d.nombre AS DEPARTAMENTO FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura ama ON a.id = ama.id_asignatura WHERE ama.id_asignatura IS NULL AND a.id IS NULL AND p.id_profesor IS NULL;

-- Consultas resumen:
-- 1
SELECT COUNT(*) AS 'TOTAL ALUMNOS' FROM persona WHERE tipo = 'alumno';

-- 2
SELECT COUNT(*) AS 'TOTAL ALUMNOS NACIDOS EN 1999' FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3
SELECT d.nombre AS DEPARTAMENTO, COUNT(pr.id_profesor) AS NUMERO_DE_PROFESORES FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NOT NULL GROUP BY d.nombre ORDER BY NUMERO_DE_PROFESORES DESC;

-- 4
SELECT d.nombre AS 'NOMBRE DEPARTAMENTO', COUNT(pr.id_profesor) AS NUMERO_PROFESORES FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;

-- 5
SELECT g.nombre AS GRADO, COUNT(a.id_grado) AS TOTAL_ASIGNATURAS from grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY TOTAL_ASIGNATURAS DESC;

-- 6
SELECT g.nombre AS GRADO, COUNT(a.id) AS TOTAL_ASIGNATURAS FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40;

-- 7
SELECT g.nombre AS GRADO, a.tipo AS TIPO_ASIGNATURA, SUM(a.creditos) AS TOTAL_CREDITOS FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo;

-- 8
SELECT ce.anyo_inicio AS AÑO_INICIO, COUNT(DISTINCT asma.id_alumno) AS TOTAL_MATRICULADOS FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio;

-- 9
SELECT p.id AS ID, p.nombre AS NOMBRE, p.apellido1 AS PRIMER_APELLIDO, p.apellido2 AS SEGUNDO_APELLIDO, COUNT(a.id) AS NUMERO_ASIGNATURAS FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY NUMERO_ASIGNATURAS DESC;

-- 10
SELECT *FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;

-- 11
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NOT NULL AND a.id IS NULL;





