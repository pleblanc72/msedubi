CREATE TABLE [dbo].[DimApplicationSource] (
    [ApplicationSourceSK] INT          IDENTITY (1, 1) NOT NULL,
    [ApplicationSourceAK] VARCHAR (3)  NOT NULL,
    [ApplicationSource]   VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_ApplicationSource_ApplicationSourceSK] PRIMARY KEY CLUSTERED ([ApplicationSourceSK] ASC)
);

