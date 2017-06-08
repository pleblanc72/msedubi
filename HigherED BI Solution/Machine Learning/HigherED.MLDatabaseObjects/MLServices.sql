CREATE TABLE [MLMetadata].[MLServices]
(
	[apiURL] [varchar](256) NOT NULL,
	[apiKey] [varchar](256) NOT NULL,
	[inputJSON] [varchar](MAX) NOT NULL,
	[MLResultsTable] [varchar](256) NOT NULL
)
