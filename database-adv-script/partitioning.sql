
-- partitioning.sql

-- Step 1: Drop original if needed
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 2: Create master partitioned table
CREATE TABLE bookings (
    booking_id     SERIAL PRIMARY KEY,
    user_id        INT,
    property_id    INT,
    booking_date   DATE,
    start_date     DATE NOT NULL,
    end_date       DATE
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (e.g., 2024 by month)
CREATE TABLE bookings_2024_01 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE bookings_2024_02 PARTITION OF bookings
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE bookings_2024_03 PARTITION OF bookings
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

-- Add more months/years as needed...
