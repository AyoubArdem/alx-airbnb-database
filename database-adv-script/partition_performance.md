
##  Partitioning Performance Report

Project: ALX Airbnb Database  
Task: Partitioning Large Tables  
File: `partitioning.sql`  


### 1.  Partitioning Strategy

To optimize query performance on the large `Booking` table, we implemented **range partitioning** based on the `start_date` column.

Partitioning Logic:
```sql
CREATE TABLE Booking (
  booking_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status VARCHAR(30) CHECK(status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);
```

Partitions Created:
```sql
CREATE TABLE Booking_2023 PARTITION OF Booking
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
```



### 2.  Performance Testing

We compared query performance before and after partitioning using the following query:

```sql
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
```

Testing Method:
- Ran query on unpartitioned table
- Ran same query on partitioned table
- Used `EXPLAIN ANALYZE` to measure execution time and scan behavior


### 4.  Observations & Recommendations

- Partitioning by `start_date` significantly reduces scan time for date-range queries.
- Query planner automatically targets relevant partitions, improving efficiency.
- For best results, combine partitioning with indexing on `start_date`, `user_id`, and `property_id`.
- Consider automating future partition creation via scripts or triggers for scalability.
