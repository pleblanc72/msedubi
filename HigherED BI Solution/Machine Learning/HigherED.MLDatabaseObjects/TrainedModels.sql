CREATE TABLE [MLInput].[TrainedModels]
(
	[ModelName] varchar(128) not null default('Default') primary key
	,[Model] varbinary(max) not null
	,[CreatedDate] [date] not null default(GetDate())
)
