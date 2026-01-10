# Database Sequences va Querying Data (SELECT)

## 📌 Sequence (Ketma-ketlik)

**Sequence** — bu database obyekt bo‘lib, u **unique** yoki **non-unique** butun sonlarni (`integer`) avtomatik tarzda generatsiya qilish uchun ishlatiladi. Odatda `PRIMARY KEY` yoki `ID` ustunlarida qo‘llaniladi.

### 🔹 Sequence yaratish sintaksisi

```sql
CREATE SEQUENCE sequence_name
    START WITH N
    INCREMENT BY M
    MINVALUE L
    MAXVALUE K
    CYCLE | NO CYCLE;
```

### 🔹 Asosiy parametrlar

* **START WITH (N)** – boshlang‘ich qiymat
* **INCREMENT BY (M)** – har safar oshish/qo‘shilish miqdori
* **MINVALUE (L)** – eng kichik qiymat
* **MAXVALUE (K)** – eng katta qiymat
* **CYCLE** – maksimal qiymatdan keyin qayta boshlaydi
* **NO CYCLE** – maksimal qiymatdan keyin to‘xtaydi

### 🔹 Sequence bilan jadval yaratish

```sql
CREATE TABLE table_name (
    id INT PRIMARY KEY DEFAULT nextval('sequence_name')
);
```

---

## 📌 Querying Data (Ma’lumotlarni so‘rash)

**Querying Data** — DBMS ga maxsus standart til (SQL) orqali ma’lumotlarni olish (retrieve qilish) jarayonidir.
Bu jarayonda **DML** ning **SELECT** komandasi ishlatiladi.

---

## 📌 SELECT komandasi

### 🔹 Barcha ustun va qatorlarni chiqarish

```sql
SELECT * FROM table_name;
```

### 🔹 Muayyan ustunlarni chiqarish

```sql
SELECT field1, field2 FROM table_name;
```

### 🔹 Fieldlarni birlashtirish (Concatenation)

```sql
SELECT field1 || ' text ' || field2 FROM table_name;
```

### 🔹 Alias (nom berish) orqali chiqarish

```sql
SELECT field AS alias_name FROM table_name;
```

### 🔹 Ma’lumotlarni tartiblash (ORDER BY)

```sql
SELECT field FROM table_name ORDER BY field ASC;
SELECT field FROM table_name ORDER BY field DESC;
```

* **ASC** – o‘sish tartibida
* **DESC** – kamayish tartibida

### 🔹 Natijani cheklash (LIMIT)

```sql
SELECT * FROM table_name LIMIT 10;
```

---

## 📌 WHERE va Filter Clause’lar

### 🔹 WHERE – shart bilan qidirish

```sql
SELECT * FROM table_name WHERE condition;
```

### 🔹 LIKE / ILIKE – pattern bo‘yicha qidirish

```sql
SELECT * FROM table_name WHERE field LIKE '%text%';
SELECT * FROM table_name WHERE field ILIKE '%text%';
```

* **LIKE** – katta/kichik harfni farqlaydi
* **ILIKE** – katta/kichik harfni farqlamaydi

### 🔹 IN / NOT IN

```sql
SELECT * FROM table_name WHERE field IN (1, 2, 3);
SELECT * FROM table_name WHERE field NOT IN (4, 5, 6);
```

---

## ✅ Xulosa

* **Sequence** avtomatik ID generatsiya qilish uchun ishlatiladi
* **SELECT** — ma’lumotlarni olish uchun asosiy buyruq
* **WHERE, LIKE, IN, ORDER BY, LIMIT** — data filter va tartiblashda ishlatiladi
