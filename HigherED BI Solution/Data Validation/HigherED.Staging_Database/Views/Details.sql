CREATE VIEW dbo.Details
AS
SELECT 
	CAST([CRMID] AS int) StudentAK,
	--CAST([Term] AS int) TermAK,
	CAST(CONVERT( varchar(10),CAST(t.StartDate AS date), 112) AS int) EnrollmentTermDateAK,
	CAST([Subject] AS varchar(10)) SubjectAK,
	CAST([Class_Section] AS varchar(5)) ClassSectionAK,
	CAST([Catalog] AS varchar(10)) CatalogAK,
	CONVERT(varchar(10), TRY_CAST([Enrolled_Date] AS date), 112) EnrolledDate,
	CONVERT(varchar(10), TRY_CAST([Dropped_Date] AS date), 112) DropDate,
	CAST([MidTerm_Grade] AS varchar(5)) MidTermGrade,
	CAST([EndofSem_Grade] AS varchar(5)) EndSemesterGrade,
	IIF([Enrolled_Dropped] = 'D', 1, 0) Dropped,
	IIF([Enrolled_Dropped] = 'E', 1, 0) Enrolled
FROM dbo.EnrollmentDetails ed
INNER JOIN dbo.Term t
	ON ed.Term = t.TermAK
GO