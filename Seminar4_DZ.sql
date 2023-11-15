use lesson_4_DZ;
/** Создём таблицы 
-- пользователи
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

INSERT INTO users (id, firstname, lastname, email) VALUES 
(1, 'Reuben', 'Nienow', 'arlo50@example.org'),
(2, 'Frederik', 'Upton', 'terrence.cartwright@example.org'),
(3, 'Unique', 'Windler', 'rupert55@example.org'),
(4, 'Norene', 'West', 'rebekah29@example.net'),
(5, 'Frederick', 'Effertz', 'von.bridget@example.net'),
(6, 'Victoria', 'Medhurst', 'sstehr@example.net'),
(7, 'Austyn', 'Braun', 'itzel.beahan@example.com'),
(8, 'Jaida', 'Kilback', 'johnathan.wisozk@example.com'),
(9, 'Mireya', 'Orn', 'missouri87@example.org'),
(10, 'Jordyn', 'Jerde', 'edach@example.com');

-- сообщения
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO messages  (from_user_id, to_user_id, body, created_at) VALUES
(1, 2, 'Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.',  DATE_ADD(NOW(), INTERVAL 1 MINUTE)),
(2, 1, 'Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed. Voluptas atque eum et odio ea molestias ipsam architecto.',  DATE_ADD(NOW(), INTERVAL 3 MINUTE)),
(3, 1, 'Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi. Et tempora repudiandae saepe quo.',  DATE_ADD(NOW(), INTERVAL 5 MINUTE)),
(4, 1, 'Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit. Facere eum distinctio assumenda omnis est delectus magnam.',  DATE_ADD(NOW(), INTERVAL 11 MINUTE)),
(1, 5, 'Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur. Molestiae molestiae deleniti exercitationem sunt qui ea accusamus deserunt.',  DATE_ADD(NOW(), INTERVAL 12 MINUTE)),
(1, 6, 'Rerum labore culpa et laboriosam eum totam. Quidem pariatur sit alias. Atque doloribus ratione eum rem dolor vitae saepe.',  DATE_ADD(NOW(), INTERVAL 14 MINUTE)),
(1, 7, 'Perspiciatis temporibus doloribus debitis. Et inventore labore eos modi. Quo temporibus corporis minus. Accusamus aspernatur nihil nobis placeat molestiae et commodi eaque.',  DATE_ADD(NOW(), INTERVAL 15 MINUTE)),
(8, 1, 'Suscipit dolore voluptas et sit vero et sint. Rem ut ratione voluptatum assumenda nesciunt ea. Quas qui qui atque ut. Similique et praesentium non voluptate iure. Eum aperiam officia quia dolorem.',  DATE_ADD(NOW(), INTERVAL 21 MINUTE)),
(9, 3, 'Et quia libero aut vitae minus. Rerum a blanditiis debitis sit nam. Veniam quasi aut autem ratione dolorem. Sunt quo similique dolorem odit totam sint sed.',  DATE_ADD(NOW(), INTERVAL 22 MINUTE)),
(10, 2, 'Praesentium molestias quia aut odio. Est quis eius ut animi optio molestiae. Amet tempore sequi blanditiis in est.',  DATE_ADD(NOW(), INTERVAL 25 MINUTE)),
(8, 3, 'Molestiae laudantium quibusdam porro est alias placeat assumenda. Ut consequatur rerum officiis exercitationem eveniet. Qui eum maxime sed in.',  DATE_ADD(NOW(), INTERVAL 27 MINUTE)),
(8, 1, 'Quo asperiores et id veritatis placeat. Aperiam ut sit exercitationem iste vel nisi fugit quia. Suscipit labore error ducimus quaerat distinctio quae quasi.',  DATE_ADD(NOW(), INTERVAL 28 MINUTE)),
(8, 1, 'Earum sunt quia sed harum modi accusamus. Quia dolor laboriosam asperiores aliquam quia. Sint id quasi et cumque qui minima ut quo. Autem sed laudantium officiis sit sit.',  DATE_ADD(NOW(), INTERVAL 33 MINUTE)),
(4, 1, 'Aut enim sint voluptas saepe. Ut tenetur quos rem earum sint inventore fugiat. Eaque recusandae similique earum laborum.',  DATE_ADD(NOW(), INTERVAL 35 MINUTE)),
(4, 1, 'Nisi rerum officiis officiis aut ad voluptates autem. Dolor nesciunt eum qui eos dignissimos culpa iste. Atque qui vitae quos odit inventore eum. Quam et voluptas quia amet.',  DATE_ADD(NOW(), INTERVAL 35 MINUTE)),
(4, 1, 'Consequatur ut et repellat non voluptatem nihil veritatis. Vel deleniti omnis et consequuntur. Et doloribus reprehenderit sed earum quas velit labore.',  DATE_ADD(NOW(), INTERVAL 37 MINUTE)),
(2, 1, 'Iste deserunt in et et. Corrupti rerum a veritatis harum. Ratione consequatur est ut deserunt dolores.',  DATE_ADD(NOW(), INTERVAL 37 MINUTE)),
(8, 1, 'Dicta non inventore autem incidunt accusamus amet distinctio. Aut laborum nam ab maxime. Maxime minima blanditiis et neque. Et laboriosam qui at deserunt magnam.',  DATE_ADD(NOW(), INTERVAL 41 MINUTE)),
(8, 1, 'Amet ad dolorum distinctio excepturi possimus quia. Adipisci veniam porro ipsum ipsum tempora est blanditiis. Magni ut quia eius qui.',  DATE_ADD(NOW(), INTERVAL 42 MINUTE)),
(8, 1, 'Porro aperiam voluptate quo eos nobis. Qui blanditiis cum id eos. Est sit reprehenderit consequatur eum corporis. Molestias quia quo sit architecto aut.',  DATE_ADD(NOW(), INTERVAL 50 MINUTE));

-- заявки на дружбу
DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    `status` ENUM('requested', 'approved', 'unfriended', 'declined'),
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME,
    PRIMARY KEY (initiator_user_id, target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (target_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO friend_requests (initiator_user_id, target_user_id, `status`, requested_at, updated_at) 
VALUES 
(1, 10, 'approved', '2023-01-05 06:40:37', '2023-01-05 16:28:19'),
(1, 2, 'requested', '2023-01-06 07:33:23', NULL),
(1, 3, 'approved', '2023-01-07 01:53:07', '2023-01-18 16:22:56'),
(4, 1, 'approved', '2023-01-08 15:57:26', '2023-01-15 18:12:00'),
(5, 2, 'approved', '2023-01-08 18:22:00', '2023-01-14 08:25:00'),
(6, 3, 'unfriended', '2023-01-09 17:07:59', '2023-01-09 17:12:45'),
(7, 1, 'requested', '2023-01-09 06:20:23', NULL),
(8, 6, 'unfriended', '2023-01-10 01:50:03', '2023-01-10 06:50:59'),
(9, 7, 'approved', '2023-01-11 22:52:09', NULL),
(10, 6, 'approved', '2023-01-12 00:32:15', '2023-01-12 10:22:15');

-- сообщества
DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
    INDEX communities_name_idx(name)
);

INSERT INTO `communities` (name) 
VALUES ('atque'), ('beatae'), ('est'), ('eum'), ('hic'), ('nemo'), ('quis'), ('rerum'), ('tempora'), ('voluptas');

-- пользователи сообщества
DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, community_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (community_id) REFERENCES communities(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO users_communities (user_id, community_id) 
VALUES 
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2), 
(3, 1), (3, 2), (3, 10), (3, 5), (3, 8),
(4, 1), (4, 2), (4, 3), (4, 8),
(5, 1), (5, 2), (5, 3), (5, 6), (5, 8), (5, 10),
(6, 1), (6, 2), (6, 3), (6, 6),
(7, 1), (7, 2), (7, 3), (7, 8), (7, 7), (7, 6),
(8, 1), (8, 2), (8, 3), (8, 5), (8, 7), (8, 9),
(9, 1), (9, 2),  
(10, 1), (10, 10);

-- типы медиа
DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name_type VARCHAR(255)
);

INSERT INTO media_types (name_type)
VALUES 	('Photo'), ('Music'), ('Video'), ('Post');


-- медиа
DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_type_id BIGINT UNSIGNED,
  	body text,
  	filename VARCHAR(255), 
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO media (media_type_id, user_id, filename, body) VALUES 
(3, 1, 'a.avi', 'Est aut aliquid est. Soluta eveniet doloribus ipsam ut id assumenda quam. Consequuntur et velit aperiam error corporis rem corporis. Est similique quisquam quia maxime eaque possimus facere officiis. Odio magni atque dicta voluptatibus hic iste delectus.'),
(2, 2, '1.mp3', 'Laborum dolorem magni unde vero sit hic. Pariatur quia voluptas magnam. Blanditiis dolorem et molestias veniam facere provident.'),
(1, 3, 'sapiente.png', 'A quam ea ullam reiciendis vel et reiciendis. Delectus iure mollitia est. Eum dolores dolores sed officia vitae qui. Sed repudiandae voluptatem voluptatibus libero culpa quo.'),
(3, 4, 'rerum.mp4', 'Velit commodi in veniam occaecati. Tenetur temporibus ullam enim officiis aut illum. In maiores velit nobis soluta molestias maiores tempora. Quisquam et ut et sequi.'),
(1, 5, 'user5-profile-image.bmp', 'Est eaque est qui et omnis rerum. Expedita porro nesciunt inventore consequatur quos. Inventore aut rerum voluptas. Dicta vel ut quibusdam cupiditate tempore.'),
(1, 6, 'quasi.jpg', 'Atque et nam nulla et aliquid. Vel repellendus aut natus odit quibusdam quis atque et. Laudantium minima velit dolores eos voluptate nostrum.'),
(3, 7, 'non.mp4', 'Nihil ut et reprehenderit et. Numquam veniam quis impedit. Voluptas saepe rerum illo vel omnis. Aliquam illum ut quo saepe ea unde est.'),
(4, 8, 'new_01012023.docx', 'Sint quod fugit molestiae dolore repellendus est. Quis corporis necessitatibus commodi placeat temporibus doloremque voluptatem. Nemo maxime sit dolorem perferendis repellat. Et impedit deleniti eaque pariatur ut quia voluptatibus.'),
(1, 9, 'ullam.jpg', 'Optio sed aperiam veniam eum. Rerum placeat soluta iusto perspiciatis quibusdam dolorem eos. Ea pariatur optio est ut.'),
(2, 10, '2.mp3', 'Facere nostrum facilis aperiam quisquam dolor. Minima omnis est nam.'),
(3, 1, 'non.mp4', 'A omnis ratione non. Et velit sed incidunt corporis ut rerum nemo. Ut pariatur tempora ea incidunt praesentium ut. Eligendi et et rerum sequi ut.'),
(4, 1, 'new_07012023.html', 'Quo minus harum debitis debitis quis sunt. Dolores suscipit placeat dolorum non voluptate et. Non eos odio esse tempore. Illum minus quidem temporibus porro.'),
(1, 1, '1.jpg', NULL),
(2, 1, 'godt.mp3', 'Nobis est sed blanditiis assumenda incidunt explicabo. Facere rem assumenda odio explicabo ad enim repellat quia. Dolor mollitia fugiat officia nihil animi.'),
(3, 1, 'path1.avi', 'Tempora ad et aspernatur laborum ut dolor et. Exercitationem quaerat corporis placeat et.'),
(4, 1, 'new_07012023.html', 'Accusantium est ea fuga omnis mollitia. Dolores officia et consequatur iste est quo. Ullam laborum qui ut quo delectus temporibus.'),
(1, 1, 'map.bmp', 'Quasi itaque atque ut aliquam debitis. Qui consequuntur maiores sit ad perspiciatis quaerat assumenda repudiandae. Necessitatibus placeat quaerat aut voluptatem ratione voluptate expedita. Nulla doloremque aut molestiae nam.'),
(2, 1, '7.acc', 'Deserunt voluptatem quia voluptatem sit. Qui omnis distinctio optio voluptatem veniam atque dolorem. Repellat laboriosam illo consequatur nesciunt voluptas magni rerum. Saepe quos qui doloremque.'),
(3, 1, 'path2.avi', 'Fugiat consequuntur voluptatem odit omnis. Quia aut voluptate officia rerum. Cumque voluptatem eaque dolorum voluptas sed. Et autem atque est minus veritatis explicabo eos.'),
(4, 2, 'new_10012023.html', 'Autem dolore beatae aut corporis fugit ratione. Ex beatae qui at. Est deleniti asperiores temporibus perferendis est.'),
(1, 8, 'poster.jpg', 'Provident eligendi animi quidem qui ipsum. Accusamus dolor sint est qui magnam. Omnis enim quis dolore magni facilis repudiandae deserunt. Consequatur eum at recusandae id tenetur voluptas amet.'),
(2, 10, 'music_all.mp3', 'Animi ut labore dolore atque consequuntur maxime fugit. Sunt et et facere sint. Recusandae numquam accusamus a. Non quia dolorem reiciendis earum et officiis iure.'),
(3, 3, 'kino.avi', 'Sint officiis a ipsa quaerat rerum ea totam. Aut perferendis deleniti error ipsa ducimus ipsam. Ipsum a sunt quis placeat.'),
(4, 9, 'new_117012023.doc', 'Et accusamus a et adipisci dolore. Blanditiis sit vitae dolorem voluptas temporibus numquam ab. Aut temporibus accusantium consectetur.'),
(1, 10, 'main_photo.jpg', 'Consequuntur animi sed ea perferendis ad magnam. Aut libero alias sequi iste qui est. Ut quo dignissimos quibusdam doloremque est est incidunt.'),
(2, 1, 'ariya.mp3', 'Accusantium sit praesentium voluptatem molestias architecto. Excepturi doloremque ab eligendi eum ullam voluptas qui. Inventore expedita distinctio omnis laborum laboriosam.'),
(3, 1, 'film.mp4', NULL),
(4, 1, 'news.html', 'A culpa nostrum et quis. Id ipsum ipsum deserunt earum eaque aut earum. Blanditiis et commodi voluptas.'),
(1, 3, 'non.jpg', 'Cumque quod provident provident fugit cumque numquam. Fuga totam delectus a aut quaerat nemo dignissimos eos. Ratione harum et laborum qui dolore aliquam facilis numquam. At quas nam sapiente porro nesciunt voluptatum.'),
(1, 8, 'et.jpg', 'Provident quia fuga et consequatur reprehenderit repellat. Et aut cum nostrum ut beatae animi aut alias.');

-- лайки медиа
DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)  ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id)  ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO likes (user_id, media_id) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 2), (6, 2), (7, 2), (8, 8), (1, 9), (10, 15), (7, 11), (5, 12), (6, 13), (1, 14), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20); 

-- профиль пользователя
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED,
    hometown VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)  ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES media(id)  ON UPDATE CASCADE ON DELETE SET NULL
);
INSERT INTO `profiles` (user_id, gender, birthday, photo_id, hometown) VALUES 
(1, 'f', '1976-11-08', 9, 'Adriannaport'),
(2, 'f', '2011-12-20', 13, 'North Nettieton'),
(3, 'm', '1994-06-15', 3, 'Padbergtown'),
(4, 'f', '1979-11-07', NULL, 'Port Rupertville'),
(5, 'f', '1976-04-19', 5, 'Spencerfort'),
(6, 'f', '1983-09-07', 6, 'South Woodrowmouth'),
(7, 'm', '2014-07-31', NULL, 'South Jeffereyshire'),
(8, 'f', '1975-03-26', 17, 'Howeside'),
(9, 'f', '1982-11-01', 9, 'Loweborough'),
(10, 'm', '1977-05-14', NULL, 'New Nellaside');
**/

