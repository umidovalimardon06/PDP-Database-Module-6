DROP TABLE investors;
DROP TABLE investments_gr;

CREATE TABLE investors
(
    investor_id   SMALLSERIAL PRIMARY KEY,
    investor_name VARCHAR(30) NOT NULL,
    country       VARCHAR(30) NOT NULL
);


CREATE TABLE investments_gr
(
    investment_id   INT PRIMARY KEY,
    investor_id     INT         NOT NULL,
    investment_type VARCHAR(50) NOT NULL,
    investment_date DATE,
    amount          DECIMAL(12, 2),
    FOREIGN KEY (investor_id) REFERENCES investors (investor_id)
);

INSERT INTO investors (investor_id, investor_name, country)
VALUES (1, 'Warren Buffett', 'USA'),
       (2, 'Ray Dalio', 'USA'),
       (3, 'Carl Icahn', 'USA'),
       (4, 'George Soros', 'USA'),
       (5, 'Peter Lynch', 'USA'),
       (6, 'Charlie Munger', 'USA'),
       (7, 'Michael Burry', 'USA'),
       (8, 'Bill Ackman', 'USA'),
       (9, 'Ken Griffin', 'USA'),
       (10, 'David Tepper', 'USA'),
       (11, 'Li Ka-shing', 'Hong Kong'),
       (12, 'Masayoshi Son', 'Japan'),
       (13, 'Rakesh Jhunjhunwala', 'India'),
       (14, 'Nassef Sawiris', 'Egypt'),
       (15, 'Roman Abramovich', 'Russia')
;

INSERT INTO investments_gr
    (investment_id, investor_id, investment_type, investment_date, amount)
VALUES (1, 1, 'Apple', '2023-01-10', 150000000),
       (2, 1, 'Coca-Cola', '2023-02-14', 98000000),
       (3, 1, 'American Express', '2023-03-20', 72000000),

       (4, 2, 'US Treasury Bonds', '2023-01-15', 200000000),
       (5, 2, 'Gold ETF', '2023-02-18', 85000000),
       (6, 2, 'S&P 500 Futures', '2023-03-25', 125000000),

       (7, 3, 'CVS Health', '2023-01-12', 65000000),
       (8, 3, 'Dell Technologies', '2023-02-09', 78000000),
       (9, 3, 'McDonalds', '2023-03-11', 54000000),

       (10, 4, 'Tesla', '2023-01-08', 90000000),
       (11, 4, 'Alphabet', '2023-02-22', 110000000),
       (12, 4, 'UK Government Bonds', '2023-03-30', 60000000),

       (13, 5, 'Amazon', '2023-01-17', 83000000),
       (14, 5, 'Meta Platforms', '2023-02-12', 47000000),

       (15, 6, 'BYD', '2023-01-21', 69000000),
       (16, 6, 'Bank of America', '2023-02-26', 91000000),

       (17, 7, 'GameStop', '2023-01-27', 35000000),
       (18, 7, 'US Housing Market', '2023-03-05', 58000000),

       (19, 8, 'Chipotle', '2023-01-09', 62000000),
       (20, 8, 'Hilton Hotels', '2023-02-15', 77000000),

       (21, 9, 'Citadel Securities', '2023-01-19', 130000000),
       (22, 9, 'Microsoft', '2023-03-01', 95000000),

       (23, 10, 'Energy Transfer', '2023-01-25', 88000000),
       (24, 10, 'Chevron', '2023-03-07', 104000000),

       (25, 11, 'CK Hutchison', '2023-01-11', 73000000),
       (26, 11, 'Zoom Video', '2023-02-20', 46000000),

       (27, 12, 'Alibaba', '2023-01-14', 120000000),
       (28, 12, 'Arm Holdings', '2023-02-28', 98000000),
       (29, 12, 'Uber', '2023-03-15', 67000000),

       (30, 13, 'Tata Motors', '2023-01-16', 55000000),
       (31, 13, 'Reliance Industries', '2023-02-23', 88000000),
       (32, 13, 'Titan Company', '2023-03-18', 42000000),

       (33, 14, 'Adidas', '2023-01-22', 76000000),
       (34, 14, 'LafargeHolcim', '2023-02-27', 93000000),

       (35, 15, 'Chelsea FC', '2023-01-05', 150000000),
       (36, 15, 'Evraz Group', '2023-02-10', 82000000),
       (37, 15, 'Russian Steel Bonds', '2023-03-22', 64000000),

       (38, 4, 'Netflix', '2023-04-02', 56000000),
       (39, 9, 'NVIDIA', '2023-04-10', 108000000),
       (40, 1, 'Occidental Petroleum', '2023-04-18', 87000000)
