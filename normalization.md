
# Database Normalization: Third Normal Form (3NF)

## Objective
Ensure the database schema conforms to Third Normal Form (3NF) to eliminate redundancy, enhance data integrity, and optimize maintainability.

---

## What is 3NF?

A relational schema is in **Third Normal Form** if:
1. It is in **Second Normal Form (2NF)**.
2. It has **no transitive dependencies** (i.e., non-key columns must not depend on other non-key columns).

---

## Schema Review

### ✅ 1NF: Atomicity
- All fields contain only atomic values.
- No repeating groups or multi-valued fields.
- Each table has a clearly defined primary key.

### ✅ 2NF: Full Functional Dependency
- All non-key fields depend entirely on their respective primary keys.
- Since all primary keys are single-column (UUIDs), no partial dependencies exist.

### ✅ 3NF: No Transitive Dependency
All tables were examined for non-key → non-key dependencies. Summary:

- `User`: No transitive dependencies.
- `Property`: `host_id` references `User` correctly. No additional non-key dependencies.
- `Booking`: `total_price` is computed at booking time. No derived field from another non-key.
- `Payment`: `amount` may differ from booking total (e.g., installment, partial payment), so it’s retained as a separate field.
- `Review`: `rating` and `comment` are atomic, and dependent only on the review_id.
- `Message`: Clean mapping between sender, recipient, and message content.

---

## Design Justifications

- **Foreign Keys** are used for references without embedding redundant data (e.g., no user name duplication in messages or bookings).
- **Computed fields** like `total_price` are acceptable if used for consistency or accounting snapshots.
- **ENUMs** for fields like `role`, `status`, and `payment_method` enforce valid domain values.

---

## Conclusion

This schema satisfies **Third Normal Form (3NF)**:
- No redundant data storage.
- Logical separation of concerns across tables.
- Referential integrity is preserved via foreign keys.

No structural changes were needed to meet 3NF, but best practices (like avoiding unnecessary denormalization) were verified.

