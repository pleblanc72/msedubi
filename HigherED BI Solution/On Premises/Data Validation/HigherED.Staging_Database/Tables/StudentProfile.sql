CREATE TABLE [dbo].[StudentProfile](
	[StudentProfileID] [int] IDENTITY(1,1) NOT NULL,
	[CRMID] [varchar](50) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[FIRST_NAME] [varchar](50) NULL,
	[MIDDLE_NAME] [varchar](50) NULL,
	[ADMIT_TERM] [varchar](50) NULL,
	[ADMIT_DESCR] [varchar](50) NULL,
	[ACAD_CAREER] [varchar](50) NULL,
	[ADMIT_TYPE] [varchar](50) NULL,
	[ADMIT_TYPE_DESCR] [varchar](50) NULL,
	[APPL_SOURCE] [varchar](50) NULL,
	[ACAD_PROG] [varchar](50) NULL,
	[ACAD_PROG_DESCR] [varchar](50) NULL,
	[ACAD_PLAN] [varchar](50) NULL,
	[ACAD_PLAN_DESCR] [varchar](50) NULL,
	[GENDER] [varchar](50) NULL,
	[AGE_BY_YEARS] [varchar](50) NULL,
	[ADDRESS1] [varchar](50) NULL,
	[ADDRESS2] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[POSTAL] [varchar](50) NULL,
	[CURRENT_PROGRAM] [varchar](50) NULL,
	[CURRENT_PROGRAM_DESCR] [varchar](50) NULL,
	[CURRENT_PLAN] [varchar](50) NULL,
	[CURRENT_PLAN_DESCR] [varchar](50) NULL,
CONSTRAINT PK_StudentProfile_StudentProfileID PRIMARY KEY CLUSTERED 
(
	[StudentProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]