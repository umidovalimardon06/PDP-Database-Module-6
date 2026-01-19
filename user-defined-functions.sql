CREATE FUNCTION rand_num(min int,max int) RETURNS int AS
$$
    declare
        res int;
    begin
        res := round(random() * (max-min) + min );
        return res;
    end;
$$ LANGUAGE plpgsql;

SELECT rand_num(1,10);

-- -----------------------------------------------------------

CREATE FUNCTION transaction_statistics(
    out min numeric,
    out max numeric,
    out avg numeric,
    out sum numeric
) AS $$
    declare
    begin
        select min(investments.amount),max(investments.amount),avg(amount),sum(amount)
        into min,max,avg,sum
        from  investments;
    end;
$$ language plpgsql;

SELECT * FROM transaction_statistics();

-- -------------------------------------------------------------
CREATE FUNCTION get_max(a int,b int) RETURNS INT AS
$$
    DECLARE
    BEGIN
        if (a>b) then return a;
        else return b;
        end if;
    END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION get_max(a int,b int,c int) RETURNS INT AS
$$
    DECLARE
        res int;
    BEGIN
        res := a;
        if (b>a) then res:=b; end if;
        if (c>b) then res:=c; end if;
        return res;
    END;
$$ LANGUAGE plpgsql;


SELECT get_max(10,11);
SELECT get_max(10,11,13);













