
# Booking Table Partitioning Report

## 🎯 Objective

Optimize query performance on the `bookings` table by applying range partitioning on the `start_date` column.

---

## 🧱 Partition Strategy

- **Type**: Range Partitioning
- **Partition Key**: `start_date`
- **Granularity**: Monthly (January–March 2024)
- **SQL File**: `partitioning.sql`

---

## ⚡ Performance Comparison

### Sample Query:
```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-01-31';
