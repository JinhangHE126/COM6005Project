# Past Air Quality Health Index Record (English Version) Data Transmission Specification

[🌏 中文版本 (Chinese Version)](./README_CN.md)

[Dataset Address](https://data.gov.hk/en-data/dataset/hk-epd-airteam-past-record-of-air-quality-health-index-en/resource/223fd8bd-ab7a-42ca-ab61-554cb903e15d)

### [Field Descriptions]

| Attribute       | Description                                                                   | Remarks            |
| --------------- | ----------------------------------------------------------------------------- | ------------------ |
| Date            | The publication date of the Air Quality Health Index                          | Format: 16/10/2018 |
| Hour            | Hour within the day specified by Date; contains the maximum AQHI for that day | Format: 1          |
| Central/Western | Air Quality Health Index at the Central & Western monitoring station          |                    |
| Eastern         | Air Quality Health Index at the Eastern monitoring station                    |                    |
| Kwun Tong       | Air Quality Health Index at the Kwun Tong monitoring station                  |                    |
| Sham Shui Po    | Air Quality Health Index at the Sham Shui Po monitoring station               |                    |
| Kwai Chung      | Air Quality Health Index at the Kwai Chung monitoring station                 |                    |
| Tsuen Wan       | Air Quality Health Index at the Tsuen Wan monitoring station                  |                    |
| Tseung Kwan O   | Air Quality Health Index at the Tseung Kwan O monitoring station              |                    |
| Yuen Long       | Air Quality Health Index at the Yuen Long monitoring station                  |                    |
| Tuen Mun        | Air Quality Health Index at the Tuen Mun monitoring station                   |                    |
| Tung Chung      | Air Quality Health Index at the Tung Chung monitoring station                 |                    |
| Tai Po          | Air Quality Health Index at the Tai Po monitoring station                     |                    |
| Sha Tin         | Air Quality Health Index at the Sha Tin monitoring station                    |                    |
| Tap Mun         | Air Quality Health Index at the Tap Mun monitoring station                    |                    |
| Causeway Bay    | Air Quality Health Index at the Causeway Bay monitoring station               |                    |
| Central         | Air Quality Health Index at the Central monitoring station                    |                    |
| Mong Kok        | Air Quality Health Index at the Mong Kok monitoring station                   |                    |

## EDA Exploratory Data Analysis

**Overall Approach**

1. Data Quality Assessment: Check for missing values, duplicate values, and outliers.
2. Univariate Analysis: Deep dive into understanding each variable.
3. Multivariate Analysis & Spatiotemporal Analysis: Explore relationships between attributes, and patterns in time and space.

### 1. Data Quality Assessment

- Analysis Content:
  - Missing Value Analysis
  - Outlier Detection (Primarily for AQHI values)
  - Date & Time Format Analysis

### 2. Univariate Analysis

**Understand the distribution and statistical characteristics of each variable individually.**

Attribute: `Date`: Year, Month, Day
Attribute: `Hour`: Specific hour of the day

- Hour Range: 01-24
- Daily Max: The maximum AQHI value for a specific hour within a day.

Attribute: `AQHI`: AQHI values from various monitoring stations (Central/Western, Eastern, Kwun Tong, Sham Shui Po, Kwai Chung, Tsuen Wan, Tseung Kwan O, Yuen Long, Tuen Mun, Tung Chung, Tai Po, Sha Tin, Tap Mun, Causeway Bay, Central, Mong Kok)

**Core of the Analysis**

Analysis Content:

- Central Tendency & Dispersion: Calculate descriptive statistics for each station: mean, median, mode, standard deviation, variance, range, etc.
- Distribution Shape: Identify the distribution characteristics of AQHI for each station.
  - How to Analyze: Use histograms and density plots to visualize the AQHI distribution for each station, identifying skewness and kurtosis.
  - Box Plots: Identify outliers and the interquartile range (IQR) for each station's AQHI.

### 3. Multivariate Analysis & Spatiotemporal Analysis

**Explore relationships between attributes, and patterns in time and space.**

Time Series Analysis:

- Analysis Content:
  - Long-term Trends: Aggregate data by `Date` (e.g., calculate daily average AQHI), plot time series charts. Observe overall air quality trends and potential seasonal patterns.

Spatial Analysis (Relationships between monitoring stations):

- Analysis Content:
  - Correlation Analysis: Calculate a correlation coefficient matrix between AQHI values from different monitoring stations. Identify the strength of relationships between stations and visualize using a heatmap. «Heatmap: Use a heatmap to visualize correlations between AQHI values from different monitoring stations.»
    - Purpose: Identify which areas have highly consistent air quality patterns (high correlation) and which areas are relatively independent. For example: Geographically close stations likely have high correlation.
  - "Worst" Area Ranking:
    - Calculate the average AQHI for each monitoring station and rank them to identify areas with the poorest air quality.
    - Visualization: Use bar charts to display the average AQHI ranking for each station.

## Feature Engineering + Impact Analysis

### 1. EDA Report Recap

1. Data Quality Assessment
   1. Very few missing values (113 total, 0.17% of total data). Tap Mun station has relatively more missing values (5.6% of its data).
   2. No outliers found outside the theoretical range (1-10).
   3. Using the IQR method, 1401 outliers were detected, accounting for 2.1% of the total data.
2. Univariate Analysis
   1. The mean AQHI for each station is roughly between 3-4. The median (~4) is slightly higher than the mean, indicating a slight left skew in the distribution.
   2. Mean AQHI across stations ranges from 3.447 (Tsuen Wan) to 4.126 (Kwai Chung).
3. Multivariate Analysis & Spatiotemporal Analysis
   1. High correlation between stations (average 0.914), especially those geographically close, with the highest correlations around 0.98.
   2. The lowest correlation is observed with Tap Mun.
   3. Cluster analysis grouped stations, indicating that geographical location influences air quality.
   4. Temporal analysis shows AQHI fluctuates throughout the day, peaking around 17:00 and reaching a trough around 08:00. Weekend AQHI is lower than on weekdays.

### 2. Feature Engineering

1. Handle Missing Values
   - Very few missing values; can use interpolation for imputation.
2. Temporal Feature Engineering
   - Extract the following features from the DateTime:
     - Hour of the day
     - Time of day (Morning, Afternoon, Evening, Night)
     - Is Weekend? «Weekends have lower AQHI»
     - Month «Seasonal effects»
     - Day of the week (Monday to Sunday)
3. Spatial Feature Engineering
   - Due to high station correlation, consider using Principal Component Analysis (PCA) or cluster analysis to combine multiple station AQHI values into composite indicators, reducing dimensionality and redundant information.
   - Based on cluster analysis results, group stations and calculate the average AQHI for each cluster as a new feature.
4. (Additional feature engineering ideas can be added here if needed)

### 3. Impact Analysis

1. Feature Importance Analysis:
   - After training a model, use feature importance scores (e.g., from tree-based models) to evaluate the contribution of new features to model performance.
2. Temporal Feature Impact:
   - Analyze the impact of temporal features like hour, weekend, etc., on predictions, verifying if they align with patterns found in EDA (e.g., peak at 17:00, lower values on weekends).
3. Spatial Feature Impact:
   - Examine the importance of different station features and the contribution of regional features (PCA or cluster results) to the model.
