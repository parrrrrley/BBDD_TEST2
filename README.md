# BBDD_TEST2
El objetivo de este archivo de SQL es demostrar la capacidad de trabajar las consultas en el entorno de DBeaver, haciendo uso específico de PostgreSQL.

---

Este proyecto consta de 64 preguntas acerca de una base de datos, (A partir de ahora BBDD) que busca medir el conocimientos en las siguientes herramientas:

- Manejo de la herramienta DBeaver.
- Archivo del esquema de la BBDD.
- Manejo de las consultas con una sola tabla de la - BBDD.
- Manejo de las relaciones entre tablas.
- Manejo de las subconsultas.
- Manejo de vistas.
- Manejo de estructuras de datos temporales.
- Buenas prácticas.
- Entendimiento del resultado de las consultas
Correcta entrega en GitHub

---

Para este proyecto estamos trabajando con el entorno **DBeaver versión 25.2.4** haciendo uso de **PostgreSQL Version 18**. El dataset fue entregado directamente por la escuela thePower e incluye tablas fundamentalmentales sobre una tienda de alquiler de peliculas.

---

# ¿Cómo trabajaremos este archivo?

Ya que sencillamente hay que responder las preguntas acerca de la BBDD y que eso ya se encuentra a detalle en el archivo "respuestas 2 a 64.sql", en este README nos limitaremos a enunciar las preguntas para que se puedan visualizar en paralelo (Los enunciados también estan ordenados dentro del archivo SQL)

---

# 64 consultas SQL

1. Crea el esquema de la BBDD.

Inciso, esta pregunta esta "respondida" dentro de este proyecto de GitHub como "1pregunta.png" y también como el nombre del arbol de relaciones.

2. Muestra los nombres de todas las películas con una clasificación por
edades de ‘R’.

3. Encuentra los nombres de los actores que tengan un “actor_id” entre 30
y 40.

4. Obtén las películas cuyo idioma coincide con el idioma original.

5. Ordena las películas por duración de forma ascendente.

6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su
apellido.

7. Encuentra la cantidad total de películas en cada clasificación de la tabla
“film” y muestra la clasificación junto con el recuento.

8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una
duración mayor a 3 horas en la tabla film.

9. Encuentra la variabilidad de lo que costaría reemplazar las películas.

10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC17’ ni ‘G’ en cuanto a su clasificación.

13. Encuentra el promedio de duración de las películas para cada
clasificación de la tabla film y muestra la clasificación junto con el
promedio de duración.

14. Encuentra el título de todas las películas que tengan una duración mayor
a 180 minutos.

15. ¿Cuánto dinero ha generado en total la empresa?

16. Muestra los 10 clientes con mayor valor de id.

17. Encuentra el nombre y apellido de los actores que aparecen en la
película con título ‘Egg Igby’.

18. Selecciona todos los nombres de las películas únicos.

19. Encuentra el título de las películas que son comedias y tienen una
duración mayor a 180 minutos en la tabla “film”.

20. Encuentra las categorías de películas que tienen un promedio de
duración superior a 110 minutos y muestra el nombre de la categoría
junto con el promedio de duración.

21. ¿Cuál es la media de duración del alquiler de las películas?

22. Crea una columna con el nombre y apellidos de todos los actores y
actrices.

23. Números de alquiler por día, ordenados por cantidad de alquiler de
forma descendente.

24. Encuentra las películas con una duración superior al promedio.

25. Averigua el número de alquileres registrados por mes.

26. Encuentra el promedio, la desviación estándar y varianza del total
pagado.

27. ¿Qué películas se alquilan por encima del precio medio?

28. Muestra el id de los actores que hayan participado en más de 40
películas.

29. Obtener todas las películas y, si están disponibles en el inventario,
mostrar la cantidad disponible.

30. Obtener los actores y el número de películas en las que ha actuado.

31. Obtener todas las películas y mostrar los actores que han actuado en
ellas, incluso si algunas películas no tienen actores asociados.

32. Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película.

33. Obtener todas las películas que tenemos y todos los registros de
alquiler.

34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

36. Renombra la columna “first_name” como Nombre y “last_name” como
Apellido.

37. Encuentra el ID del actor más bajo y más alto en la tabla actor.

38. Cuenta cuántos actores hay en la tabla “actor”.

39. Selecciona todos los actores y ordénalos por apellido en orden
ascendente.

40. Selecciona las primeras 5 películas de la tabla “film”.