#Подсчитать общее количество лайков, поставленных пользователями, чей возраст меньше 12 лет к текущей дате. 
#Для этого объединить таблицы likes, media, и profiles, и учесть только лайки, оставленные пользователями, 
#возраст которых составляет менее 12 лет с момента их дня рождения.
/** Решение Давида
SELECT COUNT(*) 
FROM profiles p 
INNER JOIN media m ON m.user_id = p.user_id 
INNER JOIN likes l ON l.user_id = p.user_id 
WHERE DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), birthday)), '%Y') < 12;
**/
/** Решение автотеста 
SELECT COUNT(*) -- количество лайков
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN profiles p ON p.user_id = m.user_id
WHERE  TIMESTAMPDIFF(YEAR,p.birthday,NOW())<12;
**/

#Подсчитать количество лайков, оставленных пользователями, в зависимости от их гендера. 
#Для этого объединить таблицы likes и profiles, сгруппировать данные по полу пользователей и 
#вывести результат в убывающем порядке, начиная с наибольшего количества лайков.
/** Решение 
select count(l.id), p.gender
from likes l 
join profiles p on p.user_id = l.user_id
group by p.gender
order by count(l.id) desc
**/

#Выбрать пользователей из таблицы users, которые не отправили ни одного сообщения (не имеют записей в таблице 'messages').
/** Моё решение
select u.id, concat(firstname, ' ',  lastname) as user from users u
where id not in (select from_user_id from messages)
**/
/** Решение автотеста но хорошее
SELECT u.id, CONCAT(u.firstname, ' ', u.lastname) AS "user"
FROM users u
LEFT JOIN messages m ON u.id = m.from_user_id
WHERE m.id IS NULL;
**/

