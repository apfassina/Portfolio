-- fitbit data exploration for Bellabeat


-- find how many participants (33) and length of survey (31)
SELECT COUNT(DISTINCT Id) AS participants, COUNT(distinct(ActivityDate)) AS days
FROM `bb-fitness1.fitbit_data.activity_daily`;

-- days sedentary by person sedentary minutes 1440 min = 24h (17 distinct Ids)
SELECT Id, COUNT(ActivityDate) AS days_sedentary
FROM `bb-fitness1.fitbit_data.activity_daily`
WHERE SedentaryMinutes = 1440
GROUP BY Id
ORDER BY days_sedentary DESC
;

-- explore if 1440 min sedentary means no records (there is steps and distance tracked)
SELECT *
FROM `bb-fitness1.fitbit_data.activity_daily`
WHERE SedentaryMinutes = 1440 and TotalSteps != 0
ORDER BY Id
;

-- add sedentary minutes and count to get days not active
SELECT Id, COUNT(ActivityDate) AS days_not_active
FROM `bb-fitness1.fitbit_data.activity_daily`
WHERE TotalSteps = 0 and TotalDistance = 0 and SedentaryMinutes = 1440
GROUP BY Id
;

--records of steps/hour = 33
SELECT COUNT(DISTINCT(Id)) AS participants
FROM `bb-fitness1.fitbit_data.new_hourly_steps`
;

--records of sleep = 24
SELECT COUNT(DISTINCT(Id)) AS participants
FROM `bb-fitness1.fitbit_data.new_sleep`
;

--records of weight = 9
SELECT COUNT(DISTINCT(Id)) AS participants
FROM `bb-fitness1.fitbit_data.weight`
;

--converted string to time in table new_hourly_steps (split time and date in excel)
SELECT Id, Day, PARSE_TIME("%l:%M:%S %p", Time) AS new_time, StepTotal
FROM `bb-fitness1.fitbit_data.new_hourly_steps`
;

--parse_time in new sleep
SELECT Id, Day, TotalMinutesAsleep, TotalTimeInBed,TotalSleepRecords, PARSE_TIME("%l:%M:%S %p", Time) AS new_time
FROM `bb-fitness1.fitbit_data.new_sleep`
;

--summarize totals and join with total of active and not active days
SELECT t.*, a.days_active, a.days_not_active, a.active_rate
FROM (
  SELECT Id, 
  SUM(TotalSteps) AS steps, 
  SUM(Calories) AS calories, 
  SUM(SedentaryMinutes) AS sedentary_min, 
  SUM(VeryActiveMinutes) + SUM(FairlyActiveMinutes) + SUM(LightlyActiveMinutes) AS active_min,
  SUM(TrackerDistance) AS distance,
  FROM `bb-fitness1.fitbit_data.activity_daily`
  GROUP BY Id
) t
FULL JOIN(
  WITH act AS (
    SELECT Id, COUNT(ActivityDate) AS days_active
    FROM `bb-fitness1.fitbit_data.activity_daily`
    WHERE SedentaryMinutes != 1440 and TotalSteps != 0
    GROUP BY Id
  )
  SELECT *, (31 - act.days_active) AS days_not_active, 100 - (((31 - act.days_active)/31)*100) AS active_rate
  FROM act
  ORDER BY act.days_active
) a
ON t.Id = a.Id
;



