
-- Indexes on users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Indexes on bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Indexes on properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Indexes on reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);


-- BEFORE ADDING INDEX
EXPLAIN ANALYZE
SELECT 
    property_id,
    title
FROM 
    properties
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY property_id
        HAVING AVG(rating) > 4.0
    );

-- Run the above, observe query time, rows scanned

-- NOW APPLY INDEX
-- (Run content of database_index.sql)

-- AFTER ADDING INDEX
EXPLAIN ANALYZE
SELECT 
    property_id,
    title
FROM 
    properties
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY property_id
        HAVING AVG(rating) > 4.0
    );
