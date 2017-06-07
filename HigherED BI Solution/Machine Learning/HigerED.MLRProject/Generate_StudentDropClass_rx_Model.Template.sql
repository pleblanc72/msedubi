CREATE PROCEDURE [Generate_StudentDropClass_rx_Model]
AS
BEGIN
EXEC sp_execute_external_script @language = N'R'
    , @script = N'_RCODE_'
    , @input_data_1 = N'_INPUT_QUERY_'
--- Edit this line to handle the output data frame.
    WITH RESULT SETS ((model VARBINARY(MAX)));
END;
GO

CREATE PROCEDURE [Train_StudentDropClass_rx_Model]
AS
BEGIN
	INSERT INTO [MLInput].[TrainedModels] ([Model])
	EXEC [Generate_StudentDropClass_rx_Model];

	UPDATE [MLInput].[TrainedModels]
	SET [ModelName] = 'StudentDropClass_rx_Model'
	WHERE [ModelName] = 'Default';
END;
GO
