CREATE VIEW dbo.Summary
AS
SELECT 
	CAST([CRMID] AS int) StudentAK,
	--CAST([Term] AS int) TermAK,
	CAST(CONVERT( varchar(10),CAST(t.StartDate AS date), 112) AS int) EnrollmentTermDateAK,
	CAST(LEFT([InState_OutState], 1) AS char(1)) ResidencyStatusAK,
	CAST(LEFT([Academic_Level], 2) AS varchar(2)) AcademicLevelAK,
	CAST([Term_Credit_Attempted] AS int) CreditHoursAttempted,
	CAST([Term_Credits_Earned] AS int) CreditHoursEearned,
	CAST([Term_GPA] AS decimal(5,3)) TermGPA,
	CAST([Transfer_Credit] AS decimal(6,3)) TransferCredit,
	CAST([Cum_Credits_Attempted] AS int) CumCreditHoursAttempted,
	CAST([Cum_Credits_Earned] AS int) CumCreditHoursEarned,
	CAST([Cum_GPA] AS decimal(5,3)) CumGPA
FROM dbo.EnrollmentSummary es
INNER JOIN dbo.Term t
	ON es.Term = t.TermAK