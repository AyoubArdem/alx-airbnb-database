#  Normalization Analysis

## 1. First Normal Form (1NF)
-  All attributes contain atomic values (no repeating groups or arrays).
-  Each table has a clear primary key.
-  No multivalued fields.

✅ The schema satisfies 1NF.


## 2. Second Normal Form (2NF)
-  All non-key attributes are fully functionally dependent on the primary key.
-  No partial dependencies (since all primary keys are single-column UUIDs).

✅ The schema satisfies 2NF.



## 3. Third Normal Form (3NF)
-  No transitive dependencies ( non-key attributes do not depend on other non-key attributes).
-  Each attribute describes only the entity it belongs to.

✅ The schema satisfies 3NF.
