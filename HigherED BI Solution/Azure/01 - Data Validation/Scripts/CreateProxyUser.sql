/* run in master */  
IF EXISTS (SELECT * FROM sys.sql_logins WHERE name = N'HigherEDProxyUser')     
	DROP USER [HigherEDProxyUser];  

CREATE LOGIN [HigherEDProxyUser] WITH PASSWORD = 'MakeThisStrong123!';    
GO  