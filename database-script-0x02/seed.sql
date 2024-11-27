INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES ('0001', 'John', 'Doe', 'johndoe@gmail.com', 'password', '1234567890', 'admin');

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES ('0002', 'Jane', 'Doe', 'janedoe@gmail.com', 'password', '1234567890', 'host');

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES ('0003', 'Alice', 'Smith', 'alicesmith@gmail.com', 'password', '1234567890', 'guest');

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES ('0001', '0002', 'Cozy Cottage', 'A cozy cottage in the woods', '123 Main St', 100.00);

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES ('0002', '0002', 'Beach House', 'A beautiful beach house with ocean view', '456 Ocean Blvd', 200.00);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES ('0001', '0001', '0003', '2024-01-01', '2024-01-03', 200.00, 'confirmed');

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES ('0002', '0002', '0003', '2024-02-01', '2024-02-03', 400.00, 'pending');

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES ('0001', '0001', 200.00, '2024-01-01', 'credit_card');

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES ('0002', '0002', 400.00, '2024-02-01', 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES ('0001', '0001', '0003', 5, 'Great stay at the cozy cottage!');

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES ('0002', '0002', '0003', 4, 'Beautiful beach house with amazing ocean view!');