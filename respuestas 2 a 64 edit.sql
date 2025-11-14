--2. Muestra los nombres de todas las películas con una clasificación por edades de ‘R’.
select f.title as Nombre_Pelicula, f.rating as Rating
from film f 
where f.rating = 'R';

--3. Encuentra los nombres de los actores que tengan un “actor_id” entre 30 y 40.
select a.actor_id, concat(a.first_name, ' ', a.last_name) as nombre_actor
from actor a 
where a.actor_id between 30 and 40;

--4. Obtén las películas cuyo idioma coincide con el idioma original.
select f.title as Nombre_pelicula, l."name" as lenguaje
from film f 
join "language" l on f.language_id = l.language_id;

--5. Ordena las películas por duración de forma ascendente.
select f.title as Nombre_pelicula, f.length as duracion
from film f 
order by f.length asc;

--6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su apellido.
select a.first_name as nombre, a.last_name as apellido
from actor a 
where a.last_name = 'ALLEN';

--7. Encuentra la cantidad total de películas en cada clasificación de la tabla “film” y muestra la clasificación junto con el recuento.
select count(f.title ) as cantidad_peliculas, f.rating 
from film f 
group by f.rating ;

--8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una duración mayor a 3 horas en la tabla film.
select f.title, f.rating, f.length 
from film f 
where f.rating = 'PG-13' or f.length >= '180';

--9. Encuentra la variabilidad de lo que costaría reemplazar las películas.
select round(variance(f.replacement_cost), 2) as varianza_reemplazo
from film f;

--10. Encuentra la mayor y menor duración de una película de nuestra BBDD.
select f.length 
from film f 
order by f.length 
limit 1
--
select f.length
from film f 
order by f.length desc
limit 1;

--11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
select p.amount, p.payment_date 
from payment p 
order by p.payment_date desc, p.payment_id desc
limit 1 offset 2;

--12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC17’ ni ‘G’ en cuanto a su clasificación.
select f.title, f.rating
from film f 
where f.rating != 'G' and f.rating != 'NC-17';

--13. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
select round(avg(f.length), 2) as duracion_promedio, f.rating 
from film f 
group by f.rating;

--14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
select f.title, f.length 
from film f 
where f.length > '180'
order by f.length;

--15. ¿Cuánto dinero ha generado en total la empresa?
select sum(p.amount) as total_revenue
from payment p;

--16. Muestra los 10 clientes con mayor valor de id.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as nombrecliente
from customer c 
order by c.customer_id desc
limit 10;

--17. Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’
select concat(a.first_name, ' ', a.last_name) as actor_name, f.title 
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id 
left join film f on fa.film_id = f.film_id 
where f.title = 'EGG IGBY';

--18. Selecciona todos los nombres de las películas únicos.
select f.title, f.description 
from film_actor fa 
left join film f on fa.film_id = f.film_id 
group by f.film_id 
having count(fa.actor_id) = 1;

--19. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “film”.
select f.title, c."name", f.length 
from film f 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where c."name" = 'Comedy' and f.length >= '180';

--20. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.
select round(avg(f.length), 2) as duracion_promedio, c."name", f.title 
from film f 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where f.length > '110'
group by f.title, c."name" 
order by duracion_promedio;

--21. ¿Cuál es la media de duración del alquiler de las películas?
select avg(extract(day from r.return_date - r.rental_date)) as alquiler_promedio_dias
from rental r 
order by alquiler_promedio_dias;

--22. Crea una columna con el nombre y apellidos de todos los actores y actrices.
select concat(a.first_name, ' ', a.last_name) as Nombre_Completo
from actor a 
order by nombre_completo;

--23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.
select r.rental_date::date as fecha_agrupable, count(*) as alquileres_por_dia
from rental r 
group by r.rental_date::date
order by alquileres_por_dia desc;

--24. Encuentra las películas con una duración superior al promedio.
select f.title, f.length 
from film f 
where f.length > (
	select avg(f2.length)
	from film f2 
);

--25. Averigua el número de alquileres registrados por mes.
select date_trunc('month', r.rental_date) as fecha_agrupable, count(*) as alquileres_por_mes
from rental r 
group by date_trunc('month', r.rental_date)
order by alquileres_por_mes desc;

--26. Encuentra el promedio, la desviación estándar y varianza del total pagado.
select avg(p.amount) as promedio 
from payment p
--
select variance(p.amount) as varianza
from payment p
--
select stddev(p.amount) as desviacion_estandar
from payment p;

--27. ¿Qué películas se alquilan por encima del precio medio?
select f.title, p.amount 
from payment p 
left join rental r on p.rental_id = r.rental_id 
left join inventory i on r.inventory_id = i.inventory_id 
left join film f on i.film_id = f.film_id 
where p.amount > (
	select avg(p2.amount)
	from payment p2 
	)
