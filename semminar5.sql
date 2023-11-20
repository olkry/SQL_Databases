use semminar_5;
/** Склонируе таблицу из семинара 3
create table staff select * from lesson_3.staff;
**/

-- Пример работы CTE (https://saveriomiroddi.github.io/Generating-sequences-ranges-via-mysql-8.0-ctes/)
/** Создание, заполнение 
CREATE TABLE if not exists line_items(
  item_number INT UNSIGNED PRIMARY KEY,
  item_total  DECIMAL(8,2) NOT NULL,
  order_number INT UNSIGNED NOT NULL
);

INSERT INTO line_items VALUES
  (1, 10, 1),
  (2, 10, 1),
  (3, 15, 2)
;
**/
/** Выполнение 
WITH order_totals(order_number, order_total) AS
(
  SELECT order_number, SUM(item_total) `order_total`
  FROM line_items
  GROUP BY order_number
)
SELECT item_number, item_total, order_number, order_total
FROM line_items
     JOIN order_totals USING (order_number);
**/

/** Вывести всех сотрудников и указать место в рейтенге по ЗП по убыванию 
select salary, post, concat(firstname, ' ', lastname) as fullname,
dense_rank() over(order by salary desc) as 'dense_rank',
rank() over(order by salary desc) as 'rank'
from staff;
**/

/** Вывести топов по ЗП в должности 
select salary, post, concat(firstname, ' ', lastname) as fullname,
dense_rank() over(partition by(post) order by salary desc) as 'dense_rank',
rank() over(partition by(post) order by salary desc) as 'rank'
from staff;
**/

/** Вывести только топ 1 по зп в должности и по убыванию зарплат 
with sq1 as (select salary, post, concat(firstname, ' ', lastname) as fullname,
dense_rank() over(partition by(post) order by salary desc) as dense_rank1,
rank() over(partition by(post) order by salary desc) as 'rank'
from staff)
select * from sq1
where dense_rank1 = 1
order by 1 desc;
**/

/** Агрегатные функции. По должностям выведем зп: суммарные, максимальные, средние и процентное отношение отделиной к общей. 
select salary, post, concat(firstname, ' ', lastname) as fullname,
sum(salary) over(partition by post) as sum_salary, -- полная запись order()
avg(salary) over w as avg_salary, -- заменили в order() на w, в конце запроса пояснили, что это 
round(salary*100/sum(salary) over (),2) as precent_salary
from staff
window w as (partition by post)
order by 2, 1 desc;
**/

/** Посмотреть колличество специалистов по должностям и их среднюю зп 
select count(*) as count_staff,
post, avg(salary) as avg_salary
from staff
group by post
order by count_staff;
**/

/** Создадим вьюшку для колличества специалистов по должностям и их средней зп, умрет после завершения сессии 
create or replace view count_post as  -- replace если есть, обновится 
select count(*) as count_staff,
post, avg(salary) as avg_salary
from staff
group by post
order by count_staff;

select * from count_post;
**/

-- Функции смещения! 
