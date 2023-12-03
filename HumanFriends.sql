-- create database if not exists `HumanFriends`;
use humanfriends;

/** Создадим 2 таблицы 
create table if not exists Pets (
	ID int auto_increment primary key,
    Name varchar(50),
    Type varchar(50),
    DateBirh date,
    command varchar(50)
);

create table if not exists PackAnimals (
	ID int auto_increment primary key,
    Name varchar(50),
    Type varchar(50),
    DateBirh date,
    command varchar(50)
);
**/
/** Заполним таблицы
insert into pets (Name, Type, DateBirh, command) values
('Buch', 'Dog', '2022-02-18', 'Sit, Stay'),
('Marsi', 'Cat', '2018-06-20', 'Run, Jamp'),
('Cesar', 'Hamster', '2023-02-06', 'Run, Roll'),
('Clare', 'Dog', '2016-06-07', 'Sit, Stay'),
('Baldur', 'Cat', '2020-01-16', 'Run, Jamp'),
('Marsel', 'Hamster', '2021-06-17', 'Run, Roll'),
('Betty', 'Dog', '2021-08-25', 'Sit, Stay'),
('Puffy', 'Cat', '2019-07-02', 'Run, Jamp'),
('Meatball', 'Hamster', '2022-12-22', 'Run, Roll');

insert into packanimals (Name, Type, DateBirh, command) values
('Ninel', 'Horse', '2015-08-30', 'Go, Stop'),
('Jorge', 'Camel', '2021-02-11', 'Sit, Go'),
('Zahar', 'Donkey', '2023-04-09', 'Eat, Stop'),
('Bulzay', 'Horse', '2020-11-14', 'Go, Stop'),
('Sandrick', 'Camel', '2020-10-27', 'Sit, Go'),
('Stavr', 'Donkey', '2018-03-17', 'Eat, Stop'),
('Stark', 'Horse', '2017-03-21', 'Go, Stop'),
('Molly', 'Camel', '2023-08-25', 'Sit, Go'),
('Prince', 'Donkey', '2019-05-29', 'Eat, Stop');
**/
/** Удаляем верблюдов, обидно((
delete from packanimals where Type = 'Camel';
**/
/** Объединим лошадей и ослов
create table if not exists UnionUngulates as
select * from packanimals where Type in ('Horse', 'Donkey');
**/
/** Создадим таблицу с животными 1 - 3 года 
create table if not exists YoungAge as
select ID, Name, Type, DateBirh, command, 
floor(datediff(curdate(), DateBirh) / 31) as 'Month' 
from pets where DateBirh between curdate() - interval 3 year and curdate() - interval 1 year
union
select ID, Name, Type, DateBirh, command, 
floor(datediff(curdate(), DateBirh) / 31) as 'Month' 
from packanimals where DateBirh between curdate() - interval 3 year and curdate() - interval 1 year;
**/
/** Обьединим все таблицы 
create table if not exists AllAnimals as
select * from packanimals
union
select * from pets
union
select * from unionungulates
union
select ID, Name, Type, DateBirh, command from youngage;
**/
