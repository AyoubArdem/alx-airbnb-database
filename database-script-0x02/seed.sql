
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role_name, created_at)
VALUES
  ('uuid-001', 'Ayoub', 'El Mansouri', 'ayoub@example.com', 'hashed_pw_1', '+212612345678', 'host', CURRENT_TIMESTAMP),
  ('uuid-002', 'Sara', 'Benali', 'sara@example.com', 'hashed_pw_2', '+212698765432', 'guest', CURRENT_TIMESTAMP),
  ('uuid-003', 'Admin', 'System', 'admin@airbnb.com', 'hashed_pw_3', NULL, 'admin', CURRENT_TIMESTAMP);


INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
  ('prop-001', 'uuid-001', 'Riad Marrakech', 'Traditional Moroccan riad with rooftop terrace.', 'Marrakech, Morocco', 75.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-002', 'uuid-001', 'Casablanca Loft', 'Modern loft near the beach.', 'Casablanca, Morocco', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('book-001', 'prop-001', 'uuid-002', '2025-11-01', '2025-11-05', 300.00, 'confirmed', CURRENT_TIMESTAMP),
  ('book-002', 'prop-002', 'uuid-002', '2025-12-10', '2025-12-12', 240.00, 'pending', CURRENT_TIMESTAMP);


INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay-001', 'book-001', 300.00, CURRENT_TIMESTAMP, 'paypal'),
  ('pay-002', 'book-002', 240.00, CURRENT_TIMESTAMP, 'credit_card');


INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev-001', 'prop-001', 'uuid-002', 5, 'Amazing stay! Loved the rooftop view.', CURRENT_TIMESTAMP),
  ('rev-002', 'prop-002', 'uuid-002', 4, 'Great location, but a bit noisy.', CURRENT_TIMESTAMP);


INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg-001', 'uuid-002', 'uuid-001', 'Hi Ayoub, is the riad available in November?', CURRENT_TIMESTAMP),
  ('msg-002', 'uuid-001', 'uuid-002', 'Yes, it’s available. I’ll send you the details.', CURRENT_TIMESTAMP);
