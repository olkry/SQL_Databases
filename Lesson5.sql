use myfirstdb;
-- select * from products;

/** создадим представление 
create view CopyProducts AS
select Price, ProductCount, Manufacturer
from products
where Manufacturer = "Apple"; 
**/
-- select * from copyproducts

/** удаление виртуальной таблицы (представления)
drop view copyproducts;

drop table ###;
**/

/** Внесение изменений в существующую таблицу, представление 
alter view copyproducts as
select Price, ProductCount, Manufacturer, ProductName
from products
where Manufacturer = "Apple";

alter table customer 
add column testString varchar(40);
**/

/** Удаление колонки из таблицы 
ALTER TABLE customer drop testString;
**/

/** Абстрактно! Создать представление, которое показывало бы всех заказчиков, имеющих самые высокие рейтинги.
create view HiRatung as
select * from Customers 
where rating = (select max(rating) from Customers);
**/
