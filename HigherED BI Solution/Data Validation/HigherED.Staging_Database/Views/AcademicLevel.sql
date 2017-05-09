CREATE VIEW dbo.AcademicLevel
AS
SELECT DISTINCT 
	CAST(LEFT([Academic_Level], 2) AS varchar(2)) AcademicLevelAK,
	CAST([Academic_Level] AS varchar(25)) AcademicLevel
FROM dbo.EnrollmentSummary
GO
