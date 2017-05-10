CREATE TABLE [dbo].[DimClass] (
    [ClassSK]           INT          IDENTITY (1, 1) NOT NULL,
    [SubjectAK]         VARCHAR (10) NOT NULL,
    [CatalogAK]         VARCHAR (10) NOT NULL,
    [ClassSectionAK]    VARCHAR (5)  NOT NULL,
    [Title]             VARCHAR (50) NULL,
    [CreditHours]       INT          NULL,
    [InstructionModeAK] VARCHAR (35) NULL,
    CONSTRAINT [PK_Class_ClassSK] PRIMARY KEY CLUSTERED ([ClassSK] ASC)
);

