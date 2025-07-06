
# ⚙️ Database Query Optimization Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments such as adding indexes or restructuring queries.

---

## 📌 Frequently Used Queries Analyzed

### 1. Bookings with User and Property Details
```sql
SELECT b.booking_id, u.name, p.title, b.start_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-03-01';
