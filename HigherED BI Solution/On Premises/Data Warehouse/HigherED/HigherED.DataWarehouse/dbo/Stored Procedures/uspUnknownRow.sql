
CREATE Proc [dbo].[uspUnknownRow]
(	
@schema sysname,
@table sysname,
@action varchar(10)
)
AS

/*Declare internal variables. Values are set within stored procedure*/
Declare
@sqlquery varchar(max),
@columns varchar(max),
@identity varchar(100),
@values varchar(max)

/*Returns the column identified as the identity column*/
SELECT @identity = 
	 COLUMN_NAME
      FROM  INFORMATION_SCHEMA.COLUMNS c 
      INNER JOIN SYSOBJECTS o 
      ON c.TABLE_NAME = o.name 
      INNER JOIN sys.schemas s 
      ON o.uid = s.schema_id 
      LEFT JOIN sys.all_columns c2 
      ON o.id = c2.object_id 
      AND c.COLUMN_NAME = c2.name 
      Where is_identity = 1
      AND c.TABLE_NAME = @table
      AND c.TABLE_SCHEMA = @schema
/*Returns column names for selected table*/       
SELECT @columns = coalesce(+@columns + ', ', '') + COLUMN_NAME
      FROM  INFORMATION_SCHEMA.COLUMNS c 
      INNER JOIN SYSOBJECTS o 
      ON c.TABLE_NAME = o.name 
      INNER JOIN sys.schemas s 
      ON o.uid = s.schema_id 
      LEFT JOIN sys.all_columns c2 
      ON o.id = c2.object_id 
      AND c.COLUMN_NAME = c2.name
WHERE 
      c.TABLE_NAME = @table 
      AND c.TABLE_SCHEMA = @schema 
      AND c2.is_computed = 0 
      AND c.TABLE_SCHEMA = s.name
Order by ORDINAL_POSITION

--SET @columns = @columns +']'
/*Returns unknown values for appropriate datatypes and columns*/
SELECT @values = coalesce(@values+ ', ', '')+
      CASE 
            WHEN DATA_TYPE IN ('SMALLINT','INT', 'NUMERIC', 'BIGINT') AND c.COLUMN_NAME NOT LIKE '%DateSK' THEN  '-1' 
            WHEN DATA_TYPE IN ('DECIMAL') THEN  '-1' 
            WHEN DATA_TYPE IN ('VARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH = 1 THEN '''U''' 
            WHEN DATA_TYPE IN ('VARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH = 2 THEN '''Un''' 
            WHEN DATA_TYPE IN ('VARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH BETWEEN 3 AND 7 THEN '''Unk''' 
            WHEN DATA_TYPE IN ('VARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH > 7 THEN '''Unknown''' 
            WHEN DATA_TYPE IN ('NVARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH = 1 THEN '''U''' 
            WHEN DATA_TYPE IN ('NVARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH = 2 THEN '''Un''' 
            WHEN DATA_TYPE IN ('NVARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH BETWEEN 3 AND 7 THEN '''Unk''' 
            WHEN DATA_TYPE IN ('NVARCHAR', 'CHAR') AND CHARACTER_MAXIMUM_LENGTH > 7 THEN '''Unknown''' 
            WHEN DATA_TYPE IN ('INT') AND c.COLUMN_NAME like '%DateSK' THEN '19000101' 
            WHEN DATA_TYPE IN ('DateTime') THEN '''1900-01-01''' 
            WHEN DATA_TYPE IN ('Date') THEN '''1900-01-01''' 
            WHEN DATA_TYPE IN ('TINYINT') THEN  '0' 
            WHEN DATA_TYPE IN ('FLOAT') THEN  '0' 
            WHEN DATA_TYPE IN ('BIT') THEN  '0' 
            WHEN DATA_TYPE IN ('MONEY') THEN  '0' 
            ELSE ''''+DATA_TYPE+'''' 
      END 
      FROM  INFORMATION_SCHEMA.COLUMNS c 
      INNER JOIN SYSOBJECTS o 
      ON c.TABLE_NAME = o.name 
      INNER JOIN sys.schemas s 
      ON o.uid = s.schema_id 
      LEFT JOIN sys.all_columns c2 
      ON o.id = c2.object_id 
      AND c.COLUMN_NAME = c2.name 

WHERE 
      c.TABLE_NAME = @table 
      AND c.TABLE_SCHEMA = @schema 
      AND c2.is_computed = 0 
      AND c.TABLE_SCHEMA = s.name 
ORDER BY c.ORDINAL_POSITION 
 print @identity
 select @values
 IF(@identity is null)
 begin
	set @identity = REPLACE(@table,'DIM','')+'SK'
	set @sqlquery = 
 'IF NOT EXISTS (SELECT * FROM ['+@schema+'].['+@table+']
	'+ 
 'WHERE ['+@schema+'].['+@table+'].['+@identity+']= -1)
 
	Begin 
	'+
 
 '
INSERT INTO ['+@schema+'].['+@table+']('+@columns+
 ') 
	VALUES('+@values+'
	) 
 
	End'

 end   
 else
 begin 
 Set @sqlquery=
 'IF NOT EXISTS (SELECT * FROM ['+@schema+'].['+@table+']
	'+ 
 'WHERE ['+@schema+'].['+@table+'].['+@identity+']= -1)
 
	Begin 
	'+
 
 'Set identity_insert ['+@schema+'].['+@table+'] ON 
INSERT INTO ['+@schema+'].['+@table+']('+@columns+
 ') 
	VALUES('+@values+'
	) 
	Set identity_insert ['+@schema+'].['+@table+'] OFF 
	End'
end
if(@action = 'print') 
begin 
      print @sqlquery 
end 
else 
begin 
      exec (@sqlquery) 
end;