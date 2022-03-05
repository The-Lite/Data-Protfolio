USE [SSIS_Northwind_DW]
GO

/****** Object:  Table [dbo].[Dim Employee]    Script Date: 1/27/2022 9:48:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim Product](
	[Product Key] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [varchar](51) NULL,
	[ ProductName] [varchar](50) NULL,
	[ CategoryName] [varchar](50) NULL
 CONSTRAINT [PK_D_Product] PRIMARY KEY CLUSTERED 
(
	[Product Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


