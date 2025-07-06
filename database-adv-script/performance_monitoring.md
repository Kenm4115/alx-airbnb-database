
# 📈 Performance Monitoring & Optimization Report

## 🎯 Objective

Continuously monitor and improve query performance through execution plan analysis and schema tuning.

---

## 🧪 Analyzed Queries

### Query 1:
```sql
SELECT b.booking_id, u.name, p.title, b.start_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-03-01';
