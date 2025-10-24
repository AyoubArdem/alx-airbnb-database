#  AirBnB Database Schema

##  Overview

This project defines a relational database schema for an AirBnB-style platform. It supports core features such as user management, property listings, bookings, payments, reviews, and messaging. The schema is designed with normalization principles up to Third Normal Form (3NF) to ensure data integrity, reduce redundancy, and support scalability.



## Schema Structure

### 👤 User
Stores information about all users (guests, hosts, admins).
- Unique identifier (`user_id`)
- Personal details (`first_name`, `last_name`, `email`, `phone_number`)
- Role management (`role_name`)
- Account creation timestamp

### 🏠 Property
Represents properties listed by hosts.
- Linked to a host via `host_id`
- Includes name, description, location, and price
- Tracks creation and update timestamps

### 📅 Booking
Captures reservations made by users.
- Linked to both `property_id` and `user_id`
- Includes booking dates, total price, and status
- Status options: `pending`, `confirmed`, `canceled`

### 💳 Payment
Handles transactions for bookings.
- Linked to `booking_id`
- Includes amount, payment method, and timestamp
- Payment methods: `credit_card`, `paypal`, `stripe`

### ⭐ Review
Allows users to leave feedback on properties.
- Linked to both `property_id` and `user_id`
- Includes rating (1–5) and comment
- Timestamped for tracking

### 💬 Message
Enables messaging between users.
- Sender and recipient linked via foreign keys
- Includes message content and timestamp




##  Integrity & Constraints

- UUIDs used for all primary keys
- Foreign key constraints enforce relational integrity
- `CHECK` constraints simulate ENUM behavior
- `UNIQUE` constraint on user email
- Timestamps track creation and updates

