# PostgreSQL Data Types Reference

A comprehensive guide to PostgreSQL data types.

## 1. Integers

- `smallint` (int2) - 2 bytes
- `integer` (int4) - 4 bytes
- `bigint` (int8) - 8 bytes

## 2. Arbitrary Precision

- `decimal` / `numeric`
  - `numeric(5,2)` → Examples: 6.99, 431.18
  - `numeric` → Unlimited precision

## 3. Floating-Point

- `real` (float4) - 6 decimal digits precision
- `double precision` (float8) - 15 decimal digits precision

## 4. Serial Types

Auto-incrementing integer types:

- `smallserial` (2 bytes)
- `serial` (4 bytes)
- `bigserial` (8 bytes)

## 5. Monetary Types

- `money` (8 bytes) - Fixed decimal precision of 2

## 6. Character Types

- `character varying(n)` / `varchar(n)` - Variable length, flexible
- `character(n)` / `char(n)` - Fixed length

## 7. Binary Data Type

- `bytea` - Binary data storage

## 8. Date/Time Types

- `timestamp` - Date and time without time zone
- `timestamptz` - Date and time with time zone
- `date` - Calendar date
- `time` - Time of day
- `interval` - Time span

### Interval Fields

- `YEAR`
- `MONTH`
- `DAY`
- `HOUR`
- `MINUTE`
- `SECOND`
- `YEAR TO MONTH`
- `DAY TO HOUR`
- `DAY TO MINUTE`
- `DAY TO SECOND`
- `HOUR TO MINUTE`
- `HOUR TO SECOND`
- `MINUTE TO SECOND`

## 9. Boolean Type

- `boolean` / `bool` - Supports: true, false, null
  - Also accepts: 1, 0, t, f

## 10. Enumerated Type

- `enum` - User-defined enumerated type

## 11. Text Search Types

- `tsvector` - Text search document
- `tsquery` - Text search query

## 12. UUID Type

- `uuid` - Universally Unique Identifier

## 13. XML Type

- `xml` - XML data storage

## 14. JSON Types

- `json` - JSON data (text storage)
- `jsonb` - JSON data (binary storage, more efficient)

## 15. Arrays

Any PostgreSQL data type can be defined as an array.

Example: `integer[]`, `text[]`, `numeric[][]`
