CREATE TABLE User (
    user_id VARCHAR(64) PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL
    email VARCHAR(64) UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    phone_number VARCHAR(16),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Property (
    property_id VARCHAR(64) PRIMARY KEY,
    host_id VARCHAR(64),
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(64) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);


CREATE TABLE Booking (
    booking_id VARCHAR(64) PRIMARY KEY,
    property_id VARCHAR(64) UNIQUE,
    user_id VARCHAR(64),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Payment (
    payment_id VARCHAR(64) PRIMARY KEY,
    booking_id VARCHAR(64) UNIQUE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);


CREATE TABLE Review (
    review_id VARCHAR(64) PRIMARY KEY,
    property_id VARCHAR(64),
    user_id VARCHAR(64),
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Message (
    message_id VARCHAR(64) PRIMARY KEY,
    sender_id VARCHAR(64),
    recipient_id VARCHAR(64),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);