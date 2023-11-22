use seminar_6;
/** Склонируе таблицу из семинара 3
create table staff select * from lesson_3.staff;
**/

/** Создать процедуру, которая будет выводить статус по зп 
select @res_out := 5;
drop procedure if exists get_status;
delimiter $$
create procedure get_status (
in staff_number int,
out staff_status varchar(50)
)
begin
	declare staff_salary double;
    
    select salary into staff_salary
    from staff
    where staff_number = id;
    
    if staff_salary between 0 and 49999
		then set staff_status = 'Средняя ЗП';
	elseif staff_salary between 50000 and 69999
		then set staff_status = 'ЗП выше средней';
	elseif staff_salary > 69999
		then set staff_status = 'Высокая ЗП';
	end if;
END $$

call get_status(2, @res_out);

select @res_out;
**/

/** Создать функцию , которая будет выводить возраст человека по дате рождения 
drop function if exists get_age;
delimiter $$
create function get_age
(
date_birth date,
current_t datetime
)
returns int
deterministic
return (year(current_t) - year(date_birth));
$$
select now();
select get_age('1990-04-08', NOW()) as 'Возраст' 
**/

-- Вывести цифры в убывающем порядке от введённой 
/**
drop procedure if exists print_num;
delimiter $$
create procedure print_num
(
input_num int
)
begin
declare n int;
declare result varchar(50) default '';
set n = input_num;
repeat set result = concat(result,n,' ');
set n = n - 1;
until n <= 0
end repeat;
select result;
end $$

call print_num(15)
**/
