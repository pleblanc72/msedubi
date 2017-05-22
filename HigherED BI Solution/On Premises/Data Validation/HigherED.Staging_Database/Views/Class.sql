CREATE VIEW dbo.Class
AS
WITH results
AS
(
	SELECT DISTINCT
		ROW_NUMBER() OVER(ORDER BY [Subject], [Catalog], [Class_Section], [Instruction_Mode]) ID,
		CAST([Subject] AS varchar(10)) SubjectAK,
		CAST([Catalog] AS varchar(10)) CatalogAK,
		CAST([Class_Section] AS varchar(5)) ClassSectionAK,
				CAST(Instruction_Mode AS varchar(35)) InstructionModeAK,
		CAST(Title AS varchar(50)) Title,
		CAST([Course_Credit_Hour] AS int) CourseCreditHours
	FROM [dbo].[EnrollmentDetails]
)
SELECT *
FROM results r
WHERE ID IN
(
	SELECT MAX(ID)
	FROM results
	GROUP BY SubjectAK, ClassSectionAK, CatalogAK, InstructionModeAK
)
GO