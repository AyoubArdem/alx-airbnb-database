SELECT U.first_name,U.last_name,B.booking_id,B.start_date,B.end_date,B.total_price FROM  Booking B  INNER JOIN  User U ON U.user_id = B.user_id;

SELECT P.property_id,P.name,P.description,P.location,P.price_per_night,B.booking_id,B.start_date,B.end_date,B.total_price FROM Property P LEFT JOIN Booking B ON P.property_id=B.property_id ORDER BY P.price_per_night;

SELECT U.first_name,U.last_name,B.booking_id,B.start_date,B.end_date,B.total_price FROM  Booking B  FULL OUTER JOIN  User U ON U.user_id = B.user_id;
