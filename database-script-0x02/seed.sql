
-- Sample Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('22', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest', CURRENT_TIMESTAMP),
    ('33', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'host', CURRENT_TIMESTAMP),
    ('44', 'Carol', 'White', 'carol@example.com', 'hashed_pw3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Sample Properties
INSERT INTO Properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
    ('kk', '22', 'Cozy Cottage', 'A small and cozy cottage in the woods.', 'Nairobi', 45.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('mm', '33', 'City Apartment', 'Modern apartment with city views.', 'Mombasa', 80.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('km', 'kk', '22', '2025-07-01', '2025-07-05', 180.00, 'confirmed', CURRENT_TIMESTAMP),
    ('mk', 'mm', '33', '2025-08-10', '2025-08-12', 160.00, 'pending', CURRENT_TIMESTAMP);

-- Sample Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('kmw', 'km', 180.00, CURRENT_TIMESTAMP, 'credit_card');

-- Sample Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
    ('kwm', 'kk', '22', 5, 'Wonderful place to stay!', CURRENT_TIMESTAMP);

-- Sample Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
    ('kw', '55', '77', 'Hi, is the cottage available for next week?', CURRENT_TIMESTAMP),
    ('wk', '66', '88', 'Yes, it is available from Monday onwards.', CURRENT_TIMESTAMP);
