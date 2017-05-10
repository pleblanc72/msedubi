CREATE TABLE [dbo].[DimAcademicLevel] (
    [AcademicLevelSK] INT          IDENTITY (1, 1) NOT NULL,
    [AcademicLevelAK] VARCHAR (2)  NOT NULL,
    [AcademicLevel]   VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_AcademicLevel_AcademicLevelSK] PRIMARY KEY CLUSTERED ([AcademicLevelSK] ASC)
);

