CREATE TABLE [dbo].[FactEnrollmentDetails] (
    [EnrollmentTermDateSK] INT         NULL,
    [StudentSK]            BIGINT      NULL,
    [ClassSK]              INT         NULL,
    [EnrollDateSK]         INT         NULL,
    [DropDateSK]           INT         NULL,
    [Enrolled]             INT         NULL,
    [Dropped]              INT         NULL,
    [MidTermGrade]         VARCHAR (5) NULL,
    [EndSemesterGrade]     VARCHAR (5) NULL,
    CONSTRAINT [FK_FactEnrollmentDetails_To_DimClass_On_ClassSK] FOREIGN KEY ([ClassSK]) REFERENCES [dbo].[DimClass] ([ClassSK]),
    CONSTRAINT [FK_FactEnrollmentDetails_To_DimDate_On_DropDateSK] FOREIGN KEY ([DropDateSK]) REFERENCES [dbo].[DimDate] ([DateSK]),
    CONSTRAINT [FK_FactEnrollmentDetails_To_DimDate_On_EnrollDateSK] FOREIGN KEY ([EnrollDateSK]) REFERENCES [dbo].[DimDate] ([DateSK]),
    CONSTRAINT [FK_FactEnrollmentDetails_To_DimDate_On_EnrollmentTermDateSK] FOREIGN KEY ([EnrollmentTermDateSK]) REFERENCES [dbo].[DimDate] ([DateSK]),
    CONSTRAINT [FK_FactEnrollmentDetails_To_DimStudent_On_StudentSK] FOREIGN KEY ([StudentSK]) REFERENCES [dbo].[DimStudent] ([StudentSK])
);

