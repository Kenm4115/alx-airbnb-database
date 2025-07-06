# 📘 SQL Practice: Joins, Subqueries, Aggregation & Window Functions

## 📌 Overview

This project is aimed at developing expertise in writing advanced SQL queries using:

- Different types of **JOINs**
- **Correlated and non-correlated subqueries**
- **Aggregation** and **window functions** for data analysis

---

## 🔗 Objective 1: Master SQL Joins

### ✅ INNER JOIN – Bookings and Their Users
Retrieve all bookings and the respective users who made them.
```sql
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;
```

### ✅ LEFT JOIN – Properties and Reviews
Retrieve all properties and their reviews, including those with no reviews.
```sql
SELECT 
    p.property_id,
    p.title,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;
```

### ✅ FULL OUTER JOIN – Users and Bookings

**PostgreSQL:**
```sql
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.booking_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
```

**MySQL-compatible (using UNION to simulate FULL OUTER JOIN):**
```sql
SELECT u.user_id, u.name, b.booking_id, b.booking_date
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT u.user_id, u.name, b.booking_id, b.booking_date
FROM bookings b
LEFT JOIN users u ON u.user_id = b.user_id;
```

---

## 🔍 Objective 2: Subqueries

### ✅ Non-Correlated Subquery – Highly Rated Properties
Find all properties where the average rating is greater than 4.0.
```sql
SELECT 
    property_id,
    title,
    location
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

### ✅ Correlated Subquery – Users with > 3 Bookings
Find users who have made more than 3 bookings.
```sql
SELECT 
    u.user_id,
    u.name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
```

---

## 📊 Objective 3: Aggregation & Window Functions

### ✅ Total Number of Bookings per User
Use `COUNT()` and `GROUP BY` to find bookings per user.
```sql
SELECT 
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name;
```

### ✅ Rank Properties by Number of Bookings
Use a window function to rank properties based on bookings.
```sql
SELECT 
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY property_id
) AS booking_counts;
```

---

## ✅ Summary

| Task                     | Skill Demonstrated                     |
|--------------------------|----------------------------------------|
| SQL Joins                | INNER, LEFT, FULL OUTER JOINs          |
| Subqueries               | Correlated & non-correlated logic      |
| Aggregation              | COUNT + GROUP BY                       |
| Window Functions         | RANK(), ROW_NUMBER()                   |

---

## 📁 Suggested File Structure

```
├── joins_queries.sql
├── subqueries.sql
├── aggregation_window_functions.sql
├── README.md
```

---
