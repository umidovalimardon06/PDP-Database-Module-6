# Transaction va Isolation – Konspekt

---

## Transaction

* collection of queries
* one unit of work

Masalan: account deposit (SELECT, UPDATE)

---

## Properties of transaction (ACID)

### Atomicity

* all queries must succeed
* agar bittasi xato bo‘lsa → rollback

---

### Consistency

* transaction DB rules yoki constraints’ni buzmasligi kerak
* valid DB → transaction → valid DB

2 types:

* consistency in data
* consistency in reading

---

### Isolation

* transactions bir vaqtning o‘zida ishlaydi
* lekin bir-biriga ta’sir qilmasligi kerak
* intermediate data ko‘rinmasligi kerak

read phenomena:

* dirty read
* non-repeatable read
* phantom read
* lost update

---

### Durability

* committed transaction must be persisted
* durable, non-volatile storage’da saqlanadi

---

## Read phenomena

### 1. Dirty read

* uncommitted data o‘qiladi

### 2. Non-repeatable read

* same query → different result
* data commit qilingan bo‘ladi

### 3. Phantom read

* new row insert bo‘ladi
* keyingi SELECT’da chiqib qoladi

### 4. Lost update

* two transactions same row’ni update qiladi
* last update oldingisini override qiladi

---

## Isolation levels

1. Read Uncommitted

* dirty read possible

2. Read Committed

* dirty read ❌

3. Repeatable Read

* dirty read ❌
* non-repeatable read ❌

4. Serializable (highest)

* all problems ❌

---

## Example (Dirty read)

SALES table:

* pid | qnt | price
* p1  | 10  | 5$
* p2  | 20  | 4$

T1:
BEGIN;
UPDATE sales SET qnt = qnt - 5 WHERE pid = 1;
-- not committed

T2:
SELECT SUM(qnt * price) FROM sales;
→ dirty read

---

## Example (Account)

Account table:

* id | name | balance
* 1  | Ali  | 100
* 2  | Vali | 75

1. SELECT balance FROM account WHERE id = 1 OR id = 2;
2. UPDATE account SET balance = balance - 100 WHERE id = 1;
3. UPDATE account SET balance = balance + 100 WHERE id = 2;

---

## Note

* isolation va atomicity → consistency’ga xizmat qiladi
* noto‘g‘ri isolation → inconsistency

---

(this README pro darajada bezatilmagan, aynan konspekt ko‘rinishida qoldirilgan)
