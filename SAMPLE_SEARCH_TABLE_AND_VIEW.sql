--SEARCH TABLES NAMES FROM A DATABASE
use <table_name>;
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME LIKE '%<table_name>%'

select * from TOrderStatus

use <table_name>;
SELECT * FROM sys.views where name = '<view_name>'

use <table_name>;
SELECT * FROM sys.views where name = '<view_name>'