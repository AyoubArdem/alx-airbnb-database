-- User table
CREATE UNIQUE INDEX email_index ON User(email);
CREATE INDEX user_id_index ON User(user_id);

-- Property table
CREATE FULLTEXT INDEX description_index ON Property(description);
CREATE INDEX property_location_index ON Property(property_id, location);

-- Booking table
CREATE INDEX booking_id_index ON Booking(booking_id);


EXPLAIN SELECT * FROM Booking WHERE booking_id = '...';
EXPLAIN SELECT * FROM Property WHERE location = '...';
