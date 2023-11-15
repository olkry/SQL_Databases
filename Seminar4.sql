#CREATE DATABASE lesson_4;
USE lesson_4;
/** Создаём базу и таблицы, для работы на семинаре 
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teacher
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);

SELECT * from teacher; 
DROP TABLE IF EXISTS lesson;
CREATE TABLE lesson
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teacher(id)
);
INSERT INTO lesson(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4),
    ("Нейронные сети", NULL); -- Учитель, который ведет данный предмет, временно отстутствует
    **/
 
 /** Получить фамилии учителей и курсы, которые они ведут 
 SELECT t.surname, l.course, t.id, l.id FROM teacher t 
 INNER JOIN lesson l ON t.id = l.teacher_id; 
 **/
 
 /** Получить фамилии всеху учителей и курсы, которые они ведут 
 select t.surname, l.course
 FROM teacher t 
 left join lesson l
 on t.id = l.teacher_id;
 **/
 /** Получить фамилии всеху учителей, котором не назначены курсы
 select t.surname 
 FROM teacher t 
 left join lesson l
 on t.id = l.teacher_id
 where l.course is null
 **/
 
 /** Получить информацию о учителях, которые ведут Знакомство с веб-технологиями
 SELECT t.* 
 FROM teacher t 
 INNER JOIN lesson l 
 ON t.id = l.teacher_id
 where course = "Знакомство с веб-технологиями";
 **/
 
 /** Получить информацию о учителях, которые ведут Знакомство с веб-технологиями через подзапрос
 # select * from teacher where teacher.id 
 # in (select teacher_id from lesson where course = "Знакомство с веб-технологиями");
 select t.*, l.course from teacher t
 join (select course, teacher_id from lesson where course = 'знакомство с веб-технологиями') l 
 on t.id = l.teacher_id;
 **/
 
 -- Создадим большую таблицу
 
 