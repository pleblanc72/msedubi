CREATE TABLE [dbo].[EnrollmentDetails](
	[EnrollmentDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](50) NULL,
	[Catalog] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Term] [varchar](50) NULL,
	[CRMID] [varchar](50) NULL,
	[Class_Section] [varchar](50) NULL,
	[Course_Credit_Hour] [varchar](50) NULL,
	[Instruction_Mode] [varchar](50) NULL,
	[MidTerm_Grade] [varchar](50) NULL,
	[EndofSem_Grade] [varchar](50) NULL,
	[Enrolled_Dropped] [varchar](50) NULL,
	[Enrolled_Date] [varchar](50) NULL,
	[Dropped_Date] [varchar](50) NULL,
CONSTRAINT PK_EnrollmentDetails_EnrollmentDetailID PRIMARY KEY CLUSTERED 
(
	[EnrollmentDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
