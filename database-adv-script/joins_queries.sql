-- Inner join
SELECT booking.booking_id, user.user_id FROM booking
INNER JOIN user ON booking.user_id = user.user_id;

-- Left join
SELECT property.property_id, review.rating FROM property
LEFT JOIN review ON property.property_id = review.property_id;

-- Full outer join
SELECT * FROM user
FULL  JOIN booking ON user.user_id = booking.user_id;