;


SELECT investor_id, sum(amount) AS total_invested
FROM investments_gr
GROUP BY investor_id
ORDER BY investor_id;

SELECT i.investor_name, sum(amount) AS total_invested
FROM investors i
         JOIN investments_gr inv
              ON i.investor_id = inv.investor_id
GROUP BY investor_name
ORDER BY i.investor_name;

SELECT investor_id
FROM investments_gr
GROUP BY investor_id
ORDER BY investor_id;


-- LESSON-4:
/*
    1.Data=grouping
    2.Aggregate-functions
    3.Union operations
    4.Views
    5. PL/PgSQL

*/


do
$$
    declare
    begin
        raise info 'I''mam Ali';
    end;
$$;

-- -------------------------------------------------

do
$$
    declare
        age       int  := 10;
        info_date date := current_date;
    begin
        raise info 'I''mam Ali, age %',age;
        raise info 'Info: %',info_date;
    end;
$$;

-- --------------------------------------------------

do
$$
    declare
        name      varchar(30);
        info_date date := current_date;
    begin
        select investor_name into name from investors where investor_id = 1;
        raise info 'So investor is %;',name;
        raise info 'Info: %',info_date;
    end;
$$;

-- -----------------------------------------------------


SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'investments_count';

SELECT *
FROM investors;


SELECT country, count(*)
FROM investors
GROUP BY country;


SELECT *
FROM investors;
SELECT *
FROM investments_gr;


-- TASK-1: total investment per investor:investor_id,total_amount

SELECT investor_id, sum(amount) as total_amount_invested
FROM investments_gr
GROUP BY investor_id
ORDER BY investor_id;

SELECT i.investor_name, sum(inv.amount) as total_amount
FROM investments_gr inv
         JOIN investors i
              ON i.investor_id = inv.investor_id
GROUP BY i.investor_name;

-- TASK-2: total investment per investment_type:investment_type,total_amount

SELECT investment_type, sum(amount)
FROM investments_gr
GROUP BY investment_type;

-- TASK-3: average investment per investor:investor_id,avg_amount

SELECT investor_id, round(avg(investments_gr.amount), 2)
FROM investments_gr
GROUP BY investor_id
ORDER BY investor_id;

SELECT i.investor_id, investor_name, round(avg(inv.amount), 2)
FROM investments_gr inv
         JOIN investors i
              ON i.investor_id = inv.investor_id
GROUP BY investor_name, i.investor_id
ORDER BY investor_id;

-- TASK-4: total investment amount per country:country,total_amount

SELECT i.country, sum(inv.amount) as total_investments
FROM investments_gr inv
         JOIN investors i on i.investor_id = inv.investor_id
GROUP BY country;

-- TASK-5: total investment amount per country:country,total_amount

SELECT i.country, count(inv.amount) as no_of_investments
FROM investments_gr inv
         JOIN investors i on i.investor_id = inv.investor_id
GROUP BY country;

-- TASK-6: investors who made more than 2 investments:country,total_amount

SELECT i.investor_name, count(inv.amount) as no_of_investments
FROM investments_gr inv
         JOIN investors i on i.investor_id = inv.investor_id
GROUP BY investor_name
HAVING count(inv.amount)>2;











