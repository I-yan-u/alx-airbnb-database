CREATE INDEX idx_user_id_email ON user(user_id, email);
CREATE INDEX idx_user_created_at ON user(created_at);
CREATE INDEX idx_property_ids ON property(property_id, host_id);
CREATE INDEX idx_property_created_at ON property(created_at);
CREATE INDEX idx_booking_ids ON booking(booking_id, property_id, user_id);
CREATE INDEX idx_booking_created_at ON booking(created_at);