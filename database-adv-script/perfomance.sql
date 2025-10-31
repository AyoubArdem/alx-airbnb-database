SELECT *
FROM Booking B
JOIN Property P ON B.property_id = P.property_id
JOIN User U ON B.user_id = U.user_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id;
