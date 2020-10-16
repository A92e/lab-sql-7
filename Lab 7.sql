-- Lab | SQL Queries 7
/*

    Which last names are not repeated?
    Which last names appear more than once?
    Rentals by employee.
    Films by year.
    Films by rating.
    Mean length by rating.
    Which kind of movies (rating) have a mean duration of more than two hours?
    List movies and add information of average duration for their rating and original language.
    Which rentals are longer than expected?
*/
use sakila;
/*
--    1- Which last names are not repeated?

select  distinct(last_name) as unique_last_name  from customer 
group by last_name;


--  2-  Which last names appear more than once?

select  last_name as duplicated_last_name  from actor 
group by last_name
having count(distinct(last_name)) > 1;



--    3- Rentals by employee.

select staff_id, count(*) from rental
where customer_id=staff_id
group by staff_id;


--   4- Films by year.

select release_year,count(film_id) from film
group by release_year;

--   5- Films by rating
select rating,count(film_id) as films_rating from film
group by rating;
 
 
 --   6-   Mean length by rating.
 
select rating,avg(length) as avg_length from film
group by rating;
 
 
 --   7-  Which kind of movies (rating) have a mean duration of more than two hours?

select rating,avg(length) as avg_length from film
group by rating
having avg(length) >120;

--   8- List movies and add information of average duration for their rating and original language.

select title,language_id,rating,length,
avg(length) over (partition by rating order by rating)  from film;

*/

--  9-  Which rentals are longer than expected?
select rental_id, datediff(return_date,rental_date),
avg(datediff(return_date,rental_date)) over (partition by rental_id) from rental
where datediff(return_date,rental_date) > avg(datediff(return_date,rental_date);
-- select rental_id, datediff(return_date,rental_date) as rental_dur, avg(datediff(return_date,rental_date)) from rental