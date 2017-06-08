/*  Performance Tuning */
/*

SELECT * FROM sys.resource_governor_external_resource_pools

ALTER EXTERNAL RESOURCE POOL [default] WITH (MAX_MEMORY_PERCENT = 40);

*/

/* Demonstration Script */
/*

DELETE FROM [MLInput].[TrainedModels]
WHERE [ModelName] = 'StudentDropClass_rx_Model';

EXEC [dbo].[Train_StudentDropClass_rx_Model];

EXEC [dbo].[Predict_StudentDropClass];

EXEC [dbo].[Predict_StudentDropClass_MLOutput];

*/

/* View trained SQL Server ML Services models stored as VARBINARY */
SELECT * FROM [MLInput].[TrainedModels];

/* View predictions generated using SQL Server ML Services */
SELECT * FROM [MLOutput].[StudentDropClass_rx];

/* Quick comparison of Azure ML and SQL Server ML Services */
SELECT
inp.Dropped
,amlout.DropoutFlag
,amlout.DropoutProbability
,amlout.RiskCategory
,rmlout.DropoutFlag
,rmlout.Score
,rmlout.RiskCategory
FROM 
[MLInput].[DropClass] inp
LEFT OUTER JOIN [MLOutput].[StudentDropClass] amlout ON inp.StudentID = amlout.StudentID AND inp.TermID = amlout.TermID AND inp.SubjectID = amlout.SubjectID AND inp.CatalogID = amlout.CatalogID AND inp.SectionID = amlout.SectionID AND inp.EnrollDate = amlout.EnrollDate
LEFT OUTER JOIN [MLOutput].[StudentDropClass_rx] rmlout ON inp.StudentID = rmlout.StudentID AND inp.TermID = rmlout.TermID AND inp.SubjectID = rmlout.SubjectID AND inp.CatalogID = rmlout.CatalogID AND inp.SectionID = rmlout.SectionID AND inp.EnrollDate = rmlout.EnrollDate
WHERE 
inp.Dropped <> amlout.DropoutFlag 
OR inp.Dropped <> rmlout.DropoutFlag;