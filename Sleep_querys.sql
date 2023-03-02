Select * 
From PortfolioProject.dbo.Sleep;

Select TOP 10 *
From PortfolioProject.dbo.Sleep;

Select * 
From PortfolioProject.dbo.AvgAwak


---- Drop duplicates and useless colum at the end, test calidad sumando los porcentages

---- Times in hours

ALTER TABLE PortfolioProject.dbo.Sleep
ADD BedtimeHours TIME,
    WakeuptimeHours TIME;

UPDATE PortfolioProject.dbo.Sleep
SET BedtimeHours = CONVERT(TIME, CONVERT(VARCHAR(8), Bedtime, 108))

ALTER TABLE PortfolioProject.dbo.Sleep
ALTER COLUMN BedtimeHours TIME(0);

UPDATE PortfolioProject.dbo.Sleep
SET WakeuptimeHours = CONVERT(TIME, CONVERT(VARCHAR(8), [Wakeup time], 108))

ALTER TABLE PortfolioProject.dbo.Sleep
ALTER COLUMN WakeuptimeHours TIME(0);



---- Day of the week

ALTER TABLE PortfolioProject.dbo.Sleep
ADD day VARCHAR(9);


UPDATE PortfolioProject.dbo.Sleep SET day = DATENAME(dw, bedtime);


---- Sleep types values

ALTER TABLE PortfolioProject.dbo.Sleep
DROP COLUMN RealSleep;

ALTER TABLE PortfolioProject.dbo.Sleep
DROP COLUMN SleepRem;

ALTER TABLE PortfolioProject.dbo.Sleep
DROP COLUMN SleepDeep;

ALTER TABLE PortfolioProject.dbo.Sleep
DROP COLUMN SleepLight;

ALTER TABLE PortfolioProject.dbo.Sleep
DROP COLUMN RealNoSleep;


ALTER TABLE PortfolioProject.dbo.Sleep
ADD RealSleep DECIMAL(4,2),
	SleepRem DECIMAL(4,2),
	SleepDeep DECIMAL(4,2),
	SleepLight DECIMAL(4,2),
	RealNoSleep DECIMAL(4,2);

UPDATE PortfolioProject.dbo.Sleep 
SET RealSleep = [Sleep duration]*[Sleep efficiency],
	SleepRem = [Sleep duration]*([REM sleep percentage]/100),
    SleepDeep = [Sleep duration]*([Deep sleep percentage]/100),
    SleepLight = [Sleep duration]*([Light sleep percentage]/100),
    RealNoSleep = [Sleep duration]*(1-[Sleep efficiency]);


--- Dealing With Null Values

--- Tester
SELECT *
FROM PortfolioProject.dbo.Sleep
WHERE ID IS NULL
   OR AGE IS NULL
   OR Gender IS NULL
   OR Bedtime IS NULL
   OR [Wakeup time] IS NULL
   OR [Sleep duration] IS NULL
   OR [Sleep efficiency] IS NULL
   OR [REM sleep percentage] IS NULL
   OR [Deep sleep percentage] IS NULL
   OR [Light sleep percentage] IS NULL
   OR Awakenings IS NULL
   OR [Caffeine consumption] IS NULL
   OR [Alcohol consumption] IS NULL
   OR [Smoking status] IS NULL
   OR [Exercise frequency] IS NULL
   OR [BedtimeHours] IS NULL
   OR [WakeuptimeHours] IS NULL
   OR [day] IS NULL
   OR [RealSleep] IS NULL
   OR [SleepRem] IS NULL
   OR [SleepDeep] IS NULL
   OR [SleepLight] IS NULL
   OR [RealNoSleep] IS NULL




--- For Nulls in Awakening we'll use similars based on sleep efficiency, in a range of 0.2
--- I will create a new table to set the range values

DELETE FROM PortfolioProject.dbo.AvgAwak;

CREATE TABLE PortfolioProject.dbo.AvgAwak (
    [Sleep Efficiency] FLOAT,
    Awakenings FLOAT
);


Select * 
From PortfolioProject.dbo.AvgAwak


INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.1, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] <= 0.1 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.2, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.1 AND [Sleep Efficiency] <= 0.2 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.3, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.2 AND [Sleep Efficiency] <= 0.3 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.4, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.3 AND [Sleep Efficiency] <= 0.4 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.5, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.4 AND [Sleep Efficiency] <= 0.5 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.6, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.5 AND [Sleep Efficiency] <= 0.6 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.7, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.6 AND [Sleep Efficiency] <= 0.7 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.8, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.7 AND [Sleep Efficiency] <= 0.8 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 0.9, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.8 AND [Sleep Efficiency] <= 0.9 AND Awakenings IS NOT NULL;

