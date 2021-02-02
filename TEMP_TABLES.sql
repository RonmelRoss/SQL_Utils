-- VIEW LIST OF TEMP TABLES
SELECT name
FROM tempdb.sys.tables
WHERE name LIKE '#%';

-- CREATE GLOBAL TEMP TABLES
CREATE TABLE ##temporary(
UserID int,
UserName varchar(50), 
UserAddress varchar(150));

-- INSERT VALUES TO GLOBAL TEMP TABLES
insert into ##temporary select * from #PayBackMailTemp
select * from ##temporary