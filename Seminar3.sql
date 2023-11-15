use lesson_3;
/* Создали базу для работы
CREATE TABLE staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(45) NOT NULL,
lastname VARCHAR(45) NOT NULL,
post VARCHAR(45) NOT NULL,
seniority INT,
salary DECIMAL(8,2), -- 100 000 . 00
age INT
);
-- 4. Заполнение таблицы данными
INSERT staff(firstname, lastname, post, seniority,salary,age)
VALUES ("Петр", "Петров", "Начальник", 8, 70000, 30); -- id = 1
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff; */
/* Выведите все записи, отсортированные по полю "age" по возрастанию
select * from staff order by age; */
/* Выведите все записи, отсортированные по полю "name"
select * from staff order by firstname; */
/* Выведите записи полей "name", "surname","age", отсортированные по полю "name" в алфавитном порядке по убыванию
select firstname, lastname, age from staff order by firstname desc; */
/* Выполните сортировку по полям "name" и "age" по убыванию
SELECT * FROM staff
ORDER BY firstname asc, age DESC; */
/* Выведите уникальные (неповторяющиеся) значения полей "name". distinct достаёт только уникальные значения из столбца
select distinct firstname from staff; */
/* Пропустите первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)
select * from staff limit 4,3; */
/* Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие за ними 3 строки (где id=10, id=9, id=8)
select * from staff 
order by id desc
limit 3, 3; */
/* Расчитать общую зарплату сотрудников 
select sum(salary) as TotalZP from staff; */
/* Вывести суммарную зарплату по каждому посту
SELECT post, SUM(salary) FROM staff
GROUP BY post */
/* Вывести колличество уникальных имён 
select count(distinct(firstname)) from staff; */
/* Найти среднюю зарплату по возрасту 
select age, avg(salary) from staff
group by age
order by age; */
/* Сгруппируйте поля по возрасту (будет 3 группы - 30 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы
select age, min(salary), max(salary), avg(salary) from staff
group by age 
having age in (24, 25, 30); */
/* Выведите только те должности, в которых суммарная зарплата больше или равна 100000
 SELECT post, SUM(salary) as Summ FROM staff
GROUP BY post
having Summ >= 100000;  */
/* Выведите только те должности, в которых количество строк меньше или равно двум и их суммарную зп 
select post, count(post) as Members, SUM(salary) as Summ FROM staff
group by post
having Members <= 2; 
ИЛИ 
HAVING Members BETWEEN 1 AND 2; */


