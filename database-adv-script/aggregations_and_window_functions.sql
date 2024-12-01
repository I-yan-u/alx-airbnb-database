-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT user_id, COUNT(booking_id) AS total_bookings
FROM booking
GROUP BY user_id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT property_id, COUNT(booking_id) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS property_rank
FROM booking
GROUP BY property_id;