
# Optimization Report

Project: ALX Airbnb Database  
Task: Optimize Complex Queries  
File: `perfomance.sql`  




## 1.  Initial Query Overview

```sql
SELECT *
FROM Booking B
JOIN Property P ON B.property_id = P.property_id
JOIN User U ON B.user_id = U.user_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id;
```

Purpose: Retrieve all bookings with associated user, property, and payment details.



## 2. Performance Analysis (`EXPLAIN` Output Summary)

| Observation         | Details                                                  |
|---------------------|----------------------------------------------------------|
|  Full Table Scans | Detected on `Booking`, `User`, and `Payment` tables      |
|  High Row Estimates | Joins produce large intermediate result sets             |
|  SELECT * Usage   | Increases I/O and memory footprint                        |
|  Join Order       | Booking → Property → User → Payment is logical but costly without indexes |



## 3.  Optimization Recommendations

###  Refactored Query

```sql
SELECT 
    B.booking_id, B.status,
    U.name AS user_name, U.email,
    P.title AS property_title, P.location,
    Pay.amount, Pay.status AS payment_status
FROM Booking B
JOIN Property P ON B.property_id = P.property_id
JOIN User U ON B.user_id = U.user_id
JOIN Payment Pay ON B.booking_id = Pay.booking_id;
```

###  Indexing Strategy

Ensure the following indexes exist:

- `Booking(user_id)`
- `Booking(property_id)`
- `Booking(booking_id)`
- `Payment(booking_id)`
- `Property(property_id)`
- `User(user_id)`

###  Query:

- Avoid `SELECT *` to reduce payload
- Use aliases and explicit columns for clarity
- Consider `LIMIT` during testing to reduce scan time




## 5.  Final Thoughts

This optimization significantly improves query performance and readability. Further improvements could include:

- Materialized views for frequent joins
- Partitioning large tables
- Caching strategies for high-traffic endpoints
```
