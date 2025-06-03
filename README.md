# Mobile-Device-User-Behavior-Analysis
Hello! This is my short project analyzing mobile user behavior using MySQL. The project aims to demonstrate my SQL skills and my understanding of the data analysis process.

## Project Overview

This project analyzes smartphone usage patterns to uncover behavioral insights that can drive product and marketing decisions. Using SQL queries, I segment users based on their app usage behavior and identify key patterns across different demographics.

## Objectives

- **User Segmentation:** Classify users based on usage intensity and behavior patterns
- **Behavioral Analysis:** Understand how different demographics use various app categories
- **Actionable Insights:** Provide data-driven recommendations for product and marketing teams

## Technical Stack

- **Database:** MySQL
- **Analysis:** SQL queries for data exploration and insight generation
- **Tools:** Dbeaver for query development and testing

## Dataset

**Source:** [Smartphone Usage and Behavioral Dataset](https://www.kaggle.com/datasets/bhadramohit/smartphone-usage-and-behavioral-dataset)

**Structure:**
- `user_id` - Unique user identifier
- `age` - User age
- `gender` - User gender
- `total_app_usage_hours` - Total daily app usage
- `daily_screen_time_hours` - Daily screen time
- `number_of_apps_used` - Number of different apps used
- `social_media_usage_hours` - Time spent on social media apps
- `productivity_app_usage_hours` - Time spent on productivity apps
- `gaming_app_usage_hours` - Time spent on gaming apps
- `location` - User location

## Key Analyses

### 1. Overall Usage Statistics
- **Key average usage indicators:** Average indicatoors for each data field
- **Category Usage Share:** Percentage of time spent using different categories of applications to the total time

### 2. Demographic Behavioral Patterns
- **Geographic Insights:** Location-based usage variations
- **Age Group Analysis:** Usage patterns across different age groups
- **Gender Differences:** How male and female users differ in app preferences
  
### 3. User Segmentation by Usage Intensity
**User Segmentation:** Grouping users by daily screen time into different segments: "Heavy user", "Medum user" "Light user" and "Minor user"
**Uer Segment Percentage:** Evaluating the proportion of users within each segment.
**Preferences Identification:** Identifying the most used types of programs by each user segment

## Key Insigts

### User Distribution
- **Heavy Users (8+ hours):** 48.8% - Higest engagement: The most valueable segment
- **Medium Users (4-8 hours):** 29.5% - Balanced usage: Stable segment
- **Light Users (1-4 hours):** 21.7% - The Lowest usage: Growth potential
- **Additional Insights:** Each segment shows an even disrtibution across all app categories 

### Demographic Insights
- **18-25 age group:** Highest social media usage (avg 2.6 hours/day)
- **36-45 age group:** Highest productivity app usage (avg 2.7 hours/day)
- **55+ age group:** Highest gaming app usage (avg 2.7 hours/day)


## Impact & Value
This analysis can be vlueable for different functional areas:
- **Product Development:** Feature prioritization based on user segments
- **Marketing Strategy:** Targeted campaigns with higher conversion rates
- **User Experience:** Data-driven UX improvements for different user types
