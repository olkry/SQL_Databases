use myfirstdb;

-- Create table - создать таблицу 
CREATE TABLE Customer
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Age int,
    FirstName VARCHAR(20),
    LastName varchar(20)
);

# - это комментарий

/*
Это тоже комментарий 
многострочный 
*/

SELECT * FROM Customer;

CREATE TABLE Products
(
Id INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(20) NOT NULL,
ProductCount INT DEFAULT 0,
Price DECIMAL
);
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

select * from Products;
SELECT * FROM Products
WHERE NOT Manufacturer IN ("Apple", "Samsung");


use lesson_1;

create table if not exists teacher
(
teacher_id int primary key auto_increment,
teacher_name varchar(50),
teacher_post varchar(50)
);
/*
insert into teacher (teacher_name, teacher_post) values
("Смит", "Профессор"),
("Адамс", "Ассистент");
*/

create table if not exists students
(
student_id int primary key auto_increment,
student_name varchar(50),
student_cours_name varchar(50),
student_email varchar(100),
student_phone varchar(30)
);
/*
insert into students(student_name, student_cours_name, student_email, student_phone) values
("Том", "Математика", "tom@gmail.com", "564654228");
*/

create table if not exists courses
(
courses_id int primary key auto_increment,
courses_name varchar(50) unique,
courses_teacher_id int,
foreign key (courses_teacher_id) references teacher(teacher_id)
);

select * from teacher;
select * from students;
select * from courses

use lesson_1_dz;

create table if not exists mobile_phones
(
id int auto_increment primary key,
product_name varchar(50) not null,
manufacter varchar(50) not null,
product_count int default 0,
price int
);

insert into mobile_phones (product_name, manufacter, product_count, price) values
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

select * from mobile_phones
