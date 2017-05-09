CREATE VIEW dbo.AcademicProgram
AS
SELECT DISTINCT
	CAST([ACAD_PROG] AS varchar(10)) AcademicProgramAK, 
	CAST([ACAD_PROG_DESCR] AS varchar(50)) AcademicProgram,
	CAST([ACAD_PLAN] AS varchar(10)) AcademicPlanAK, 
	CAST([ACAD_PLAN_DESCR] AS varchar(50)) AcademicPlan
FROM dbo.StudentProfile
UNION 
SELECT DISTINCT
	CAST([Current_Program] AS varchar(10)) AcademicProgramAK,  
	CAST([Current_Program_DESCR] AS varchar(50)) AcademicProgram,
	CAST([Current_PLAN] AS varchar(10)) AcademicPlanAK, 
	CAST([Current_PLAN_DESCR] AS varchar(50)) AcademicPlan
FROM dbo.StudentProfile
GO