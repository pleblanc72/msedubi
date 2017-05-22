CREATE VIEW dbo.ApplicationSource
AS
SELECT DISTINCT
	CAST(LEFT(Appl_Source, 1) AS varchar(3)) ApplicationSourceAK,
	CAST(Appl_Source AS varchar(25)) ApplicationSource
FROM dbo.StudentProfile
GO