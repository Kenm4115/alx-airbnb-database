
# 📈 Index Performance Report

## ✅ Objective

Improve query performance by identifying high-usage columns and creating appropriate indexes on `users`, `bookings`, `properties`, and `reviews` tables.

---

## 🧠 Step 1: High-Usage Columns Identified

| Table       | Column         | Usage Context                         |
|-------------|----------------|----------------------------------------|
| `users`     | `user_id`      | JOIN with bookings, subquery filters   |
| `bookings`  | `user_id`      | JOIN with users                        |
|             | `property_id`  | JOIN with properties                   |
| `properties`| `property_id`  | Used in WHERE and subqueries           |
| `reviews`   | `property_id`  | GROUP BY, JOIN                         |
|             | `user_id`      | JOIN, filters                          |

---

## 🔨 Step 2: Indexes Created (in `database_index.sql`)

```sql
-- Indexes on users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Indexes on bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Indexes on properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Indexes on reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
