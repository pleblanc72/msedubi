CREATE PROCEDURE [Predict_StudentDropClass]
AS
BEGIN
/* Get Model */
DECLARE @rx_model VARBINARY(MAX) = (SELECT [Model] FROM [MLInput].[TrainedModels] WHERE [ModelName] = 'StudentDropClass_rx_Model');

/* Predict using trained model */
EXEC sp_execute_external_script @language = N'R'
    , @script = N'_RCODE_'
    , @input_data_1 = N'_INPUT_QUERY_'
	, @input_data_1_name = N'rx_data'
	, @params = N'@rx_model varbinary(max)'
	, @rx_model = @rx_model
--- Edit this line to handle the output data frame.
    WITH RESULT SETS ( ("StudentID" int,"TermID" int,"SubjectID" varchar(10),"CatalogID" varchar(10),"ClassID" int,"SectionID" varchar(5),"EnrollDate" int,"DropoutFlag" int, "Score" float) );
END;
GO

CREATE PROCEDURE [Predict_StudentDropClass_MLOutput]
AS
BEGIN
	TRUNCATE TABLE [MLOutput].[StudentDropClass_rx];

	INSERT INTO [MLOutput].[StudentDropClass_rx] (
	[StudentID]
	,[TermID]
	,[SubjectID]
	,[CatalogID]
	,[ClassID]
	,[SectionID]
	,[EnrollDate]
	,[DropoutFlag]
	,[Score])
	EXEC [dbo].[Predict_StudentDropClass];

	UPDATE [MLOutput].[StudentDropClass_rx]
	SET [RiskCategory] = CASE 
		WHEN [Score] < 0.25 THEN 'Low'
		WHEN [Score] < 0.45 THEN 'Medium'
		ELSE 'High' END
	FROM [MLOutput].[StudentDropClass_rx];
END;
GO
