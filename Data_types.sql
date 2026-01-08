DROP TABLE IF EXISTS ARBITRARY_EXAMPLE;

CREATE TABLE ARBITRARY_EXAMPLE(
    id numeric primary key , -- unlimited
    name varchar(15) not null unique
);

INSERT INTO ARBITRARY_EXAMPLE(id, name)
VALUES(90899999989.99954654132548784111231,'Solo');


CREATE TABLE MONEY_EXAMPLE(
    id smallserial primary key ,
    emp_name varchar(15) not null unique ,
    salary money unique not null
);

INSERT INTO MONEY_EXAMPLE(EMP_NAME, SALARY)
VALUES ('ALI',1000.1050);

INSERT INTO MONEY_EXAMPLE(EMP_NAME, SALARY)
VALUES ('TOKYO','1000.732'::money);

CREATE TABLE BYTEA_EXAMPLE(
    id smallserial primary key ,
    jpg bytea not null unique
);

INSERT INTO BYTEA_EXAMPLE(jpg)
VALUES (E'\\x8974324E478312BA71');

SELECT CURRENT_TIMESTAMP;
SELECT now();

SET timezone to 'Asia/Tashkent';

CREATE TABLE timestamp_example(
    id smallserial primary key ,
    time timestamp not null
);

INSERT INTO timestamp_example(time)
VALUES (now() at time zone 'Asia/Tashkent');

DROP TABLE IF EXISTS timestampz_example;

CREATE TABLE timestamptz_example(
    id smallserial primary key ,
    time timestamptz not null
);

INSERT INTO timestamptz_example(time)
VALUES (now());

CREATE TABLE user_sessions (
                               session_id smallserial primary key ,
                               login_time timestamptz not null ,
                               expires_after interval
);

INSERT INTO user_sessions(LOGIN_TIME, EXPIRES_AFTER)
VALUES (now() at time zone 'Asia/Tashkent', INTERVAL '30 minutes');

truncate table user_sessions;

CREATE TABLE articles_ts_example(
    id smallserial primary key ,
    title varchar(100),
    body text not null ,
    tsv tsvector
);

INSERT INTO articles_ts_example (title, body)
VALUES
    ('PostgreSQL Tutorial', 'Learn how to use PostgreSQL full-text search effectively.'),
    ('Python Guide', 'Python programming language tutorial for beginners.'),
    ('Database Tips', 'Tips and tricks for managing SQL databases efficiently.');

UPDATE articles_ts_example
SET tsv = to_tsvector('english', coalesce(title,'') || ' ' || coalesce(body,''))
WHERE id = 3;

SELECT *
FROM articles_ts_example
WHERE tsv @@ to_tsquery('english', 'Python | tips');

CREATE TABLE UUID_EXAMPLE(
    ID uuid default gen_random_uuid(),
    name character varying(20) not null
);

INSERT INTO UUID_EXAMPLE(name)
VALUES ('TOKYO TOP'),
       ('FAYZIE TOP');

CREATE TYPE enum_example as enum('VALUE1','VALUE2','VALUE3');

CREATE TABLE enum_table_example(
    id smallserial primary key ,
    enum enum_example not null
);

INSERT INTO enum_table_example(enum)
VALUES ('VALUE2'),
       ('VALUE3');

CREATE TABLE XML_EXAMPLE(
    id smallserial primary key ,
    info xml not null
);

INSERT INTO XML_EXAMPLE (info)
VALUES (
           '<employee>
               <name>John Doe</name>
               <department>IT</department>
               <salary>60000</salary>
            </employee>'
);

CREATE TABLE JSONB_EXAMPLE(
    id smallserial primary key ,
    info jsonb
);

INSERT INTO JSONB_EXAMPLE(info)
VALUES ('{
  "name": "John Doe",
  "department": "IT",
  "salary": 60000,
  "skills": ["SQL", "PostgreSQL", "Python"]
}'::jsonb);

SELECT info->>'name' AS NAME FROM JSONB_EXAMPLE;

-- -> retrieves as json
-- >> retrieves as text

CREATE TABLE ARRAY_EXAMPLE(
    id smallserial primary key ,
    student_name varchar(20) not null ,
    courses varchar(25)[] not null unique ,
    grades real[] not null
);

INSERT INTO ARRAY_EXAMPLE(STUDENT_NAME, COURSES, GRADES)
VALUES ('TOKYO',ARRAY['MATH','HISTORY','ICT'],
        ARRAY[70.5,65.1,90.7]) ;




