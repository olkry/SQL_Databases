use lesson_2;
/*
create table if not exists movies (
id int primary key auto_increment,
name varchar(255) not null,
year year not null,
length int not null,
description text not null
);
*/
/*
insert into movies (name, year, length, description) values
('Игры разума', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 1994, 154, '');
*/

# rename table films to movies;
# alter table movies add column country varchar(50);
# alter table movies drop column country;
# truncate table movies; отчистить все данные таблицы

use lesson_2;
/*
CREATE TABLE if not exists studentMarks (
stud_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
total_marks INT, 
grade VARCHAR(5)
);
*/
/*
INSERT INTO studentMarks(total_marks, grade) VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380,'C'),
(250, 'D'),
(200,'E'),
(100,'F'),
(150,'F'),
(220, 'E');
*/

/*
select *, case 
when grade = 'A++' then 'DISTINCTION'
when grade = 'A+' then 'FIRST CLASS'
when grade = 'A' or grade = 'B+' then 'SECOND CLASS'
when grade = 'C+' then 'THIRD CLASS'
else 'FAIL' end as class
from studentmarks;
*/
/*
select *, CASE
WHEN total_marks > 450 THEN 'ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ'
WHEN total_marks between 400 AND 450 THEN 'ПЕРВЫЙ КЛАСС'
WHEN total_marks between 350 and 399 THEN 'ВТОРОЙ КЛАСС'
WHEN total_marks between 300 AND 349 THEN 'ТРЕТИЙ КЛАСС'
ELSE 'НЕУДАЧА'
END as class
from studentmarks;
*/

# select if(100>200, 'yes', 'no');
# select *, if (total_Marks>450, 'Отлично', 'Хорошо') from studentMarks
# select *, if(total_marks > 450, 'Отлично', if(total_marks > 350, 'Хорошо', if(total_marks > 200,'Удовлетворительно', 'FAIL'))) from studentmarks;


-- dz
/*
use lesson_2_dz;
/*
create table if not exists sales(
id int primary key auto_increment,
order_date varchar(50),
count_product int 
);
*/
/*
insert into sales(order_date, count_product) values
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
*/
/*
select id as 'Номер заказа', count_product as 'Количество продукта', case 
when count_product < 100 then 'Маленький заказ'
when count_product > 300 then 'Большой заказ'
else 'Средний заказ' end as Тип
from sales;
*/

create table if not exists orders(
delivery varchar(50),
veight varchar(50),
statis varchar(50) 
);

insert into orders(delivery, veight, statis) values
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED');

/*
select *, case 
when statis = 'OPEN' then 'Order is in open state'
when statis = 'CLOSED' then 'Order is closed'
else 'Order is cancelled' end as full_order_status
from orders;
*/

select id, employee_id, amount, order_status, case
when order_status = 'OPEN' then 'Order is in open state'
when order_status = 'CLOSED' then 'Order is closed'
when order_status = 'CANCELLED' then 'Order is cancelled'
else 'Not mentioned' end as full_order_status
from orders;
