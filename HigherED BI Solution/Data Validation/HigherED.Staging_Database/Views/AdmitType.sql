CREATE VIEW dbo.AdmitType
AS
SELECT DISTINCT
	CAST(Admit_Type AS varchar(5)) AdmitTypeAK,
	CAST(Admit_Type_Descr AS varchar(75)) AdmitType
FROM dbo.StudentProfile
GO