order by p.amount;

--28. Muestra el id de los actores que hayan participado en más de 40 películas.
select count(fa.film_id) as peliculas_aparece, fa.actor_id 
from film_actor fa 
group by fa.actor_id
having count(fa.film_id) >= 40
order by fa.actor_id;

--29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.
select f.title, count(i.inventory_id) as copiasDisponibles
from film f 
left join inventory i on f.film_id = i.film_id 
where i.inventory_id not in (
	select r.inventory_id 
	from rental r 
	where r.return_date is null
)
group by f.title
order by copiasdisponibles desc;

--30. Obtener los actores y el número de películas en las que ha actuado.
select count(fa.film_id) as peliculas_aparece, concat(a.first_name, ' ', a.last_name) as nombre_actor, fa.actor_id 
from film_actor fa 
left join actor a on fa.actor_id = a.actor_id 
group by fa.actor_id, nombre_actor;

--31. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.
select f.title, concat(a.first_name, ' ', a.last_name) as nombreactor
from film f 
left join film_actor fa on f.film_id = fa.film_id 
left join actor a on fa.actor_id = a.actor_id 
group by nombreactor, f.title 
order by f.title
--ej pelicula sin actor asociado "drumline cyclone"

--32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.
select concat(a.first_name, ' ', a.last_name) as nombreactor, f.title 
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id 
left join film f on fa.film_id = f.film_id 
group by nombreactor, f.title 
order by nombreactor;

--33. Obtener todas las películas que tenemos y todos los registros de alquiler.
select f.title as nombrepelicula, r.rental_id 
from film f 
join inventory i on f.film_id = i.film_id 
join rental r on i.inventory_id = r.inventory_id 
group by nombrepelicula, r.rental_id
order by nombrepelicula asc;

--34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
select p.customer_id, sum(p.amount) as gasto_total
from payment p 
group by p.customer_id 
order by gasto_total desc
limit 6;

--35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.
select a.first_name as nombre, a.last_name as apellido 
from actor a 
where a.first_name = 'JOHNNY';

--36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido.
select a.first_name as Nombre, a.last_name as Apellido 
from actor a;

--37.Encuentra el ID del actor más bajo y más alto en la tabla actor. EDIT: Supongo que quiso decir nombre con el Id mas alto y bajo en la tabla actor, asi que es lo que hice.
select a.first_name as Nombre, a.last_name as  Apellido, a.actor_id 
from actor a 
order by a.actor_id desc
limit 1
--
select a.first_name as Nombre, a.last_name as  Apellido, a.actor_id 
from actor a 
order by a.actor_id asc
limit 1;

--38. Cuenta cuántos actores hay en la tabla “actor”.
select count(a.actor_id) as total_actores
from actor a;

--39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.
select a.first_name as nombre, a.last_name as apellido
from actor a 
order by apellido asc;

--40. Selecciona las primeras 5 películas de la tabla “film”.
select f.title
from film f 
limit 5;

--41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?
select count(a.first_name) as nombre_repetido, a.first_name 
from actor a 
group by a.first_name
order by nombre_repetido desc 
limit 3;

--42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
select r.rental_id, concat(c.first_name, ' ', c.last_name) as nombrecliente
from rental r 
left join customer c on r.customer_id = c.customer_id 
group by r.rental_id, nombrecliente 
order by nombrecliente asc;

--43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.
select concat(c.first_name, ' ', c.last_name) as nombrecliente, r.rental_id, r.rental_date, r.return_date
from customer c 
left join rental r on c.customer_id = r.customer_id;

--44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.
select *
from film f 
cross join category c;
--no aporta mucho valor, ya que el crossjoin solo combina cada c.category_id, c.name y c.last_update con cada fila de la tabla film, de paso, estas tablas no estan vinculadas directamente,
--asi que puede que la informacion que refleje no sea adecuada tampoco.

--45. Encuentra los actores que han participado en películas de la categoría 'Action'.
select concat(a.first_name, ' ', a.last_name) as nombreCompleto, a.actor_id, c."name" 
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id 
left join film f on fa.film_id = f.film_id 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where c."name" = 'Action';

--46. Encuentra todos los actores que no han participado en películas.
select *
from film_actor fa 
where fa.film_id is null;

--47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.
select count(fa.film_id) as peliculas_aparece, concat(a.first_name, ' ', a.last_name) as nombre_actor 
from film_actor fa 
left join actor a on fa.actor_id = a.actor_id 
group by nombre_actor;

--48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los actores y el número de películas en las que han participado.
create view actor_num_peliculas as (
	select count(fa.film_id) as peliculas_aparece, concat(a.first_name, ' ', a.last_name) as nombre_actor 
from film_actor fa 
left join actor a on fa.actor_id = a.actor_id 
group by nombre_actor 
)
select *
from actor_num_peliculas anp;

