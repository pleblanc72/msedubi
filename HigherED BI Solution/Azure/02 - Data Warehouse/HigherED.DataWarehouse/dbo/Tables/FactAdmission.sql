CREATE TABLE [dbo].[FactAdmission] (
    [StudentSK]                BIGINT NOT NULL,
    [AdmitDateSK]              INT    NOT NULL,
    [AdmitTypeSK]              INT    NOT NULL,
    [ApplicationSourceSK]      INT    NOT NULL,
    [AcademicProgramSK]        INT    NOT NULL,
    [CurrentAcademicProgramSK] INT    NOT NULL,
    CONSTRAINT [FK_FactAdmission_To_DimAcademicProgram_On_AcademicProgramSK] FOREIGN KEY ([AcademicProgramSK]) REFERENCES [dbo].[DimAcademicProgram] ([AcademicProgramSK]),
    CONSTRAINT [FK_FactAdmission_To_DimAcademicProgram_On_CurrentAcademicProgram] FOREIGN KEY ([CurrentAcademicProgramSK]) REFERENCES [dbo].[DimAcademicProgram] ([AcademicProgramSK]),
    CONSTRAINT [FK_FactAdmission_To_DimAdmitType_On_AdmitTypeSK] FOREIGN KEY ([AdmitTypeSK]) REFERENCES [dbo].[DimAdmitType] ([AdmitTypeSK]),
    CONSTRAINT [FK_FactAdmission_To_DimApplicationSource_On_ApplicationSourceSK] FOREIGN KEY ([ApplicationSourceSK]) REFERENCES [dbo].[DimApplicationSource] ([ApplicationSourceSK]),
    CONSTRAINT [FK_FactAdmission_To_DimDateSK_On_AdmitDateSK] FOREIGN KEY ([AdmitDateSK]) REFERENCES [dbo].[DimDate] ([DateSK]),
    CONSTRAINT [FK_FactAdmission_To_DimStudent_On_StudentSK] FOREIGN KEY ([StudentSK]) REFERENCES [dbo].[DimStudent] ([StudentSK])
);

