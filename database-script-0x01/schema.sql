
-- User Table
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON Users(email);

-- Property Table
CREATE TABLE Properties (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_property_id ON Properties(property_id);

-- Booking Table
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CONSTRAINT chk_date_range CHECK (end_date > start_date)
);

CREATE INDEX idx_booking_property ON Bookings(property_id);
CREATE INDEX idx_booking_id ON Bookings(booking_id);

-- Payment Table
CREATE TABLE Payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE INDEX idx_payment_booking ON Payments(booking_id);

-- Review Table
CREATE TABLE Reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CONSTRAINT uq_review_unique UNIQUE (user_id, property_id)
);

CREATE INDEX idx_review_property ON Reviews(property_id);

-- Message Table
CREATE TABLE Messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_message_sender ON Messages(sender_id);
CREATE INDEX idx_message_recipient ON Messages(recipient_id);
