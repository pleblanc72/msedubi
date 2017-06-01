CREATE VIEW dbo.ResidencyStatus
AS
SELECT DISTINCT
	CAST(LEFT([InState_OutState], 1) AS char(1)) ResidencyStatusAK,
	CAST(IIF([InState_OutState] = 'NULL', 'Not Available', [InState_OutState]) AS varchar(15)) ResidencyStatus
FROM [dbo].[EnrollmentSummary]
GO
