CREATE TABLE [dbo].[DimStudent] (
    [StudentSK]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [StudentAK]   BIGINT       NOT NULL,
    [Gender]      VARCHAR (20) NULL,
    [Age]         INT          NULL,
    [City]        VARCHAR (75) NOT NULL,
    [StateAbbrev] VARCHAR (3)  NOT NULL,
    [PostalCode]  VARCHAR (15) NULL,
    [Active]      BIT          NULL,
    [AdmitTerm]   INT          NULL,
    CONSTRAINT [PK_Student_StudentSK] PRIMARY KEY CLUSTERED ([StudentSK] ASC)
);

