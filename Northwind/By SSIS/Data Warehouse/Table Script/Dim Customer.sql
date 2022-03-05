USE [SSIS_DW]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 1/26/2022 11:02:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[Customer Key]  int identity not null,
	[Customer ID] [varchar](50) NULL,
	[Company Name] [varchar](100) NULL,
	[Customer Name] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	CONSTRAINT [PK_D_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY] 