INSERT INTO PortfolioProject.dbo.AvgAwak ([Sleep Efficiency], Awakenings)
SELECT 1, COALESCE(ROUND(AVG(Awakenings), 0), 0)
FROM PortfolioProject.dbo.Sleep
WHERE [Sleep Efficiency] > 0.8 AND Awakenings IS NOT NULL;

UPDATE PortfolioProject.dbo.Sleep
SET Awakenings = (
    SELECT TOP 1 Awakenings
    FROM PortfolioProject.dbo.AvgAwak
    WHERE [Sleep Efficiency] <= Sleep.[Sleep Efficiency]
    AND Awakenings IS NOT NULL
    ORDER BY [Sleep Efficiency] DESC
)
WHERE Awakenings IS NULL;



--- There are no atypical values in alcohol and caffeine consumption, so i will use the mean.

UPDATE PortfolioProject.dbo.Sleep
SET [Caffeine consumption] = (SELECT AVG([Caffeine consumption]) FROM PortfolioProject.dbo.Sleep WHERE [Caffeine consumption] IS NOT NULL)
WHERE [Caffeine consumption] IS NULL;

UPDATE PortfolioProject.dbo.Sleep
SET [Alcohol consumption] = (SELECT AVG([Alcohol consumption]) FROM PortfolioProject.dbo.Sleep WHERE [Alcohol consumption] IS NOT NULL)
WHERE [Alcohol consumption] IS NULL;

UPDATE PortfolioProject.dbo.Sleep
SET 
    [Caffeine consumption] = CASE WHEN [Caffeine consumption] IS NULL THEN (SELECT (ROUND(AVG([Caffeine consumption]), 0) FROM PortfolioProject.dbo.Sleep WHERE [Caffeine consumption] IS NOT NULL) ELSE [Caffeine consumption] END,
    [Alcohol consumption] = CASE WHEN [Alcohol consumption] IS NULL THEN (SELECT (ROUND(AVG([Alcohol consumption]), 0) FROM PortfolioProject.dbo.Sleep WHERE [Alcohol consumption] IS NOT NULL) ELSE [Alcohol consumption] END;



--- For exercise frequency I will use the median.

UPDATE PortfolioProject.dbo.Sleep
SET 
    [exercise frequency] = (SELECT MAX([exercise frequency]) as [exercise frequency]
                            FROM (SELECT [exercise frequency], NTILE(4) OVER (ORDER BY [exercise frequency]) as [quartile]
                                  FROM PortfolioProject.dbo.Sleep) i
                            WHERE quartile = 2
                            GROUP BY quartile)
WHERE [exercise frequency] IS NULL;


--- Formula for calculating quartiles and the median.
SELECT  max([exercise frequency]) as [exercise frequency], quartile
FROM(SELECT [exercise frequency], ntile(4) OVER (ORDER BY [exercise frequency]) AS [quartile] 
	 FROM   PortfolioProject.dbo.Sleep) i
	 WHERE quartile = 2
GROUP BY quartile



--- Calculate Sleep Quality Index



--- Remove duplicates

WITH RowNumCTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY ID, 
                Age, 
                Gender, 
                Bedtime, 
                [Wakeup time], 
                [Sleep duration], 
                [Sleep efficiency], 
                [REM sleep percentage], 
                [Deep sleep percentage], 
                [Light sleep percentage], 
                Awakenings, 
                [Caffeine consumption], 
                [Alcohol consumption], 
                [Smoking status], 
                [Exercise frequency], 
                BedtimeHours, 
                WakeuptimeHours, 
                [day], 
                RealSleep, 
                SleepRem, 
                SleepDeep, 
                SleepLight 
        ORDER BY ID
        ) row_num
    FROM PortfolioProject.dbo.Sleep
)
DELETE
FROM RowNumCTE
WHERE row_num > 1;


--- Delete Unused Columns

ALTER TABLE PortfolioProject.dbo.Sleep
DROP COLUMN Bedtime, [Wakeup time], ID;


--- Create group tables, for specific studies

