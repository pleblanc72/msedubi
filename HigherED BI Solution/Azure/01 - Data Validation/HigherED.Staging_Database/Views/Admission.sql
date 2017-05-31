CREATE VIEW dbo.Admission
AS
SELECT 
	CAST(CRMID AS bigint) StudentAK,
	--CAST([ADMIT_TERM] AS int) TermAK,
	CAST(CONVERT( varchar(10),CAST(t.StartDate AS date), 112) AS int) AdmitDateAK,
	CAST([ADMIT_TYPE] AS varchar(5)) AdmitTypeAK,
	LEFT([APPL_SOURCE], 1) ApplicationSourceAK,
	CAST([ACAD_PROG] AS varchar(10)) AcademicProgramAK,
	CAST([ACAD_PLAN] AS varchar(10)) AcademicPlanAK,
	CAST([CURRENT_PROGRAM] AS varchar(10)) CurrentAcademicProgramAK,
	CAST([CURRENT_PLAN] AS varchar(10)) CurrentAcademicPlanAK
FROM dbo.StudentProfile sp
INNER JOIN dbo.Term t
	ON sp.ADMIT_TERM = t.TermAK
GO