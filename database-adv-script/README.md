
#  SQL Join Queries — Airbnb Clone Database

This document explains the SQL queries written to demonstrate INNER JOIN, LEFT JOIN, and FULL OUTER JOIN operations in the Airbnb Clone database. These queries are designed to extract meaningful relationships between users, bookings, and properties.



##  Objective

To master SQL joins by writing complex queries that:
- Link users to their bookings
- Show all properties with or without bookings
- Display all users and all bookings, even if not connected



##  Files

```
database-adv-script/
├── joins_queries.sql
└── README.md
```



##  Queries and Their Purpose

###  INNER JOIN — Bookings with Users

```sql
SELECT U.first_name, U.last_name, B.booking_id, B.start_date, B.end_date, B.total_price
FROM Booking B
INNER JOIN User U ON U.user_id = B.user_id;
```

####  Purpose
- Retrieves only bookings that are linked to a valid user.
- Useful for generating booking reports or user activity logs.

#### Output
- User’s first and last name
- Booking ID, start and end dates, total price



###  LEFT JOIN — Properties with Bookings

```sql
SELECT P.property_id, P.name, P.description, P.location, P.price_per_night,
       B.booking_id, B.start_date, B.end_date, B.total_price
FROM Property P
LEFT JOIN Booking B ON P.property_id = B.property_id;
```

####  Purpose
- Retrieves all properties, including those that have never been booked.
- Useful for identifying unbooked listings or analyzing property performance.

####  Output
- Property details (ID, name, description, location, price)
- Booking details (if any)



###  FULL OUTER JOIN — All Users and All Bookings

```sql
SELECT U.first_name, U.last_name, B.booking_id, B.start_date, B.end_date, B.total_price
FROM Booking B
FULL OUTER JOIN User U ON U.user_id = B.user_id;
```

####  Purpose
- Retrieves all users and all bookings, even if they are not linked.
- Useful for auditing orphaned bookings or inactive users.

#### Output
- User name (if available)
- Booking details (if available)



##  Usage

These queries support:
- Backend analytics and reporting
- Data integrity checks
- Feature development for dashboards and admin tools


