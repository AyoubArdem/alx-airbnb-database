

#   Advanced SQL Scripts for Airbnb Clone

##  Overview
This script contains advanced SQL queries designed to extract meaningful insights from the Airbnb clone database. It focuses on uncorrelated subqueries and correlated subqueries to demonstrate deeper data relationships and filtering logic.

##  File Structure
- `subqueries.sql`: Contains SQL queries using subqueries and correlated subqueries.
- `README.md`: Documentation and explanation of each query.

##  Learning Objectives
- Practice writing subqueries to filter and aggregate data.
- Understand and implement correlated subqueries for row-by-row evaluation.
- Strengthen SQL logic for real-world database analysis**.

##  Query Breakdown

###  Properties with High Ratings
Goal: Retrieve all properties where the average rating is greater than 4.0.

**Technique:** Use a subquery to calculate the average rating per property, then filter based on the threshold.

```sql
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

### 2. Active Users with Frequent Bookings
Goal: Identify users who have made more than 3 bookings.

Technique: Use a correlated subquery to count bookings per user.

```sql
SELECT u.*
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
```


##  Usage
Run the queries in your preferred SQL environment to test and validate results. These examples are ideal for:
- Data analysis practice
- Backend logic testing

