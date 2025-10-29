

#  Aggregations and Window Functions — Airbnb Clone SQL Scripts

##  Overview
This module demonstrates how to use SQL aggregation and window functions to analyze booking and property data in the Airbnb clone database. It includes queries that summarize user activity and rank properties based on popularity.

##  File Structure
- `aggregations_and_window_functions.sql`: Contains SQL queries using `GROUP BY`, `COUNT`, and window functions like `RANK()`.
- `README.md`: Documentation and explanation of each query.

##  Learning Objectives
- Apply aggregation functions (`COUNT`, `SUM`, etc.) to summarize data.
- Use window functions (`RANK`, `ROW_NUMBER`) for advanced analytics.
- Understand how to combine joins and grouping for meaningful insights.

##  Query Breakdown

### Total Bookings per User
Goal:Count how many bookings each user has made.

Query:
```sql
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;
```

Explanation:
- Aggregates bookings by `user_id`.
- Useful for identifying active users and usage patterns.



### Ranking Properties by Booking Volume
Goal: Rank properties based on the number of bookings they’ve received.

Query:
```sql
SELECT 
    p.property_id,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id;
```

Explanation:
- `LEFT JOIN` ensures properties with zero bookings are included.
- `COUNT()` calculates total bookings per property.
- `RANK()` assigns a rank based on booking count, handling ties.

---



##  Usage
Run the queries in your SQL environment to:
- Analyze user engagement
- Rank listings by popularity
- Prepare insights for dashboards or reports
