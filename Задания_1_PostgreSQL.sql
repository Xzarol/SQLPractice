--Задание 1. Выведите уникальные названия городов из таблицы городов
select distinct city from city c order by city;
/*Задание 2. Доработайте запрос из предыдущего задания, 
 * чтобы запрос выводил только те города, названия которых начинаются на “L” и заканчиваются на “a”,
 *  и названия не содержат пробелов.*/
select distinct city from city c where city like 'L%a' and city not like '% %' order by city;
/*Задание 3. Получите из таблицы платежей за прокат фильмов информацию по платежам, 
 * которые выполнялись в промежуток с 17 июня 2005 года по 19 июня 2005 года 
 * включительно и стоимость которых превышает 1.00. Платежи нужно отсортировать по дате платежа*/
select * from payment p where payment_date between '2005-06-17' and '2005-06-20' and amount > 1.00
order by payment_date ; 
select * from payment p;
--Задание 4. Выведите информацию о 10-ти последних платежах за прокат фильмов
select * from payment p order by payment_date desc limit 10;
/* Задание 5. Выведите следующую информацию по покупателям:
•	Фамилия и имя (в одной колонке через пробел)
•	Электронная почта
•	Длину значения поля email
•	Дату последнего обновления записи о покупателе (без времени)
 Каждой колонке задайте наименование на русском языке.
*/
select 
concat_ws(' ',first_name,last_name) as Имя_покупателя,
email as Электронная_почта,
char_length(email) as Длина_почты,
cast(last_update as date) as Дата_последнего_обновления_записи
from customer c ;
/*Задание 6. Выведите одним запросом только активных покупателей, имена которых KELLY или WILLIE.
 * Все буквы в фамилии и имени из верхнего регистра должны быть переведены в нижний регистр*/
select 
lower(concat_ws(' ',first_name,last_name)) 
from customer c 
where (first_name = 'KELLY' or first_name = 'WILLIE') and activebool = true;
/*Задание 7. Выведите одним запросом информацию о фильмах, у которых рейтинг “R” и стоимость 
 * аренды указана от 0.00 до 3.00 включительно, а также фильмы c 
 * рейтингом “PG-13” и стоимостью аренды больше или равной 4.00*/
select * from film f where (rating = 'R' and rental_rate between 0.00 and 3.00) or (rating = 'PG-13' and rental_rate >= 4.00);
--Задание 8. Получите информацию о трёх фильмах с самым длинным описанием фильма
select * from film f order by char_length(description) desc limit 3 ;
/*Задание 9. Выведите Email каждого покупателя, разделив значение Email на 2 отдельных колонки:
•	в первой колонке должно быть значение, указанное до @,
•	во второй колонке должно быть значение, указанное после @
*/
select 
split_part(email, '@', 1) as Пользователь,
split_part(email, '@', 2) as Домен
from customer c ;
/*Задание 10. Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках:
 * первая буква должна быть заглавной, остальные строчными.*/
select initcap(split_part(email, '@', 1)) as Пользователь,
initcap(split_part(email, '@', 2)) as Домен
from customer c ; --Тут  слова после точек тоже с большой пишутся
select 
    upper(substring(split_part(email, '@', 1) from 1 for 1)) ||
    lower(substring(split_part(email, '@', 1) from 2)) as Пользователь,
    upper(substring(split_part(email, '@', 2) from 1 for 1)) ||
    lower(substring(split_part(email, '@', 2) from 2)) as Домен
from customer c; --Тут правильно но громоздко