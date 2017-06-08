CREATE TABLE [MLOutput].[StudentClusters] (
StudentID int not null
,TermID int not null
,ResidencyID int not null
,AcademicLevelID int not null
,ClusterID int not null
,AzureMLTimestamp datetime default GETDATE());