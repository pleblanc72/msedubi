-- Place SQL query retrieving data for the R stored procedure here
/*
* Exclude:	DropDate, EndSemesterGrade, Enrolled
* Label:	Dropped
* Features: All remaining columns, some needed to relate
*			to input data for analysis
*/
SELECT 
/* ID columns */
/*
[StudentID]
,[TermID]
,[SubjectID]
,[CatalogID]
,[ClassID]
,[SectionID]
*/

/* Excluded columns */
/* 
,[DropDate]
,[EndSemesterGrade]
,[Enrolled]
*/

/* Include highest value features */
--[AdmitTerm]
[Age]
--,[Catalog]
--,[City]
,[Class]
,[CreditHours]
--,[EnrollDate]
,[Gender]
,[MidTermGrade]
--,[PostalCode]
--,[SchoolYear]
--,[Section]
--,[StateAbbrev]
--,[Subject]
--,[Term]
/* Label */
,[Dropped]
FROM
MLInput.DropClass