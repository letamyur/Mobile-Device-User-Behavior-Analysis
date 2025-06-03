#-----------------------------------------------------------

# Data Overview & Exploration

#-----------------------------------------------------------

# 1. View the first 10 rows of the table to familiarize yourself with the data structure
select *
from mobile_usage
limit 10;
# 2. Total number of users in the table
select
	count(*) as total_users
from mobile_usage;
# 3. View unique age values to understand the range of data
select
	distinct age
from mobile_usage;

#-----------------------------------------------------------

# Data Quality Check
select
    count(*) as total_records,
    count(distinct User_ID ) as unique_users,
    sum(case when Daily_Screen_Time_Hours is null then 1 else 0 end) as null_screen_time,
    sum(case when Total_App_Usage_Hours is null then 1 else 0 end) as null_app_usage,
    sum(case when Number_of_Apps_Used is null then 1 else 0 end) as null_apps_used,
    sum(case when Social_Media_Usage_Hours is null then 1 else 0 end) as null_social_media_hours,
    sum(case when Productivity_App_Usage_Hours  is null then 1 else 0 end) as null_prod_hours,
    sum(case when Gaming_App_Usage_Hours  is null then 1 else 0 end) as null_gaming_hours,
    sum(case when Location  is null then 1 else 0 end) as null_location
from mobile_usage;

#-----------------------------------------------------------

# Analisys Stage

#-----------------------------------------------------------

# Overall Usage Statistics
# 1. Key average usage indicators
select
    count(distinct User_ID) as total_users,
    avg(Age) as avg_age,
    avg(Daily_Screen_Time_Hours) as avg_screen_time,
    avg(Total_App_Usage_Hours) as avg_app_usage,
    avg(Number_of_Apps_Used) as avg_apps_count
from mobile_usage;

# 2. Percentage of time spent using different categories of applications to the total time
select
	User_Id,
	Total_App_Usage_Hours,
	Social_Media_Usage_Hours,
	Productivity_App_Usage_Hours,
	Gaming_App_Usage_Hours,
	round(Social_Media_Usage_Hours / Total_App_Usage_Hours *100) as percentage_of_sm,
	round(Productivity_App_Usage_Hours / Total_App_Usage_Hours *100) as percentage_of_prod,
	round(Gaming_App_Usage_Hours / Total_App_Usage_Hours *100) as percentage_of_gaming
from mobile_usage
order by percentage_of_sm desc;

#-----------------------------------------------------------

# Demographical Behavior Analysis
# 1. Average usage rates by location
select
	Location,
	count(User_Id) as user_count,
	round(avg(Daily_screen_time_hours),2) as avg_screen_time,
	round(avg(Total_App_Usage_Hours),2) as avg_apps_usage,
	round(avg(Number_of_Apps_Used),2) as avg_apps_count
from mobile_usage
group by Location
order by avg_apps_usage desc;

# 2. Average usage rates by age group
select
	case
		when Age <= 25 then "18-25"
		when Age <= 35 then "26-35"
		when Age <= 45 then "36-45"
		when Age <= 55 then "46-55"
		else "55+"
	end as age_group, # Creating age groups
	count(*) as user_count,
    round(avg(Daily_Screen_Time_Hours), 2) as avg_screen_time,
    round(avg(Social_Media_Usage_Hours), 2) as avg_social_media,
    round(avg(Productivity_App_Usage_Hours), 2) as avg_productivity,
    round(avg(Gaming_App_Usage_Hours), 2) as avg_gaming,
    round(avg(Number_of_Apps_Used), 2) as avg_apps_count
from mobile_usage
group by age_group
order by avg_screen_time desc;

# 3. Differences in behavior between men and women
select
    Gender,
    count(*) as user_count,
    round(avg(Daily_Screen_Time_Hours), 2) as avg_screen_time,
    round(avg(Social_Media_Usage_Hours), 2) as avg_social_media,
    round(avg(Productivity_App_Usage_Hours), 2) as avg_productivity,
    round(avg(Gaming_App_Usage_Hours), 2) as avg_gaming,
    round(avg(Number_of_Apps_Used), 1) as avg_apps_count
from mobile_usage
group by Gender;

#-----------------------------------------------------------

# User Categorization & Segmentation
# 1. Categorize users by screen usage intensity
select 
    case 
        when Daily_Screen_Time_Hours >= 8 then 'heavy_user'
        when Daily_Screen_Time_Hours >= 4 then 'medium_user'
        when Daily_Screen_Time_Hours >= 1 then 'light_user'
        else 'minimal_user'
    end as user_category, # Create categories by screen time
    count(*) as user_count,
    round(avg(Age), 1) as avg_age,
    round(avg(Number_of_Apps_Used), 1) as avg_apps_count,
    Location
from mobile_usage
group by user_category, Location
order by user_count desc;

# 2. Percentage of users by each category of use
select 
    user_category,
    user_count,
    round(user_count / (select count(*) from mobile_usage) *100, 2) as percentage
from (
    select 
        case 
            when Daily_Screen_Time_Hours >= 8 then 'heavy_user'
            when Daily_Screen_Time_Hours >= 4 then 'medium_user'
            when Daily_Screen_Time_Hours >= 1 then 'light_user'
            else 'minimal_user'
        end as user_category,
        count(*) as user_count
    from mobile_usage
    group by user_category
) segment_counts
order by user_count desc;


# 3. Diving Deeper
# Identifying the most used types of programs by “heavy users”
select 
    'social_media' as app_type,
    round(avg(Social_Media_Usage_Hours), 2) as avg_hours
from mobile_usage
where Daily_Screen_Time_Hours >= 8 # Heavy user indicator

union all

select 
    'productivity' as app_type,
    round(avg(Productivity_App_Usage_Hours), 2) as avg_hours
from mobile_usage
where Daily_Screen_Time_Hours >= 8

union all

select 
    'gaming' as app_type,
    round(avg(Gaming_App_Usage_Hours), 2) as avg_hours
from mobile_usage
where Daily_Screen_Time_Hours >= 8
order by avg_hours desc;

#-----------------------------------------------------------

# Further analysis can proceed in Tableau.

