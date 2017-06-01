CREATE TABLE [dbo].[DimResidencyStatus] (
    [ResidencyStatusSK] INT          IDENTITY (1, 1) NOT NULL,
    [ResidencyStatusAK] CHAR (1)     NOT NULL,
    [ResidencyStatus]   VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_ResidencyStatus_ResidencyStatusSK] PRIMARY KEY CLUSTERED ([ResidencyStatusSK] ASC)
);

