IF OBJECT_ID ('DateDim', 'U') IS NOT NULL
DROP TABLE DateDim

CREATE TABLE DateDim (
   Date_ID INT NOT NULL PRIMARY KEY, 
   [Full_date] DATE NOT NULL,     
   [Day_of_week] TINYINT NOT NULL, 
   [Day_of_week_name] VARCHAR(10) NOT NULL, 
   [Month] TINYINT NOT NULL,     
   [Month_name] VARCHAR(10) NOT NULL,   
   [Quarter] TINYINT NOT NULL,  
   [Quarter_name] VARCHAR(6) NOT NULL,  
   [Year] INT NOT NULL, 
   [Month_year] CHAR(7) NOT NULL, 
   )

SET NOCOUNT ON

TRUNCATE TABLE DateDim

DECLARE @CurrentDate DATE = '2013-01-01'   
DECLARE @EndDate DATE = '2020-09-05'

WHILE @CurrentDate < @EndDate
BEGIN
   INSERT INTO DateDim (
      [Date_ID],
      [Full_date],
      [Day_of_week],
      [Day_of_week_name],
      [Month],
      [Month_name],
      [Quarter],
      [Quarter_name],
      [Year],
      [Month_year]
      )
   SELECT Date_ID = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
      Full_date = @CurrentDate,
      
      Day_of_week = DATEPART(dw, @CurrentDate),
      Day_of_week_name = DATENAME(dw, @CurrentDate),
      [Month] = MONTH(@CurrentDate),
      [Month_name] = DATENAME(mm, @CurrentDate),
      [Quarter] = DATEPART(q, @CurrentDate),
      [Quarter_name] = CASE 
         WHEN DATENAME(qq, @CurrentDate) = 1
            THEN 'First'
         WHEN DATENAME(qq, @CurrentDate) = 2
            THEN 'second'
         WHEN DATENAME(qq, @CurrentDate) = 3
            THEN 'third'
         WHEN DATENAME(qq, @CurrentDate) = 4
            THEN 'fourth'
         END,
      [Year] = YEAR(@CurrentDate),
      [Month_year] = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3))
      

   SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END