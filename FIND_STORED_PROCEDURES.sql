use table_name;

select * 
from 
   sys.procedures 
where 
   name like '%<stored_procedure_name%'