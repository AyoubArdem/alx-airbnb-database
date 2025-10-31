# Performance Monitoring Report

Project: ALX Airbnb Database  
Task: Monitor and Refine Database Performance  
File: `performance_monitoring.md`  


## 1.  Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.



## 2.  Monitoring Tools Used

###  SQL Commands
- `EXPLAIN ANALYZE`: Used to inspect actual query execution plans, row estimates, and index usage.
- `ANALYZE`: Refreshes planner statistics to improve query optimization.
- `SHOW PROFILE`: (MySQL only) Used to break down query execution stages.



## 3.  Bottleneck Identification

###  Queries Tested

```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE booking_id = '123e4567-e89b-12d3-a456-426614174000';

EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'Casablanca';
```

###  Observations

| Query                                | Bottleneck                  | Notes                          |
|--------------------------------------|-----------------------------|--------------------------------|
| Booking by `booking_id`              | Sequential scan             | Index missing or unused        |
| Property by `location`               | Full table scan             | No index on `location` column  |



## 4. Schema Adjustments

###  Indexes Added

```sql
-- User table
CREATE UNIQUE INDEX email_index ON User(email);
CREATE INDEX user_id_index ON User(user_id);

-- Property table
CREATE FULLTEXT INDEX description_index ON Property(description);
CREATE INDEX property_location_index ON Property(property_id, location);

-- Booking table
CREATE INDEX booking_id_index ON Booking(booking_id);
```



```sql
ANALYZE Booking;
ANALYZE Property;
ANALYZE User;
```

## 6.  Recommendations

- Continue using `EXPLAIN ANALYZE` for all high-traffic queries.
- Automate `ANALYZE` runs periodically to keep planner statistics fresh.
- Consider partitioning large tables and using materialized views for frequent joins.
- Monitor slow queries using database logs or profiling tools.
