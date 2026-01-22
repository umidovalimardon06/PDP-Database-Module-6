-- IN,OUT,INOUT parameters and TRIGGER:
CREATE OR REPLACE FUNCTION out_increment(score int,OUT param int)
AS $$
    DECLARE
    BEGIN
       param:=score+1;
    END;
$$ LANGUAGE plpgsql;
SELECT out_increment(1);

-- -------------------------------
CREATE OR REPLACE FUNCTION increase_salary(INOUT salary int)
AS $$
    BEGIN
        salary = increase_salary.salary * 1.1;
    END;
$$ LANGUAGE plpgsql;
SELECT increase_salary(10);

-- OUT-TASKS-1:
CREATE OR REPLACE FUNCTION score(marks int,OUT grade int)
AS $$
    DECLARE
    BEGIN
        IF (marks>=90) then grade:=10;
        ELSEIF (marks>=70) then grade:=8;
        ELSE grade:=5;
        END IF;
    END;
$$ LANGUAGE plpgsql;

SELECT score(100);

-- TASK-2
CREATE OR REPLACE FUNCTION tax_net(salary numeric,out tax numeric,out net_salary numeric)
AS $$
    BEGIN
        tax = salary * 1.12 - salary;
        net_salary = salary - tax;
    END;
$$ LANGUAGE plpgsql;

SELECT tax_net(100);


-- TASK-3
DROP FUNCTION initials(fullName TEXT);
CREATE OR REPLACE FUNCTION initials(fullName TEXT,OUT initials TEXT)
AS $$
    BEGIN
        initials := initcap(fullName);
    END;
$$ LANGUAGE plpgsql;

SELECT initials('Your function is almost correct,' ||
                ' but there is a syntax error in the conditional logic.');

-- INOUT tasks:
-- TASK-4
CREATE OR REPLACE FUNCTION counter(INOUT num int)
AS  $$
    BEGIN
        num := num + 1;
    END;
$$ LANGUAGE plpgsql;

SELECT counter(0);

-- TASK-5:
CREATE OR REPLACE FUNCTION salary_adjustment(INOUT salary numeric)
AS $$
    BEGIN
       IF salary<4000 then salary := salary+800;
       ELSE salary := salary+500;
       END IF;
    END;
$$ LANGUAGE plpgsql;

SELECT salary_adjustment(10000);

-- TASK-6:
CREATE OR REPLACE FUNCTION formal(INOUT username TEXT)
AS $$
    BEGIN
       username := upper(username);
       username := concat(username,'_USER');
    END;
$$ LANGUAGE plpgsql;

SELECT formal('TOKYO');


-- TRIGGERS ---------------------------------
CREATE TABLE crud(
    id serial primary key ,
    name varchar(20) not null unique ,
    created_at TIMESTAMP not null ,
    updated_at TIMESTAMP not null
);

SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'crud';


CREATE OR REPLACE FUNCTION set_created_at()
RETURNS TRIGGER
AS $$
    BEGIN
       NEW.created_at:=NOW();
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_created_at
    BEFORE INSERT
    ON crud
    FOR EACH ROW
EXECUTE FUNCTION set_created_at();

INSERT INTO crud(name)
values ('Ali'),
       ('Xoshim'),
       ('Tokyo');















