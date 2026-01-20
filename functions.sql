-- FUNCTIONS
SELECT * FROM investments;
CREATE OR REPLACE FUNCTION searchNameById(id int)
RETURNS VARCHAR
AS $$
    DECLARE
        name VARCHAR(30);
    BEGIN
        SELECT investments.investor_name INTO name
        FROM investments
        WHERE investments.id = searchNameById.id;
        RETURN name;
    END;
$$ LANGUAGE plpgsql;
SELECT searchNameById(77);


SELECT * FROM loans;



-- task-1: Borrower-name lookup:
    DROP FUNCTION searchBorrowerNameById(loan_id int);
    CREATE OR REPLACE FUNCTION searchBorrowerNameById(loan_id int)
    RETURNS VARCHAR
    AS
    $$
        DECLARE
            borrower_name VARCHAR(50);
        BEGIN
            SELECT loans.borrower_full_name INTO borrower_name
            FROM loans
            WHERE loans.loan_id = searchBorrowerNameById.loan_id;
            RETURN borrower_name;
        END ;
    $$ LANGUAGE plpgsql;

SELECT searchBorrowerNameById(6);

-- task-2: passport exists check:
CREATE OR REPLACE FUNCTION checkPassport(pass_no varchar)
RETURNS BOOL
AS
$$
  DECLARE
      yes BOOL:=false;
      pass VARCHAR(20);
  BEGIN
      SELECT passport_no INTO pass FROM loans WHERE loans.passport_no=checkPassport.pass_no;
      if (pass=pass_no) then yes:=true;
      end if;
      RETURN yes;
  END ;
$$ LANGUAGE plpgsql;

SELECT checkPassport('AB1234517');


-- task-3: total active loans by region:
CREATE OR REPLACE FUNCTION totalActiveLoans(region VARCHAR(20))
RETURNS int
AS
$$
    DECLARE
        total int;
    BEGIN
        SELECT SUM(loans.loan_amount)
        INTO total
        FROM loans
        WHERE loans.region=totalActiveLoans.region
        AND status = 'ACTIVE';

        RETURN total;
    END;
$$ LANGUAGE plpgsql;

SELECT totalactiveloans('Samarqand');


-- task-4: List down all overdue loans:
CREATE OR REPLACE FUNCTION overdueLoans()
RETURNS TABLE(
    loan_id int,
    borrower_name varchar
) AS
$$
    DECLARE
    BEGIN
       RETURN QUERY
       SELECT
           loans.loan_id,
           loans.borrower_full_name
       FROM loans
       WHERE loans.status = 'OVERDUE';
    END ;
$$ LANGUAGE plpgsql;
SELECT overdueLoans();

-- task5:Loan risk category:
CREATE OR REPLACE FUNCTION loanRiskCategory(loan_amount numeric,interest_rate  numeric,term_months int)
RETURNS VARCHAR
AS
$$
    DECLARE
        risk VARCHAR(10);
    BEGIN
        IF (loan_amount >= 25000000 AND interest_rate >= 0.25 AND term_months <= 30) THEN
            risk := 'HIGH';
        ELSIF (loan_amount BETWEEN 10000000 AND 24999999
            OR interest_rate BETWEEN 0.18 AND 0.2499
            OR term_months BETWEEN 31 AND 48) THEN
            risk := 'MEDIUM';
        ELSE
            risk := 'LOW';
        END IF;
        RETURN risk;
    END;
$$ LANGUAGE plpgsql;

SELECT loanRiskCategory(10,10,10);

-- task6:Days remaining until due:
CREATE OR REPLACE FUNCTION untilDue(id INT)
    RETURNS INT
AS $$
DECLARE
    status VARCHAR;
    days INT;
BEGIN
    SELECT loans.status, (loans.due_at - current_date)
    INTO status, days
    FROM loans
    WHERE loans.loan_id = id;

    IF NOT FOUND THEN
        RETURN NULL;
    END IF;

    IF (status = 'OVERDUE') THEN
        RETURN days;   -- will be negative
    ELSE
        RETURN days;   -- positive or 0
    END IF;

END;
$$ LANGUAGE plpgsql;
SELECT untilDue(1);












