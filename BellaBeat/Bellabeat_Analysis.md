# Bellabeat Case Study
*Using SQL and Tableau*


### Overview

Founded by Urška Sršen and Sando Mur, in 2013, Bellabeat is a high-tech company that creates health-focused smart products. Their products are designed to inspire and empower women with knowledge about their health and habits. Their products are available on their website and through a growing number of online retailers.  

The company has invested in traditional advertising media, but their main focus is digital marketing.  

Sršen knows that analyzing available data from a smart product might reveal some insights on growth opportunities. And understanding how consumers use the product and what trends are present, might also guide a marketing strategy for the company. With that in mind, the stakeholders want a high-level recommendation for Bellabeat’s marketing strategy.



### Business Task

* Select a product from Bellabeat’s portfolio.
*	Analyze data provided to identify possible trends.
*	See if the trends can be applied to Bellabeat customers.
*	And how could these trends possibly influence Bellabeat’s marketing strategy.


#### Stakeholders
* Urška Sršen and Sando Mur - cofounders
* Bellabeat marketing analytics team



### Prepare

#### About the data:  

The data is stored in Kaggle and is open source. It’s a dataset containing information about 33 Fitbit users. They consented to have their personal data tracked in a period of 31 days. The data is organized in 18 csv files that represent information about physical activity, heart rate, steps, sleep, and weight.

#### Sort and filter the data:  

When the files were opened in Excel, it gave a better understanding on how the tables are organized and if any alterations needed to be made.  
When studying the files for sleep and hourly steps, it was noticed that every log had a timestamp. To make it in the same format as the others, time and hour were separated in the sleep and hourly steps table. This way tables can be joined by date later if needed.


### Process

#### Tools:  
For this case study, BigQuery will be used to explore the data. Due to the amount of data that was collected it will be more productive than exploring it in a spreadsheet, e.g., Excel. As for visualization, Tableau will be used to create graphics and a dashboard.

#### Importing the data:

The following tables were imported to BigQuery for exploration:  
*	Daily activity.
*	Hourly steps.
*	Sleep.
*	Weight.

#### Data exploration:

To better understand the data, queries were written in BigQuery. That way there’s a certainty that the data is clean and ready to analyze. [Here](https://github.com/apfassina/Portfolio/blob/main/BellaBeat/BellaBeat_SQL.sql) you can find all the queries that were written for this project.


### Analyze

In the queries performed, the data was explored and manipulated to be analyzed. It was also necessary to format data and create summaries to better understand the trends present.  
*	There were 33 participants (IDs) and the study was in a 31 day period.
*	The total of sedentary minutes per day being 1440 (24h) does not mean that there was no step activity or distance tracked.
*	To determine not active days, the total steps and total distance needed to be 0, and 1440 sedentary minutes. That resulted in 15 IDs that had at least one day not active.
*	When counting how many IDs recorded data for sleep and weight, it resulted that only 24 IDs recorded data for sleep and only 8 for weight.
*	All IDs had hourly steps recorded.
*	When importing the hourly steps table, the ‘Time’ was imported as a string, so the format was changed using parse_time.
*	The daily activities table was summarized in totals by ID. In this summary it’s given the IDs and for each the sum of: steps, calories, sedentary minutes, active minutes and distance that were recorded during the 31 days.
*	With the daily activities table, it was also calculated the total of days active, days not active and the percentage of days active by ID. Then these totals were joined to the summarized totals. Then saved into a new table called Summary.
*	The data for sleep and weight were not further analyzed because it didn’t represent the whole sample.


### Share

*You can find the strudy in Tableau [here](https://public.tableau.com/views/bellabeat_case_study/BellabeatDashboard?:language=en-US&:display_count=n&:origin=viz_share_link)*


When looking at the Participation by Id on the graphic below, it’s possible to see that only 12 IDs were active for the total amount of the 31 days. This indicates that the other 21 IDs were not active, or didn’t use their device, for at least 1 day.

##### Participation by ID

<img src= https://user-images.githubusercontent.com/100497010/175321242-e9e2c0ff-9a9b-4fb5-88fb-41477f1c3440.png height="400" />





#### Step analysis

Calculating the total steps by weekday and also their average, it is noticeable that Sunday is the day that has a lower average and lower total of steps. But when taking in account the higher average and total of steps, they fall in different days. For the highest step total, it is on Tuesday, as for the highest average happened on Saturday.   

##### Average Steps by Weekday
<img src= https://user-images.githubusercontent.com/100497010/175323677-ee4e818c-7421-44e2-9510-bc5a9d06a8c3.png width="500" />





When considering the average of steps by time of day (in hours), there’s other noticeable trends the steps average:
*	Highest average happened at 6PM.
*	Lowest average happened at 3AM.
*	There’s a drop of average from 2PM to 3PM, being at its lowest when considering business hours (9AM to 5PM). 
*	Between 12AM and 5AM is the longer period with low average of steps.
*	The average of steps starts increasing at 6AM, and again after the 3PM drop.
*	From 7PM to 8PM there’s a significant drop, and then continues dropping gradually from 8PM to 11PM. 


##### Average Steps by Hour of Day
<img src= https://user-images.githubusercontent.com/100497010/175323663-fa7d5b6a-030c-4f18-b0ad-756cc9d74032.png width="700" />





As for how the steps relate to distance, activity, and calories, it’s possible to notice some trends in the graph below.
*	There’s a correlation with the total distance and the total steps.
*	The ID with the most steps doesn’t have the most active minutes or more calories.
*	The ID with most active minutes, has less than 50% of steps than the ID with most steps.
*	The ID with most calories, has approximately 54% of the steps that the ID with most steps.

##### Step by distance, active minutes and calories per ID
<img src= https://user-images.githubusercontent.com/100497010/175323640-45fef3af-5f4d-478b-b37e-5a1a528a88c9.png width="900" />





### Conclusion

Due to the sample size being small, having a short range of days that it was collected, and not knowing the IDs demographics, the data can be biased, and the insights might not be applicable to Bellabeats customers. Therefore, if a deeper analysis is needed, the recommendation is to Bellabeat gather its own data to have a more accurate representation.  
From analyzing the available data, it was possible to get some interesting insights:
*	Saturday has the highest average of steps by ID. 
*	Sunday is the weekday with the lowest average of steps.
*	There’s a significant drop of steps at 3PM and another at 8PM.
*	Having the most steps not necessarily means higher activity minutes.


#### Recomendations

* Current customer engagement: 
  + Use the Bellabeat app to have customers set goals for themselves. And even competitions with friends.
  + Send notifications during the times that the average step count was the lowest, to encourage achieving their goal.
  + Recommend activities via app for the day it has less steps.

* Reaching potential customers:
  + Knowing when the lowest amount of steps are, they could share these lowest times/dates and promote the products/app to potential customers. And suggest to them to use Bellabeat products to understand their habits better and if they are doing the same average of steps as others.


Thank you for reading my Bellabeat case study!  
This is my first project in data analytics, and I would appreciate any feedback.

June 2022
