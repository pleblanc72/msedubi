CREATE TABLE [dbo].[DimAdmitType] (
    [AdmitTypeSK] INT          IDENTITY (1, 1) NOT NULL,
    [AdmitTypeAK] VARCHAR (5)  NOT NULL,
    [AdmitType]   VARCHAR (75) NOT NULL,
    CONSTRAINT [PK_AdmitType_AdmiTypeSK] PRIMARY KEY CLUSTERED ([AdmitTypeSK] ASC)
);

