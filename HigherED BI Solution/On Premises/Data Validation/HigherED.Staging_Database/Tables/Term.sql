CREATE TABLE [dbo].[Term] (
    [TermID]     INT          IDENTITY (1, 1) NOT NULL,
    [Term]       VARCHAR (50) NULL,
    [TermNumber] INT          NULL,
    [SchoolYear] VARCHAR (50) NULL,
    [StartDate]  VARCHAR (50) NULL,
    [EndDate]    VARCHAR (50) NULL,
    [TermAK]     VARCHAR (50) NULL,
    CONSTRAINT [PK_Term_TermPK] PRIMARY KEY CLUSTERED ([TermID] ASC)
);



GO