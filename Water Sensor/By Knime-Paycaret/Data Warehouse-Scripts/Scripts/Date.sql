-- Delete time dimension if it already exists.
IF Exists(Select Name from sysobjects where name = 'Dim_Time')
BEGIN
    Drop Table Dim_Time
END
GO

-- Standard options for creating tables
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create your dimension table
-- Adjust to your own needs
Create Table dbo.Dim_Time
(
    Dateid int IDENTITY (1,1) PRIMARY KEY CLUSTERED,
    Date date,
    DateString varchar(10),
    Day int,
    DayofYear int,
    DayofWeek int,
    DayofWeekName varchar(10),
    Week int,
    Month int,
    MonthName varchar(10),
    Quarter int,
    Year int,
    IsWeekend bit,
    IsLeapYear bit
)

-- Declare and set variables for loop
Declare
@StartDate datetime,
@EndDate datetime,
@Date datetime

Set @StartDate = '2000/01/01'
Set @EndDate = '2020/12/31'
Set @Date = @StartDate

-- Loop through dates
WHILE @Date <=@EndDate
BEGIN
    -- Check for leap year
    DECLARE @IsLeapYear BIT
    IF ((Year(@Date) % 4 = 0) AND (Year(@Date) % 100 != 0 OR Year(@Date) % 400 = 0))
    BEGIN
        SELECT @IsLeapYear = 1
    END
    ELSE
    BEGIN
        SELECT @IsLeapYear = 0
    END

    -- Check for weekend
    DECLARE @IsWeekend BIT
    IF (DATEPART(dw, @Date) = 1 OR DATEPART(dw, @Date) = 7)
    BEGIN
        SELECT @IsWeekend = 1
    END
    ELSE
    BEGIN
        SELECT @IsWeekend = 0
    END

    -- Insert record in dimension table
    INSERT Into Dim_Time
    (
    [Date],
    [DateString],
    [Day],
    [DayofYear],
    [DayofWeek],
    [Dayofweekname],
    [Week],
    [Month],
    [MonthName],
    [Quarter],
    [Year],
    [IsWeekend],
    [IsLeapYear]
    )
    Values
    (
    @Date,
    CONVERT(varchar(10), @Date, 105), -- See links for 105 explanation
    Day(@Date),
    DATEPART(dy, @Date),
    DATEPART(dw, @Date),
    DATENAME(dw, @Date),
    DATEPART(wk, @Date),
    DATEPART(mm, @Date),
    DATENAME(mm, @Date),
    DATENAME(qq, @Date),
    Year(@Date),
    @IsWeekend,
    @IsLeapYear
    )

    -- Goto next day
    Set @Date = @Date + 1
END
GO
