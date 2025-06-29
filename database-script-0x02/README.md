
# 🏡 Property Rental Platform – Sample Data

This directory contains SQL scripts to populate the normalized property rental database with realistic sample data.

---

## 📂 Contents

- `sample_data_inserts.sql`: SQL script containing `INSERT` statements for:
  - Users
  - Properties
  - Bookings
  - Payments
  - Reviews
  - Messages

---

## 🎯 Purpose

The sample data is designed to:

- Simulate real-world use cases.
- Enable local testing of JOINs, constraints, and queries.
- Seed the database for frontend/backend development.

---

## 📄 Tables Populated

### 1. Users
- 3 users: Guest, Host, Admin
- Each with realistic info and unique UUIDs

### 2. Properties
- 2 listings created by the Host

### 3. Bookings
- 2 bookings by the Guest (1 confirmed, 1 pending)

### 4. Payments
- 1 payment record for the confirmed booking

### 5. Reviews
- 1 5-star review left by the Guest

### 6. Messages
- 2-way conversation between Guest and Host

---
