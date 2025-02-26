# S2.02. MySQL queries

## Consultas SQL para Bases de Datos Universidad y Tienda

Colección de consultas SQL diseñadas para extraer información específica de dos bases de datos: Universidad y Tienda. Las consultas abarcan una amplia gama de operaciones, incluyendo:

* **Relaciones entre tablas:** Uso de LEFT JOIN y RIGHT JOIN para explorar y combinar datos de múltiples tablas.
* **Agregaciones:** Cálculos de COUNT() y otras funciones de agregación para resumir y analizar datos.
* **Filtrado y ordenamiento:** Cláusulas WHERE, GROUP BY, HAVING, ORDER BY y LIMIT para refinar y presentar los resultados de manera efectiva.
* **Manipulación de cadenas y fechas:** Funciones para trabajar con texto y fechas, como UPPER(), LOWER(), YEAR(), etc.

## Bases de Datos

### Tienda

* **Descripción:** Una base de datos simple que modela una tienda con productos y fabricantes.
* **Tablas:**
    * producto (codigo, nombre, precio, codigo_fabricante)
    * fabricante (codigo, nombre)
* **Relación:** producto.codigo_fabricante se relaciona con codigo de la entidad fabricante.

### Universidad

* **Descripción:** Una base de datos más compleja que modela una universidad con estudiantes, profesores, departamentos, grados y asignaturas.
* **Tablas:**
    * departamento
    * persona (alumnos y profesores)
    * profesor
    * grado
    * asignatura
    * curso_escolar
    * alumno_se_matricula_asignatura
* **Relaciones:** Diversas relaciones entre las tablas, incluyendo relaciones uno a muchos y muchos a muchos.

## Propósito de las Consultas

Las consultas en este repositorio tienen como objetivo:

* Extraer datos específicos de las tablas.
* Realizar cálculos y resúmenes de datos.
* Explorar y entender las relaciones entre las tablas.
* Resolver problemas comunes de extracción de datos en un entorno de universidad y tienda.

## Características

* Consultas diseñadas para demostrar el uso de diversas cláusulas y funciones SQL.
* Ejemplos de consultas que utilizan LEFT JOIN y RIGHT JOIN para explorar relaciones entre tablas.
* Consultas que muestran cómo realizar agregaciones de datos con COUNT() y SUM().
* Consultas para la manipulación de datos, como el formateo de datos, o la busqueda de datos concretos.
