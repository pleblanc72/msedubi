CREATE TABLE [MLOutput].[StudentDropClass_rx]
(StudentID int not null
,TermID int not null
,SubjectID varchar(10) not null
,CatalogID varchar(10) not null
,ClassID int not null
,SectionID varchar(5) not null
,EnrollDate int not null
,DropoutFlag int not null
,Score float null
,RiskCategory varchar(16) null
,CreationDate [Date] default GETDATE());
