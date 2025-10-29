# Index Optimization — Airbnb Clone SQL Scripts

##  Overview
This module focuses on optimizing SQL query performance by creating indexes on frequently accessed columns in the Airbnb clone database. Indexing improves query speed, especially for large datasets and high-traffic applications.

##  File Structure
- `index_performance.sql`: Contains SQL commands to create indexes on key columns.
- `README.md`: Documentation explaining indexing strategy and performance impact.

##  Learning Objectives
- Identify high-usage columns in relational tables.
- Apply appropriate indexing strategies (unique, full-text, composite).
- Measure performance improvements using `EXPLAIN` or `ANALYZE`.

##  Index Strategy

###  User Table
Purpose: Speed up lookups and enforce uniqueness.

```sql
-- Ensure email is unique and indexed
CREATE UNIQUE INDEX email_index ON User(email);

-- Index user_id for faster joins and filters
CREATE INDEX user_id_index ON User(user_id);
```

---

### Property Table
Purpose: Improve search and filtering performance.

```sql
-- Full-text index for efficient keyword search in descriptions
CREATE FULLTEXT INDEX description_index ON Property(description);

-- Composite index for location-based queries and property lookups
CREATE INDEX property_location_index ON Property(property_id, location);
```



### Booking Table
Purpose: Optimize booking retrieval and joins.

```sql
-- Index booking_id for fast access and joins
CREATE INDEX booking_id_index ON Booking(booking_id);
```



##  Performance Testing
Use the following commands to measure query performance before and after indexing:

```sql
EXPLAIN SELECT * FROM Booking WHERE booking_id = '...';
EXPLAIN SELECT * FROM Property WHERE location = '...';
```


##  Notes
- Indexes improve read performance but may slightly impact write speed.
- Use composite indexes only when queries frequently filter by multiple columns.
- Full-text indexes are ideal for search features but require engine support (e.g., MySQL or PostgreSQL ).

