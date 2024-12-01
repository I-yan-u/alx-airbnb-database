-- Assume the Booking table is large and query performance is slow.
-- Implement partitioning on the Booking table based on the start_date column.
-- The partitioning strategy is RANGE based on the year of the start_date column.
SELECT * FROM Booking;
-- Create a partitioned table named Booking_partitioned.
CREATE TABLE Booking_partitioned (
    booking_id INT PRIMARY KEY,
    property_id INT,
    user_id INT,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL(10, 2),
    status ENUM('pending', 'confirmed', 'canceled'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p0 VALUES LESS THAN (2010),
    PARTITION p1 VALUES LESS THAN (2011),
    PARTITION p2 VALUES LESS THAN (2012),
    PARTITION p3 VALUES LESS THAN (2013),
    PARTITION p4 VALUES LESS THAN (2014),
    PARTITION p5 VALUES LESS THAN (2015),
    PARTITION p6 VALUES LESS THAN (2016),
    PARTITION p7 VALUES LESS THAN (2017),
    PARTITION p8 VALUES LESS THAN (2018),
    PARTITION p9 VALUES LESS THAN (2019),
    PARTITION p10 VALUES LESS THAN (2020)
);
