USE [AdventureWorksDWH]


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[edw].[Date]') AND type IN (N'U'))
BEGIN
CREATE TABLE [edw].[DimDate]
(
	[DateID] [int] NOT NULL,
	[CalenderDate] [datetime] NOT NULL, 
	[Year] [int] NOT NULL, 
	[Month] [int] NOT NULL, 
	[MonthName] [nvarchar](10) NOT NULL,
	[DayNumber] [int] NOT NULL, 
	[Quarter] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL, 
	[WeekdayName] [nvarchar](9) NOT NULL,
	[Week] [int] NOT NULL
	CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED
	(
	[DateID] ASC
	)
) ON [PRIMARY]



/**** adding date data ****/
DECLARE @StartDate DATETIME;

DECLARE @EndDate DATETIME;

SET @StartDate = '1951-09-17'
SET @EndDate = DATEADD(YEAR,100,getdate())

while @StartDate <= @EndDate
	BEGIN 
		INSERT INTO edw.[DimDate](
			[DateID],
			[CalenderDate], 
			[Year], 
			[Month], 
			[MonthName],
			[DayNumber],
			[Quarter],
			[DayOfWeek],
			[WeekdayName],
			[Week]
			)
			SELECT
			CONVERT(char(8), @StartDate, 112) as DateID
			,@StartDate as [Date]
			,DATEPART(year, @StartDate) as Year
			,DATEPART(month, @StartDate) as Month 
			,DATENAME(month, @StartDate) as MonthName
			,DATEPART(day, @StartDate) as Day
			,DATEPART(quarter, @StartDate) as Quarter
			,DATEPART(weekday, @StartDate) as DayOfWeek
			,DATENAME(weekday,@StartDate) as WeekdayName
			,DATEPART(WEEK, @StartDate) as Week

			SET @StartDate = DATEADD(dd,1,@StartDate)
	END

END