SELECT Gender,
    ROUND(AVG(Age), 2) AS Age,
    ROUND(AVG([Sleep duration]), 2) AS [Sleep duration],
    ROUND(AVG([Sleep efficiency]), 2) AS [Sleep efficiency],
    ROUND(AVG([REM sleep percentage]), 2) AS [REM sleep percentage],
    ROUND(AVG([Deep sleep percentage]), 2) AS [Deep sleep percentage],
    ROUND(AVG([Light sleep percentage]), 2) AS [Light sleep percentage],
    ROUND(AVG(Awakenings), 2) AS Awakenings,
    ROUND(CAST(SUM(CASE WHEN [Smoking status] = 'Yes' THEN 1 ELSE 0 END) AS decimal) / COUNT(*) * 100, 2) AS SmokingStatusYesPct,
    ROUND(AVG([Caffeine consumption]), 2) AS [Caffeine consumption],
    ROUND(AVG([Alcohol consumption]), 2) AS [Alcohol consumption],
    ROUND(AVG([Exercise frequency]), 2) AS [Exercise frequency],
    ROUND(AVG(DATEPART(HOUR, BedtimeHours)), 2) AS BedtimeHours,
    ROUND(AVG(DATEPART(HOUR, WakeuptimeHours)), 2) AS WakeuptimeHours,
    ROUND(AVG(RealSleep), 2) AS RealSleep,
    ROUND(AVG(SleepRem), 2) AS SleepRem,
    ROUND(AVG(SleepDeep), 2) AS SleepDeep,
    ROUND(AVG(SleepLight), 2) AS SleepLight,
    ROUND(AVG(RealNoSleep), 2) AS RealNoSleep
INTO PortfolioProject.dbo.SleepGender
FROM PortfolioProject.dbo.Sleep
GROUP BY Gender;

SELECT FLOOR(Age/20)*20 AS AgeGroup,
    ROUND(AVG([Sleep duration]), 2) AS [Sleep duration],
    ROUND(AVG([Sleep efficiency]), 2) AS [Sleep efficiency],
    ROUND(AVG([REM sleep percentage]), 2) AS [REM sleep percentage],
    ROUND(AVG([Deep sleep percentage]), 2) AS [Deep sleep percentage],
    ROUND(AVG([Light sleep percentage]), 2) AS [Light sleep percentage],
    ROUND(AVG(Awakenings), 2) AS Awakenings,
    ROUND(CAST(SUM(CASE WHEN [Smoking status] = 'Yes' THEN 1 ELSE 0 END) AS decimal) / COUNT(*) * 100, 2) AS SmokingStatusYesPct,
    ROUND(AVG([Caffeine consumption]), 2) AS [Caffeine consumption],
    ROUND(AVG([Alcohol consumption]), 2) AS [Alcohol consumption],
    ROUND(AVG([Exercise frequency]), 2) AS [Exercise frequency],
    ROUND(AVG(DATEPART(HOUR, BedtimeHours)), 2) AS BedtimeHours,
    ROUND(AVG(DATEPART(HOUR, WakeuptimeHours)), 2) AS WakeuptimeHours,
    ROUND(AVG(RealSleep), 2) AS RealSleep,
    ROUND(AVG(SleepRem), 2) AS SleepRem,
    ROUND(AVG(SleepDeep), 2) AS SleepDeep,
    ROUND(AVG(SleepLight), 2) AS SleepLight,
    ROUND(AVG(RealNoSleep), 2) AS RealNoSleep
INTO PortfolioProject.dbo.SleepAge
FROM PortfolioProject.dbo.Sleep
GROUP BY FLOOR(Age/20)*20;

SELECT 
    ROUND(AVG(Age), 2) AS Age,
    ROUND(AVG([Sleep duration]), 2) AS [Sleep duration],
    ROUND(AVG([Sleep efficiency]), 2) AS [Sleep efficiency],
    ROUND(AVG([REM sleep percentage]), 2) AS [REM sleep percentage],
    ROUND(AVG([Deep sleep percentage]), 2) AS [Deep sleep percentage],
    ROUND(AVG([Light sleep percentage]), 2) AS [Light sleep percentage],
    ROUND(AVG(Awakenings), 2) AS Awakenings,
    ROUND(CAST(SUM(CASE WHEN [Smoking status] = 'Yes' THEN 1 ELSE 0 END) AS decimal) / COUNT(*) * 100, 2) AS SmokingStatusYesPct,
    ROUND(AVG([Caffeine consumption]), 2) AS [Caffeine consumption],
    ROUND(AVG([Alcohol consumption]), 2) AS [Alcohol consumption],
    ROUND(AVG([Exercise frequency]), 2) AS [Exercise frequency],
    ROUND(AVG(DATEPART(HOUR, BedtimeHours)), 2) AS BedtimeHours,
    ROUND(AVG(DATEPART(HOUR, WakeuptimeHours)), 2) AS WakeuptimeHours,
    ROUND(AVG(RealSleep), 2) AS RealSleep,
    ROUND(AVG(SleepRem), 2) AS SleepRem,
    ROUND(AVG(SleepDeep), 2) AS SleepDeep,
    ROUND(AVG(SleepLight), 2) AS SleepLight,
    ROUND(AVG(RealNoSleep), 2) AS RealNoSleep
INTO PortfolioProject.dbo.SleepSmokingStatus
FROM PortfolioProject.dbo.Sleep
GROUP BY [Smoking status];