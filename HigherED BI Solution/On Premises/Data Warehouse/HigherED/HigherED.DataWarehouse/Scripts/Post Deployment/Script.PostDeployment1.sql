/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO DimDate ([DateSK], [FullDate], [Day], [DayOfWeek], [DayOfWeekNumber], [DayOfWeekInMonth], [CalendarMonthNumber], [CalendarMonthName], [CalendarQuarterNumber], [CalendarQuarterName], [CalendarYearNumber], [StandardDate], [WeekDayFlag], [HolidayFlag], [OpenFlag], [FirstDayOfCalendarMonthFlag], [LastDayOfCalendarMonthFlag], HolidayText)
 select top 1  19000101,'1/1/1900',  Day, DayOfWeek, DayOfWeekNumber, DayOfWeekInMonth, CalendarMonthNumber, CalendarMonthName, CalendarQuarterNumber, CalendarQuarterName, CalendarYearNumber, '1/1/1900', WeekDayFlag, HolidayFlag, OpenFlag, FirstDayOfCalendarMonthFlag, LastDayOfCalendarMonthFlag, HolidayText
 from dimdate
 where dayofweek = 'monday'
GO


EXEC dbo.LoadDateDimension @Start = '1/1/2003', @End = '1/1/2019'