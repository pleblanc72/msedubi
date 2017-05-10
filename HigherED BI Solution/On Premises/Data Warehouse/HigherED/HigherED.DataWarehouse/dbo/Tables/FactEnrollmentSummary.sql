CREATE TABLE [dbo].[FactEnrollmentSummary] (
    [EnrollmentTermDateSK]   INT            NOT NULL,
    [StudentSK]              BIGINT         NOT NULL,
    [ResidencyStatusSK]      INT            NOT NULL,
    [AcademicLevelSK]        INT            NOT NULL,
    [CreditHoursAttempted]   INT            NULL,
    [CreditHoursEarned]      INT            NULL,
    [TermGPA]                DECIMAL (5, 3) NULL,
    [TransferCredit]         DECIMAL (6, 3) NULL,
    [CumCreditHoursAtempted] INT            NULL,
    [CumCreditHoursEarned]   INT            NULL,
    [CumGPA]                 DECIMAL (5, 3) NULL,
    CONSTRAINT [FK_FactEnrollmentSummary_To_DimAcademicLevel_On_AcademicLevelSK] FOREIGN KEY ([AcademicLevelSK]) REFERENCES [dbo].[DimAcademicLevel] ([AcademicLevelSK]),
    CONSTRAINT [FK_FactEnrollmentSummary_To_DimDate_On_EnrollmentTermDateSK] FOREIGN KEY ([EnrollmentTermDateSK]) REFERENCES [dbo].[DimDate] ([DateSK]),
    CONSTRAINT [FK_FactEnrollmentSummary_To_DimResidencyStatus_On_ResidencyStatusSK] FOREIGN KEY ([ResidencyStatusSK]) REFERENCES [dbo].[DimResidencyStatus] ([ResidencyStatusSK]),
    CONSTRAINT [FK_FactEnrollmentSummary_To_DimStudent_On_StudentSK] FOREIGN KEY ([StudentSK]) REFERENCES [dbo].[DimStudent] ([StudentSK])
);

