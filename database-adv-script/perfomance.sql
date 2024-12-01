-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details 
-- Before optimization
SELECT * FROM booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
JOIN payment ON booking.booking_id = payment.booking_id;

EXPLAIN ANALYZE SELECT * FROM booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
JOIN payment ON booking.booking_id = payment.booking_id;

-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
SELECT * FROM booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
JOIN payment ON booking.booking_id = payment.booking_id