--49. Calcula el número total de alquileres realizados por cada cliente.
select concat(c.first_name, ' ', c.last_name) as nombrecompleto, count(r.customer_id) as totalalquileres
from rental r 
left join customer c on r.customer_id = c.customer_id 
group by r.customer_id, nombrecompleto;

--50. Calcula la duración total de las películas en la categoría 'Action'.
select sum(f.length), c."name" as genero
from film f 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where c."name" = 'Action'
group by c."name";

--51. Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el total de alquileres por cliente.
create view clientes_rentas_temporal as (
	select concat(c.first_name, ' ', c.last_name) as nombrecompleto, count(r.customer_id) as totalalquileres
	from rental r 
	left join customer c on r.customer_id = c.customer_id 
	group by r.customer_id, nombrecompleto 
)
select *
from clientes_rentas_temporal;

--52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas que han sido alquiladas al menos 10 veces.
with peliculas_alquiladas as (
    select f.film_id, f.title, count(r.rental_id) as vecesalquiladas
    from film f
    left join inventory i on f.film_id = i.film_id
    left join rental r on i.inventory_id = r.inventory_id
    group by f.film_id, f.title
)
select title, vecesalquiladas
from peliculas_alquiladas
where vecesalquiladas >= 10
order by vecesalquiladas asc;
 
--53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.
select f.title, c.first_name, c.last_name, r.return_date 
from customer c 
left join rental r on c.customer_id = r.customer_id 
left join inventory i on r.inventory_id = i.inventory_id 
left join film f on i.film_id = f.film_id 
where r.return_date is null and c.customer_id = '75'
order by f.title asc;

--54. Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados alfabéticamente por apellido.
select a.first_name, a.last_name, f.title, c."name" 
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id 
left join film f on fa.film_id = f.film_id 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where c."name" = 'Sci-Fi'
order by a.last_name;

--55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.
select distinct a.first_name, a.last_name
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id 
left join film f2 on fa.film_id = f2.film_id 
left join inventory i2 on f2.film_id = i2.film_id 
left join rental r2 on i2.inventory_id = r2.inventory_id 
where r2.rental_date > (
	select min(r.rental_date)
	from rental r 
	left join inventory i on r.inventory_id = i.inventory_id 
	left join film f on i.film_id = f.film_id 
	where f.title = 'SPARTACUS CHEAPER'
	)
order by a.last_name;

--56. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Music’.
select a.first_name, a.last_name, f.title, c."name" 
from actor a 
left join film_actor fa on a.actor_id = fa.actor_id 
left join film f on fa.film_id = f.film_id 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where c."name" != 'Music'
order by c."name";

--57. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.
select f.title, EXTRACT(day from (r.return_date - r.rental_date)) as dias_alquilada
from rental r 
left join inventory i on r.inventory_id = i.inventory_id 
left join film f on i.film_id = f.film_id 
where extract(day from (r.return_date - r.rental_date)) >= 8;

--58. Encuentra el título de todas las películas que son de la misma categoría que ‘Animation’.
select f.title, c."name" 
from category c 
left join film_category fc on c.category_id = fc.category_id 
left join film f on fc.film_id = f.film_id 
where c."name" = 'Animation';

--59. Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Fever’. Ordena los resultados alfabéticamente por título de película.
select f.title, f.length 
from film f 
where f.length = (
	select f.length 
	from film f 
	where f.title = 'DANCING FEVER'
);

--60. Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.
select c.customer_id, c.last_name, c.first_name, count(distinct f.film_id) as peliculas_unicas_alquiladas
from customer c 
left join rental r on c.customer_id = r.customer_id 
left join inventory i on r.inventory_id = i.inventory_id 
left join film f on i.film_id = f.film_id 
group by c.customer_id 
having count(distinct f.film_id) >= 7
order by c.last_name;

--61. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
select c."name", count(r.rental_id) as alquileres_por_genero
from category c 
left join film_category fc on c.category_id = fc.category_id 
left join film f on fc.film_id = f.film_id 
left join inventory i on f.film_id = i.film_id 
left join rental r on i.inventory_id = r.inventory_id 
group by c."name";

--62. Encuentra el número de películas por categoría estrenadas en 2006.
select f.title, c."name", f.release_year 
from film f 
left join film_category fc on f.film_id = fc.film_id 
left join category c on fc.category_id = c.category_id 
where f.release_year = '2006'
order by c."name";

--63. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.
select concat(st.first_name, ' ', st.last_name) as nombretrabajador, s.store_id 
from staff st  
cross join store s;

--64. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as nombrecompleto, count(r.customer_id) as totalalquileres
from rental r 
left join customer c on r.customer_id = c.customer_id 
group by r.customer_id, nombrecompleto, c.customer_id;




 
	
















