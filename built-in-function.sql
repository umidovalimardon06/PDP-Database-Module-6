SELECT age(timestamp '2007-11-21');

SELECT age(timestamp '2026-1-1', timestamp '2024-1-10');

SELECT age(timestamp '2025-1-1 14:30:21', timestamp '2020-3-21 21:01:20');

SELECT age(timestamp '2006-11-30 00:00:10');

-- ---------------------------------------------------------------

SELECT extract(century from timestamp '2022-1-10');

SELECT extract(month from timestamp '2022-1-10');

SELECT extract(day from timestamp '2022-1-10');

SELECT extract(hour from timestamp '2022-1-10 21:10:30');

SELECT extract(minute from timestamp '2022-1-10 21:10:30');

SELECT extract(second from timestamp '2022-1-10 21:10:32');

SELECT extract(dow from timestamp '2022-1-10 21:10:32');

SELECT extract(doy from timestamp '2010-2-11 21:10:32');

-- --------------------------------------------------------------

SELECT to_date('20241014', 'YYYYMMDD');

-- --------------------------------------------------------------

SELECT to_timestamp('2024-08-15 14:30:25', 'YYYY-MM-DD HH24:MI:SS');

-- ---------------------------------------------------------------

SELECT ascii('V'); -- 86
SELECT ascii('A'); -- 65

-- ----------------------------------------------------------------

SELECT chr(66);
SELECT chr(81);

-- ----------------------------------------------------------------

SELECT concat('Hello','World','eyo');

-- ----------------------------------------------------------------

SELECT concat_ws(' ','Hello','World','eyo');

-- -----------------------------------------------------------------

-- -----------------------------------------------------------------

SELECT initcap('Hello world what is happening here!');

-- ------------------------------------------------------------------

SELECT "left"('Hello',2);

-- -------------------------------------------------------------------

SELECT "right"('Hello',2);


/*
    needs to be considered:
    -position
    -repeat
    -substring
    -random
    -ceil
    -floor
    -sqrt
    -cbrt
*/














