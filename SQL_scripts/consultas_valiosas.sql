-- Listar las películas más largas:
SELECT title, duration_min 
FROM public.films 
ORDER BY duration_min DESC 
LIMIT 5;

-- Listar todos los clientes que compraron boletos
SELECT DISTINCT c.name, c.last_name
FROM public.customers c
INNER JOIN public.tickets t ON c.id_customer = t.id_customer;

-- Calcular el porcentaje promedio de ocupación (occu_perc) por cine:
SELECT ci.name AS cinema_name, AVG(t.occu_perc) AS avg_occupancy
FROM public.tickets t
INNER JOIN public.cinemas ci ON t.id_cinema = ci.id_cinema
GROUP BY ci.name
ORDER BY avg_occupancy DESC;

-- Listar películas con más boletos vendidos:
SELECT f.title, SUM(t.tickets_sold) AS total_tickets_sold
FROM public.tickets t
INNER JOIN public.films f ON t.id_film = f.id_film
GROUP BY f.title
ORDER BY total_tickets_sold DESC
LIMIT 5;

-- Calcular las ventas totales (total_sales) por trimestre:
SELECT quarter, SUM(total_sales) AS total_sales_quarter
FROM public.tickets
GROUP BY quarter
ORDER BY quarter;

-- Ver la diferencia entre personas que compraron boletos y no ingresaron
SELECT date, 
       SUM(people_entered) AS total_entered, 
       SUM(people_not_entered) AS total_not_entered,
       SUM(people_not_entered) * 100.0 / SUM(people_entered + people_not_entered) AS percentage_not_entered
FROM public.tickets
GROUP BY date
ORDER BY date;

-- Determinar el precio promedio de un boleto por película:

SELECT f.title, AVG(t.ticket_price) AS avg_ticket_price
FROM public.tickets t
INNER JOIN public.films f ON t.id_film = f.id_film
GROUP BY f.title
ORDER BY avg_ticket_price DESC;


-- Identificar el cine con mayor ocupación promedio en cada trimestre:
SELECT quarter, ci.name AS cinema_name, AVG(t.occu_perc) AS avg_occupancy
FROM public.tickets t
INNER JOIN public.cinemas ci ON t.id_cinema = ci.id_cinema
GROUP BY quarter, ci.name
ORDER BY quarter, avg_occupancy DESC;


-- Listar el top 3 de películas con mayor uso de boletos (ticket_use):

SELECT f.title, SUM(t.ticket_use) AS total_ticket_use
FROM public.tickets t
INNER JOIN public.films f ON t.id_film = f.id_film
GROUP BY f.title
ORDER BY total_ticket_use DESC
LIMIT 3;


-- Ventas promedio por mes y cine
SELECT 
    t.month, 
    c.name AS cinema_name, 
    AVG(t.total_sales) AS avg_sales
FROM tickets t
JOIN cinemas c ON t.id_cinema = c.id_cinema
GROUP BY t.month, c.name
ORDER BY t.month, avg_sales DESC;

-- Ranking de cines según ventas totales
SELECT 
    c.name AS cinema_name, 
    SUM(t.total_sales) AS total_sales, 
    RANK() OVER (ORDER BY SUM(t.total_sales) DESC) AS rank
FROM tickets t
JOIN cinemas c ON t.id_cinema = c.id_cinema
GROUP BY c.name;

-- Porcentaje acumulado de ingresos por cine
SELECT 
    c.name AS cinema_name, 
    SUM(t.total_sales) AS total_sales, 
    SUM(SUM(t.total_sales)) OVER (ORDER BY SUM(t.total_sales) DESC) * 100.0 / SUM(SUM(t.total_sales)) OVER () AS cumulative_percentage
FROM tickets t
JOIN cinemas c ON t.id_cinema = c.id_cinema
GROUP BY c.name
ORDER BY cumulative_percentage ASC;

-- Cines con más tickets no utilizados
SELECT 
    c.name AS cinema_name, 
    SUM(t.people_not_entered) AS total_no_shows
FROM tickets t
JOIN cinemas c ON t.id_cinema = c.id_cinema
GROUP BY c.name
HAVING SUM(t.people_not_entered) > 50
ORDER BY total_no_shows DESC;
