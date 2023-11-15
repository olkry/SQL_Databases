use myfirstdb;

/* Создадим 2 таблицы для задания
create table if not exists Customers (
Id int auto_increment primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
AccountSum decimal
);

create table if not exists Employees (
Id int auto_increment primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null
);

insert into Customers(FirstName, LastName, AccountSum) values 
('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800);

insert into Employees(FirstName, LastName) values 
('Homer', 'Simpson'),
('Tom', 'Smith'),
('Mark', 'Adams'),
('Nick', 'Svensson'); */
/* Выборка столбцов из 2х таблиц с сортировкой в обратном и удалением повторяющихся значений - union 
select FirstName, LastName from customers
union select FirstName, LastName from employees 
order by FirstName desc; */
/* Выборка столбцов из 2х таблиц с сортировкой без удаления повторяющихся значений - union all
select FirstName, LastName from customers
union all select FirstName, LastName from employees
order by FirstName; */
/* Объединение в одном столбце данных из одной таблицы с разными условиями и сортировкой
select FirstName, LastName, AccountSum + AccountSum * 0.1 as TotalSum
from customers where AccountSum < 3000
union select FirstName, LastName, AccountSum + AccountSum * 0.3 as TotalSum
from customers where AccountSum >= 3000
order by TotalSum desc; */
-- Создадим новые таблички для работы
/* 3 таблицы с забором ключей 
create table Products2 (
ID int auto_increment primary key,
ProductName varchar(30) not null,
Manufacturer varchar(20) not null,
ProductCount int default 0,
Price decimal not null
);

create table Customers2 (
ID int auto_increment primary key,
FirstName varchar(30) not null
);

create table Orders (
ID int auto_increment primary key,
ProductID int not null,
CustomerID int not null,
CreatedAt date not null,
ProductCount int default 1,
Price decimal not null,
foreign key (ProductID) references Products2(ID) on delete cascade,
foreign key (CustomerID) references Customers2(ID) on delete cascade
); */ 
/* выведем все заказы и добавим информацию о заказах 
select orders.CreatedAt, orders.ProductCount, products2.ProductName from orders
join products2 on products2.ID = orders.ProductID; */
-- далее будем работать с данными из таблицы с телефонами
/* создадим и заполним таблицу 
create table test (
ID int,
Name varchar(45)
);
insert into test values
(1, 'Bob'),
(2, 'Tom'),
(3, 'Tim');

select * from test; */
/* Склонируем табличку в новую
create table copy select * from test; */
