USE [DW_Water Sensor]
GO

/****** Object:  Table [dbo].[Dim Location]    Script Date: 2/2/2022 11:46:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim Location](
	[Location Key] [int] IDENTITY NOT NULL,
	[ID] [varchar](255) NOT NULL,
	[Area] [varchar](255) NOT NULL,
	[Sub Area] [varchar](255) NOT NULL,
	[lat] float  NOT NULL,
	[long] float  NOT NULL,
	[Type] [varchar](255) NOT NULL,
 CONSTRAINT [Key1] UNIQUE NONCLUSTERED 
(
	[Location Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


