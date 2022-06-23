# Bellabeat Case Study
*Using SQL and Tableau*


### Overview

Founded by Urška Sršen and Sando Mur, Bellabeat is a high-tech company that creates health-focused smart products. Their products are designed to inspire and empower women with knowledge about their health and habits. Bellabeat wants to analyze data from a smart product to get a better undestanding on how consumers use the product. And with this information, provide high-level recommendations for how these trends can inform the marketing strategy.


### Business Task

Analyze data gathered from the smart product. See if there are trends in the usage and if they can be applied to Bellabeat customers. And also if these trends can somehow influence the comapny's marketing strategy.

#### Stakeholders
* Urška Sršen and Sando Mur - cofounders
* Bellabeat marketing analytics team



### Prepare and Process

1. About the data:  
The data is stored in Kaggle and is open source.   
It's a dataset from Fitbit users who consented to have their personal data tracked. Including physical activity, weight, sleep activity and heart rate. It is arranged in 18 csv tables and each table represents a different aspect of the data.

2. Sort and filter the data:  
I first opened the files in  Excel to get a better idea how the tables were organized. I decided to separate the date and time in the sleep and hourly steps tables. I did this because I wanted to have the possibility to filter only by the time that the was recorded.

3. Importing the dataset:  
I'm using BigQuery for the data exploration, so I uploaded the tables with the daily activities, hourly steps, sleep day and weight log. In this analysis I'm focusing on the steps made by the users.

4. Prepare for analysis:  
I wrote serval queries to understand better the data and see how I could organize it for my data vizualization.  [Here](https://github.com/apfassina/Portfolio/blob/main/BellaBeat/BellaBeat_SQL.sql) you can see all the queries I made in BigQuery.

5. Queries findings:
* There were 33 participants (Id) and the study was in a 31 day period.
* Total of sedentary minutes per day being 1440 (24h) does not mean that there was no step activity or distance tracked.
* To get not active days I selected the activity days that the total steps, total distance were 0 and sedentary minutes were 1440. That showed me that 15 Ids had at least a not active day.
* Checked how many participants recorded data for sleep, weight and hourly steps. For sleep only 24 users recorded data, for weight only 8 and all users recorded hourly steps. I decided not to use the sleep and weight records because they do not represent all of the participants.
* In the hourly steps table, I identified that the 'Time' column wasn't in a time format. So I used parse_time as new_time to be able to use it later.
* I summarized the daily activity table in totals per Id. Giving me the sum of total steps, sum of calories, sum of sedentary minutes, sum of active minutes (very, fairly and lightly active minutes) and the sum of the distance.
* After geting the summary I then joined with a table that had counted the total of days that the users were active and not active, and the active rate.
* I then used the daily activity, the hourly steps and summary of activity in Tableau.

### Analyze and Share

*You can find the Tableau Dasboard here*


##### Participation by Id

First I wanted to vizualize the active and not active days by participant (Id)

<img src= https://user-images.githubusercontent.com/100497010/175321242-e9e2c0ff-9a9b-4fb5-88fb-41477f1c3440.png height="400" />

Here we can see that only 12 Ids recorded data in all 31 days.

#### Study of steps


<img src= https://user-images.githubusercontent.com/100497010/175323677-ee4e818c-7421-44e2-9510-bc5a9d06a8c3.png width="500" />

With the average of the total steps, I separated them by weekday so it's possible to see which days of the week participants did most of their steps.
We can see that the day of the week that has the highest average of total steps is Saturday. But when we look at the total of steps by week day, it shows that Tuesday is the day of the week that has the highest step count.
For lowest steps average and lowest steps total, both occured in the same weekday, Sunday.


In the graph below, we can see how the average of steps of participants behaved by time of day.

<img src= https://user-images.githubusercontent.com/100497010/175323663-fa7d5b6a-030c-4f18-b0ad-756cc9d74032.png width="600" />

When looking at the graph we can see that the time of day that has the highest average is 6PM and the lowest is 3AM. We can see that there's a increase of steps at 12PM, then a drop at 3PM. After that there's another increase at 6PM, which is the hour with the highest average of steps. From 12AM to 5AM there's only a small amount of steps counted. And 3PM is the time that the average of steps is the lowest during business hours (considering 9AM to 5PM).



As for what it means the amount of steps each participant took, we can see in the graph below.

Study of Steps <img src= https://user-images.githubusercontent.com/100497010/175323640-45fef3af-5f4d-478b-b37e-5a1a528a88c9.png width="900" />


It's possible to see that the total of steps has a correlation with the total distance. But when we look to active minutes, we can see that having the highest step count doesn't mean having the highest active minutes. The participant with the most active minutes, has less than half of the amount of steps of the one with the most steps. 


Calories x active min <img src= https://user-images.githubusercontent.com/100497010/175323697-ec5f36dd-ad32-4ac8-b4c7-4ea40b067ef8.png width="500" />

### Conclusion

