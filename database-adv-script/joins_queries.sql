
SELECT *
FROM bookings
INNER JOIN users
ON bookings.user_id = users.user_id;


SELECT *
FROM Properties
LEFT JOIN Reviews
ON Properties.property_id = Reviews.property_id;

SELECT *
FROM users
FULL OUTER JOIN bookings
ON users.user_id = bookings.user_id;