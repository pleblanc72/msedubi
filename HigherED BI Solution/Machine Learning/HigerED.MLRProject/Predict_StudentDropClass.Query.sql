-- Place SQL query retrieving data for the R stored procedure here
/*
* Exclude:	DropDate, EndSemesterGrade, Enrolled
* Label:	Dropped
* Features: All remaining columns, some needed to relate
*			to input data for analysis
*/
SELECT
/* ID columns 1-7 */
[StudentID]
,[TermID]
,[SubjectID]
,[CatalogID]
,[ClassID]
,[SectionID]
,[EnrollDate]

/* Include highest value features */
,[Age]
,[Class]
,[CreditHours]
,[Gender]
,[MidTermGrade]
,[Subject]
,[Term]

/* Label for validation */
,[Dropped]
FROM
MLInput.DropClass;