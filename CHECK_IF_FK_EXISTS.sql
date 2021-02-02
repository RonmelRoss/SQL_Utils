-- CHECK IF FK EXISTS
SELECT 
  [ForeignKey] = f.name
, [TableName] = OBJECT_NAME(f.parent_object_id), COL_NAME(fc.parent_object_id,fc.parent_column_id)
, [ReferenceTableName] = OBJECT_NAME (f.referenced_object_id)
, ReferenceColumnName = COL_NAME(fc.referenced_object_id, fc.referenced_column_id)
FROM 
sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id