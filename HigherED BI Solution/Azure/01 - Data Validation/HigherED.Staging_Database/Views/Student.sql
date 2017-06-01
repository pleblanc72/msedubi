CREATE VIEW dbo.Student
AS
WITH results
AS
(
	SELECT DISTINCT
		ROW_NUMBER() OVER(ORDER BY CRMID) ID,
		CAST(CRMID AS bigint) StudentAK,
		CAST(Gender AS varchar(20)) Gender,
		CAST(AGE_BY_YEARS AS int) Age,
		CAST(CITY AS varchar(75)) City,
		CAST([STATE] AS varchar(3)) StateAbbrev,
		CAST(POSTAL AS varchar(15)) PostalCode,
		CAST(ADMIT_TERM AS int) AdmitTerm,
		First_Name FirstName,
		Last_Name LastName,
		MIDDLE_NAME MiddleName, 
		ADDRESS1 Address1,
		ADDRESS2 Address2
	FROM dbo.StudentProfile
)
SELECT *
FROM results
WHERE
ID IN
(
	SELECT MAX(ID) 
	FROM results GROUP BY StudentAK
)
GO