41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el
mismo nombre. ¿Cuál es el nombre más repetido?

42. Encuentra todos los alquileres y los nombres de los clientes que los
realizaron.

43. Muestra todos los clientes y sus alquileres si existen, incluyendo
aquellos que no tienen alquileres.

44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor
esta consulta? ¿Por qué? Deja después de la consulta la contestación.

45. Encuentra los actores que han participado en películas de la categoría
'Action'.

46. Encuentra todos los actores que no han participado en películas.

47. Selecciona el nombre de los actores y la cantidad de películas en las
que han participado.

48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres
de los actores y el número de películas en las que han participado.

49. Calcula el número total de alquileres realizados por cada cliente.

50. Calcula la duración total de las películas en la categoría 'Action'.

51. Crea una tabla temporal llamada “cliente_rentas_temporal” para
almacenar el total de alquileres por cliente.

52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las
películas que han sido alquiladas al menos 10 veces.

53. Encuentra el título de las películas que han sido alquiladas por el cliente
con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena
los resultados alfabéticamente por título de película.

54. Encuentra los nombres de los actores que han actuado en al menos una
película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados
alfabéticamente por apellido.

55. Encuentra el nombre y apellido de los actores que han actuado en
películas que se alquilaron después de que la película ‘Spartacus
Cheaper’ se alquilara por primera vez. Ordena los resultados
alfabéticamente por apellido.

56. Encuentra el nombre y apellido de los actores que no han actuado en
ninguna película de la categoría ‘Music’.

57. Encuentra el título de todas las películas que fueron alquiladas por más
de 8 días.

58. Encuentra el título de todas las películas que son de la misma categoría
que ‘Animation’.

59. Encuentra los nombres de las películas que tienen la misma duración
que la película con el título ‘Dancing Fever’. Ordena los resultados
alfabéticamente por título de película.

60. Encuentra los nombres de los clientes que han alquilado al menos 7
películas distintas. Ordena los resultados alfabéticamente por apellido.

61. Encuentra la cantidad total de películas alquiladas por categoría y
muestra el nombre de la categoría junto con el recuento de alquileres.

62. Encuentra el número de películas por categoría estrenadas en 2006.

63. Obtén todas las combinaciones posibles de trabajadores con las tiendas
que tenemos.

64. Encuentra la cantidad total de películas alquiladas por cada cliente y
muestra el ID del cliente, su nombre y apellido junto con la cantidad de
películas alquiladas.

---

# Anotaciones:

Al ser un proyecto tan práctico, hay poco espacio dentro de este READme (sin hacerlo colosal), así que limitaré a hacer algunas comentarios acerca del proyecto y sus preguntas en general.

Se intento reutilizar las consultas lo más posible, el approach que tuve fue leer bien los enunciados, de manera que si existia la posibilidad de reutilzar un query lo hice.

Parece que las preguntas no tienen un patrol claro, y cambian de dificultad constantemente, pasando de consultas extremadamente sencillas a grandes vueltas lógicas.

Limité el uso de la IA lo más que pude. Aunque comprendo que es una herramienta más, se mantiene la postura de solidificar el conocimiento.

Se uso IA para un 10% de los ejercicios, especificamente:

- 11: Porque al construir la query me di cuenta que no sabia como condicionar cuando existen resultados muy parecidos, en este caso las fechas coincidian y no me permitian toamr el verdadero resultado antepenultimo (p.payment_id '9773') en este debati con la IA para deducir que habia que ordenar también por id para conseguir la más reciente (numero mas grande).

- 18: Porque el enunciado es extremadamente ambiguo, tomando en consideración el ejercicio 17, por lo cual debati con ChatGPT mi interpretación que fue: "Seleccionar las peliculas con un solo actor asociado".

- 23: Porque se cubrió poco contenido del tipo de data DATE por ende necesite apoyo para usar las funciones de dicho tipo de data.

- 53: Efecto enunciado, entendible de hacer un mapa mental de como abordarlo pero mas engorroso de escribir.

- 55: Igual que el 53, aunque este ejercicio era mas complejo (probablemente el mas dificild de todos)

Como nota final, cabe destacar que cuando se trabajó con IA los promots siempre fueron: "Respondeme o pregunta solo con logica, no escribas SQL" Para poder hacer inferencias y pseudocodigo, de manera que el ejercicio mecanico de hacer la query y usar las funciones solo con la información logica hiciera el trabajo igualmente de enriquecedor.
