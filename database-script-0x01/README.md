
# 🏡 Property Rental Platform – Database Schema

This project defines a normalized relational database schema for a property rental platform (e.g., Airbnb clone), supporting users, property listings, bookings, payments, reviews, and messaging.

---

## 📌 Objectives

- Apply **database normalization** up to **Third Normal Form (3NF)**.
- Ensure data **integrity**, **performance**, and **extensibility**.
- Define SQL `CREATE TABLE` statements with **proper constraints and indexes**.

---

## 🗂️ Entity Descriptions

### 🧑‍💼 Users

Stores platform users (guests, hosts, admins).

| Column        | Type     | Description                             |
|---------------|----------|-----------------------------------------|
| `user_id`     | UUID     | Primary key                             |
| `first_name`  | VARCHAR  | Not null                                |
| `last_name`   | VARCHAR  | Not null                                |
| `email`       | VARCHAR  | Unique, Indexed                         |
| `password_hash` | VARCHAR | Not null                               |
| `phone_number`| VARCHAR  | Optional                                |
| `role`        | ENUM     | One of: `guest`, `host`, `admin`       |
| `created_at`  | TIMESTAMP| Default: current timestamp              |

---

### 🏠 Properties

Represents properties hosted by users.

| Column           | Type     | Description                             |
|------------------|----------|-----------------------------------------|
| `property_id`    | UUID     | Primary key                             |
| `host_id`        | UUID     | Foreign key → `Users(user_id)`          |
| `name`           | VARCHAR  | Not null                                |
| `description`    | TEXT     | Not null                                |
| `location`       | VARCHAR  | Not null                                |
| `price_per_night`| DECIMAL  | Not null                                |
| `created_at`     | TIMESTAMP| Default: current timestamp              |
| `updated_at`     | TIMESTAMP| Auto-updated on modification            |

---

### 📅 Bookings

Reservations made by users for properties.

| Column        | Type     | Description                              |
|---------------|----------|------------------------------------------|
| `booking_id`  | UUID     | Primary key                              |
| `property_id` | UUID     | Foreign key → `Properties(property_id)`  |
| `user_id`     | UUID     | Foreign key → `Users(user_id)`           |
| `start_date`  | DATE     | Not null                                 |
| `end_date`    | DATE     | Must be greater than `start_date`        |
| `total_price` | DECIMAL  | Not null                                 |
| `status`      | ENUM     | `pending`, `confirmed`, `canceled`       |
| `created_at`  | TIMESTAMP| Default: current timestamp               |

---

### 💳 Payments

Tracks payments for bookings.

| Column          | Type     | Description                              |
|------------------|----------|------------------------------------------|
| `payment_id`     | UUID     | Primary key                              |
| `booking_id`     | UUID     | Foreign key → `Bookings(booking_id)`     |
| `amount`         | DECIMAL  | Not null                                 |
| `payment_date`   | TIMESTAMP| Default: current timestamp               |
| `payment_method` | ENUM     | `credit_card`, `paypal`, `stripe`        |

---

### ⭐ Reviews

User reviews of properties.

| Column        | Type     | Description                              |
|---------------|----------|------------------------------------------|
| `review_id`   | UUID     | Primary key                              |
| `property_id` | UUID     | Foreign key → `Properties(property_id)`  |
| `user_id`     | UUID     | Foreign key → `Users(user_id)`           |
| `rating`      | INTEGER  | Value from 1 to 5                        |
| `comment`     | TEXT     | Not null                                 |
| `created_at`  | TIMESTAMP| Default: current timestamp               |

**Note:** One review per user per property is enforced with a unique constraint on `(user_id, property_id)`.

---

### 💬 Messages

User-to-user communication (e.g., host ↔ guest).

| Column         | Type     | Description                              |
|----------------|----------|------------------------------------------|
| `message_id`   | UUID     | Primary key                              |
| `sender_id`    | UUID     | Foreign key → `Users(user_id)`           |
| `recipient_id` | UUID     | Foreign key → `Users(user_id)`           |
| `message_body` | TEXT     | Not null                                 |
| `sent_at`      | TIMESTAMP| Default: current timestamp               |

---

## 🔐 Integrity & Indexing

- **Primary keys**: All tables use UUIDs.
- **Foreign keys**: Enforced to ensure referential integrity.
- **Indexes**:
  - `Users.email`
  - `Bookings.property_id`, `Bookings.booking_id`
  - `Payments.booking_id`
  - `Reviews.property_id`
  - `Messages.sender_id`, `Messages.recipient_id`

---

## 📊 Normalization Analysis (3NF)

| Normal Form | Status | Explanation |
|-------------|--------|-------------|
| **1NF**     | ✅     | All values are atomic                        |
| **2NF**     | ✅     | No partial dependencies (no composite keys) |
| **3NF**     | ✅     | No transitive dependencies                  |

- `total_price` and `amount` are retained intentionally for traceability and performance, not denormalization.

---

## 📁 Files

- [`normalized_property_schema.sql`](./normalized_property_schema.sql): SQL file to create all tables and indexes.

---

## 🛠 Usage

You can execute the SQL file in any RDBMS supporting:
- UUID
- Standard SQL constraints
- ENUMs (or emulate them with `CHECK` in MySQL/PostgreSQL)

> Adjust ENUM syntax as needed for your SQL engine (e.g., use `CHECK (...)` in MySQL/PostgreSQL if native ENUMs are not supported).

---

## 📬 Contributions

Feel free to fork the repo and enhance the schema (e.g., add availability calendars, property images, admin logs, etc.).

---
