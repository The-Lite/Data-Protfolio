USE [SSIS_DW]
GO

/****** Object:  Table [dbo].[Dim Customer]    Script Date: 1/27/2022 9:40:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim Employee](
	[Employee Key] [int] IDENTITY(1,1) NOT NULL,
	[ Employee_ID] [varchar](50) NULL,
	[Employee_Name] [varchar](100) NULL,
	[Country Region] [varchar](50) NULL
 CONSTRAINT [PK_D_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


