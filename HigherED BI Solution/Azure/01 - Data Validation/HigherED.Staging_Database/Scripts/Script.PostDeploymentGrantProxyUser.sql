/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/* run in user database HigherED_Staging */  
DROP USER IF EXISTS [HigherEDProxyUser];  
CREATE USER [HigherEDProxyUser] FOR LOGIN [HigherEDProxyUser] WITH DEFAULT_SCHEMA=[dbo];    
GO     

BEGIN  
GRANT VIEW DEFINITION TO [HigherEDProxyUser];  
GRANT CONNECT TO [HigherEDProxyUser];  
EXEC sp_addrolemember N'db_datareader', [HigherEDProxyUser];  
EXEC sp_addrolemember N'db_datawriter', [HigherEDProxyUser];  
EXEC sp_addrolemember N'db_ddladmin ', [HigherEDProxyUser];  
GRANT EXECUTE TO [HigherEDProxyUser];  
END;
GO