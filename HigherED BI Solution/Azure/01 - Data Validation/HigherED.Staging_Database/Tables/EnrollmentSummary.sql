
CREATE TABLE [dbo].[EnrollmentSummary](
	[EnrollmentSummaryID] [int] IDENTITY(1,1) NOT NULL,
	[Term] [varchar](50) NULL,
	[CRMID] [varchar](50) NULL,
	[Residential_Commuter] [varchar](50) NULL,
	[InState_OutState] [varchar](50) NULL,
	[Term_Credit_Attempted] [varchar](50) NULL,
	[Term_Credits_Earned] [varchar](50) NULL,
	[Term_GPA] [varchar](50) NULL,
	[Transfer_Credit] [varchar](50) NULL,
	[Cum_Credits_Attempted] [varchar](50) NULL,
	[Cum_Credits_Earned] [varchar](50) NULL,
	[Cum_GPA] [varchar](50) NULL,
	[Academic_Level] [varchar](50) NULL,
	[Academic_Standing] [varchar](50) NULL,
CONSTRAINT PK_EnrollmentSummary_EnrollmentSummaryID PRIMARY KEY CLUSTERED 
(
	[EnrollmentSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]