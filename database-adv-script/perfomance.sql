SELECT *
FROM Booking B
JOIN Property P ON B.property_id = P.property_id
JOIN User U ON B.user_id = U.user_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id
WHERE B.status = 'confirmed'
  AND P.location = 'Casablanca';
 

EXPLAIN ANALYZE
SELECT 
    B.booking_id, B.start_date, B.status,
    U.name, P.title, P.location,
    Pay.amount, Pay.status
FROM Booking B
JOIN Property P ON B.property_id = P.property_id
JOIN User U ON B.user_id = U.user_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id
WHERE B.status = 'confirmed'
  AND P.location = 'Casablanca';
