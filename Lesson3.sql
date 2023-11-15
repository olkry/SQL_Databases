use myfirstdb;

/* Сортировка, добавить Desk - в обратную. 
select *
from products
order by Price;  */
/* Колличество строк в таблице c заданным именем 
select count(*) as Row_Sum
from products; */
/* Ограничение по строкам, селект с 1м параметром 
select * from products
limit 5;*/
/* Ограничение по строкам, селект с 2мя параметрами (сколько пропустить, сколько вывести)
select * from products
limit 2,3; */
/* Вывести сумму по столбцу
selcet sum(price) as TotalSum from products;*/
/* Вывести минимальную цену по определенной марке
select min(Price) as minPr
from products
where Manufacturer = 'Apple';*/
/* Вывести минимальную и максимальную цену марки и среднюю цену за телефон по марке
select 
	min(Price),
    max(Price),
    avg(Price)
from products
where Manufacturer = 'Samsung'; */
