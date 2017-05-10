CREATE TABLE [dbo].[DimAcademicProgram] (
    [AcademicProgramSK] INT          IDENTITY (1, 1) NOT NULL,
    [AcademicProgramAK] VARCHAR (10) NOT NULL,
    [AcademicProgram]   VARCHAR (50) NOT NULL,
    [AcademicPlanAK]    VARCHAR (10) NOT NULL,
    [AcademicPlan]      VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_AcademicProgram_AcademicProgramSK] PRIMARY KEY CLUSTERED ([AcademicProgramSK] ASC)
);