/** У вас есть база данных с тремя таблицами: users (пользователи),messages (сообщения) и friend_requests (запросы на добавление в друзья).
Каждая запись в таблице users содержит информацию о пользователе, включая уникальный идентификатор (id), имя (firstname), и фамилию (lastname).
Таблица friend_requests содержит информацию о запросах на добавление в друзья с полями: уникальный идентификатор (id), 
идентификатор инициатора запроса (initiator_user_id), идентификатор целевого пользователя (target_user_id) и 
статус запроса (status), где 'approved' указывает на утвержденные запросы.
Таблица messages содержит информацию о сообщениях с полями: уникальный идентификатор (id), идентификатор отправителя (from_user_id), 
идентификатор получателя (to_user_id) и текст сообщения (message_text).

Ваша задача состоит в том, чтобы написать SQL-запрос, который вернет идентификатор и имя отправителя, 
который отправил наибольшее количество сообщений пользователю с идентификатором 1, при условии, 
что запросы на добавление в друзья между отправителем и получателем сообщений имеют статус 'approved'.

Также, учтите, что некоторые пользователи могут быть отправителями сообщений, но не обязательно быть друзьями 
(не иметь утвержденных запросов на добавление в друзья).
**/
/** "Моё решение"
SELECT m.from_user_id,
    concat(u.firstname, ' ', u.lastname) AS 'От кого',
    COUNT(m.id) AS cnt
FROM messages m
JOIN users u ON m.from_user_id = u.id
JOIN friend_requests fr ON m.from_user_id = fr.initiator_user_id AND m.to_user_id = fr.target_user_id AND fr.status = 'approved'
WHERE m.to_user_id = 1
GROUP BY m.from_user_id, u.firstname
ORDER BY cnt DESC
LIMIT 1;
**/

