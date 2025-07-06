
SELECT COUNT(user_id) AS BK_COUNT
FROM bookings
GROUP BY user_id
ORDER BY BK_COUNT;

SELECT 
    booking_id,
    property_id,
    ROW_NUMBER() OVER (PARTITION BY booking_id ORDER BY property_id DESC) AS rank
FROM bookings;

SELECT
    property_id,
    name,
    RANK() OVER (ORDER BY name DESC) AS property_rank
FROM Properties;
