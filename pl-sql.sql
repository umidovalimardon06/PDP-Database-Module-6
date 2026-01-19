do
$$
    declare
        a int := 1;
        b int := 20;
        c int := 30;
    begin
        if (a = b and b = c) then
            raise info '20 bal';
        elseif (a = b or b = c
            or (a != b && b != c and a = c)) then
            raise info '10 bal';
        else
            raise info '0 bal' ;
        end if;
    end;
$$;

do
$$
    declare
        a    int := 1;
        b    int := 20;
        c    int := 30;
        mid  int;
        high int;
        low  int;
    begin
        IF (a < b and a < c) then
            low := a;
        ELSEIF (b < a and b < c) then
            low := b;
        ELSE
            low := c;
        end if;
        IF (a > b and a > c) then
            high := a;
        ELSEIF (b > a and b > c) then
            high := b;
        ELSE
            high := c;
            raise info 'mid %',(a + b + c) - (high + low);
        end if;
    end;
$$;


do
$$
    declare
        a   int := 1;
        b   int := 2;
        c   int := 3;
        max int := a;
        min int := a;
    begin
        if (max < b) then max = b; end if;
        if (max < c) then max = c; end if;
        if (min < b) then min = b; end if;
        if (min < c) then min = b; end if;

        raise info 'Middle: %',(a + b + c) - (max + min);
    end;
$$;


do
$$
    declare
        num int := 234;
    begin
        if (num % 2 = 0) then
            raise info 'juft son';
        end if;
    end;
$$;

do
$$
    declare
        num  int := 234;
        p1   int;
        p10  int;
        p100 int;
    begin
        p1 := num % 10;
        p10 := num / 10 % 10;
        p100 := num / 100 % 10;
        raise info 'p100: %',p100;
        raise info 'p10: %',p10;
        raise info 'p1: %',p1;
    end;
$$;


do
$$
    declare
        a int := round(random() * 10);
        b int := round(random() * 10);
        operation varchar := '*';
        op varchar[] := array['+','-','/','*'];
    begin
        raise info 'a:%',a;
        raise info 'b:%',b;
        operation := op[round(random()*3+1)];
        raise info 'operation:%',operation;

        case operation
            when '+' then raise info 'sum, %',a+b;
            when '-' then raise info 'subtract, %',a-b;
            when '/' then raise info 'divide, %',a/b;
            when '*' then raise info 'multiple, %',a*b;
        else raise info 'operation not found';
        end case;
    end;
$$;


do
$$
    declare
        a  int := 0;
    begin
        loop
            if (a=1000) then exit ; end if;

            raise info 'a %',a;
            a:=a+1;
        end loop;
    end;
$$;
do
$$
    declare
        a  int := 0;
    begin
        loop
            if (a=1000) then exit ; end if;

            raise info 'a %',a;
            a:=a+1;
        end loop;
    end;
$$;

do
$$
    declare
        a  int := 0;
        p1 int;
        p10 int;
    begin
        loop
            if (a=100) then exit ; end if;

            p1 = a %10;
            p10 = a/10%10;

            if (p1-p10=1 or p1-p10=-1) then
            raise info 'a %',a;
            end if;
            a:=a+1;
        end loop;
    end;
$$;


do
$$
    declare
        a int := 10;
    begin
        loop


        end loop;
    end;
$$;


do
$$
    declare
        i int;
        a int := 10;
        b int := 100;
    begin
        for i in a+1 .. b-1 by 2 loop
            raise info 'i: %',i;
            end loop;

    end;
$$;

-- --------------------------------------------------------------------------

do
$$
    declare
        i int;
        str varchar := 'java go javajavajavajava,javalldsjva';
        count int :=0;
    begin
        for i in 1.. length(str) loop
            if (substring(str,i,4) = 'java') then
                count := count+1;
            end if;
            end loop;

        raise info 'Count: %',count;

    end;
$$;


-- -----------------------------------------------------------------------------------------
-- 1) n va k butun sonlari berilgan. Faqat ayirish va qo’shishdan
-- foydalanib, n sonini k ga bo’lgandagi qoldiq va butun qismini ekranga
-- chiqaruvchi logika tuzing.
do
$$
    declare
        n int:= 23;   -- 22
        a int:= 7;   -- 3     bolsa javob count = 3 va qoldiq 1 chiqishi kerak
        count int :=0;
        qoldiq int := n;
    begin

        loop
            qoldiq := n;
            if (n<=a) then exit ; end if;

            n := n-a;
            count:=count+1;

        end loop;
        raise info ' %/% ==> count: %,qoldiq: %',count*a,a,count,qoldiq;
    end;
$$;


-- 2) n butun soni berilgan. Berilgan son raqamlari orasida 5 raqami bor
-- yo’qligini aniqlovchi logika tuzing.
do $$
    declare
        n bigint := -1203407;
    begin
        if position('5' in abs(n)::text) > 0 then
            raise info 'n=% -> bor', n;
        else
            raise info 'n=% -> yoq', n;
        end if;
    end
$$;

-- 3) 3 xonali sonlar ichidan barcha palindrom sonlar ekranga chiqarilsin.
-- Palindrom son o'ngdan o'qisa ham chapdan o'qisa ham bir xil sonlar
-- Masalan : 101, 232, 222,606,888, 919

do
$$
    declare
        i int;
        p1 int;
        p10 int;
        p100 int;
    begin
        for i in 99..999 loop

            p1 := i%10;
            p10 := i/10%10;
            p100 := i/100%10;

            if p1 = p100 then raise info 'palindrom: %',i;
            end if;

            end loop;
    end;
$$;

-- 4) n butun soni berilgan. Berilgan son raqamlarini teskari tartibda
-- qaytaruvchi function tuzilsin.

do
$$
DECLARE
    n int := 100;
    rev BIGINT := 0;
    digit INT;
BEGIN
    WHILE n > 0 LOOP
            digit := n % 10;         -- oxirgi raqamni olamiz
            rev := rev * 10 + digit; -- teskari songa qo‘shamiz
            n := n / 10;             -- oxirgi raqamni olib tashlaymiz

    END LOOP;
    raise info 'teskasrisi:%',rev;
END;
$$;

-- 5) Berilgan sonning necha xonali ekanini aniqlab qaytaruvchi function tuzing.

do
$$
    DECLARE
        n int := 10120;
        count INT := 0;
        digit INT;
    BEGIN
        WHILE n > 0 LOOP
                count := count + 1;
                n := n / 10;             -- oxirgi raqamni olib tashlaymiz

            END LOOP;
        raise info 'count:%',count;
    END;
$$

--
-- 6) Parametrda berilgan matnni palindromlikka tekshiradigan function tuzing.
--
--   M: is_palindrom( 'aziza' )   -->  true








-- 7)  Parametrda berilgan matnning ichida nechta 'java' so'zi borligini sanab natijani qaytaradigan function tuzing.
--
--   M:  java_counter( 'Hi java and java' )   --->  2

do
$$
    declare
        i int;
        str varchar := 'java go javajavajavajava,javalldsjva';
        count int :=0;
    begin
        for i in 1.. length(str) loop
                if (substring(str,i,4) = 'java') then
                    count := count+1;
                end if;
            end loop;

        raise info 'Count: %',count;

    end;
$$;







