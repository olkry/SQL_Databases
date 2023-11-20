use seminar_5_DZ;

-- Определить ранг отправителей сообщений на основе количества сообщений, которые они отправили. 
-- Вывести ранг, имя и фамилию отправителей, а также количество сообщений, которые они отправили. 
-- Отсортировать результат в порядке убывания количества сообщений.
/** Решение с чатом и доработками
SELECT
  dense_rank() OVER (ORDER BY COALESCE(m.message_count, 0) DESC) AS rank_cnt,
  concat(u.firstname, ' ', u.lastname) as sender, COALESCE(m.message_count, 0) as cnt
FROM users u
left JOIN (SELECT from_user_id, COUNT(*) AS message_count
  FROM messages GROUP BY from_user_id ) m ON u.id = m.from_user_id
ORDER BY
  message_count DESC;
  **/
/** Решение автотеста, не работает, только на платформе   
  SELECT 
 DENSE_RANK() OVER (ORDER BY cnt DESC) AS rank_cnt,
 sender,
 cnt
FROM (SELECT 
 CONCAT(u.firstname, ' ', u.lastname) AS sender,
 COUNT(m.id) AS cnt
FROM users u 
LEFT JOIN messages m ON u.id=m.from_user_id 
GROUP BY u.id) AS list
ORDER BY cnt DESC;
**/


-- Составить список сообщений из таблицы messages, включая их уникальные идентификаторы, отправителя (from_user_id), 
-- получателя (to_user_id), текст сообщения (body), дату создания (created_at), а также информацию о времени, 
-- прошедшем между этим сообщением и следующим (lead_time и minute_lead_diff) и времени, 
-- прошедшем между этим сообщением и предыдущим (lag_time и minute_lag_diff). Время указано в минутах.
/** Решение с чатом и доработками
SELECT
  id, from_user_id, to_user_id,
  body, created_at,
  LEAD(created_at) OVER (ORDER BY created_at) AS lead_time,
  TIMESTAMPDIFF(MINUTE, created_at, LEAD(created_at) OVER (ORDER BY created_at)) AS minute_lead_diff,
  LAG(created_at) OVER (ORDER BY created_at) AS lag_time,
  TIMESTAMPDIFF(MINUTE, LAG(created_at) OVER (ORDER BY created_at), created_at) AS minute_lag_diff
FROM messages;
**/
/** Решение автотеста
SELECT id, from_user_id, to_user_id, body, created_at,
 LEAD(created_at) OVER(ORDER BY created_at) AS lead_time,
 TIMESTAMPDIFF (MINUTE, created_at, LEAD(created_at) OVER(ORDER BY created_at)) AS minute_lead_diff,
 LAG(created_at) OVER(ORDER BY created_at) AS lag_time,
 TIMESTAMPDIFF (MINUTE,  LAG(created_at) OVER(ORDER BY created_at), created_at ) AS minute_lag_diff
FROM messages;
**/
