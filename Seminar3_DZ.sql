use lesson_3;

/* Отсортируйте все данные таблицы staff по полю заработная плата salary в порядке: возрастания
select * from staff
order by salary; */
/* Отсортируйте все данные в таблице staff по полю заработная плата salary в порядке: убывания
select * from staff
order by salary desc; */
/* Выбрать пять самых высокооплачиваемых сотрудников из таблицы staff и вывести их зарплаты в убывающем порядке (начиная с самой высокой зарплаты).
select salary from staff
order by salary desc
limit 5; */
/* Получить обобщенную информацию о зарплатах сотрудников в таблице 'staff'. Для этого сгруппировать сотрудников по их должностям ('post') и вычислить общую сумму зарплаты salary для каждой должности.
select post, sum(salary) from staff
group by post; */
/* Подсчитать количество сотрудников в таблице staff со специальностью post 'Рабочий', 
-- и возраст которых находится в диапазоне от 24 до 49 лет включительно.
select count(*) from staff
where post = 'Рабочий' and age between 24 and 49; */
/* Определить количество уникальных специальностей (должностей) среди сотрудников в таблице 'staff'.
select count(distinct post) from staff */
/* Выбрать должности (специальности) сотрудников в таблице staff, у которых средний возраст (возраст в среднем) младше 30 лет. 
-- Группировать данные по специальностям post и выводить только те специальности, для которых средний возраст меньше 30 лет.
select post from staff
group by post
having avg(age) < 30; */
