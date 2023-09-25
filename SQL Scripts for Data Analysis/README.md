### SQL Scripts for Data Analysis

This folder contains a collection of SQL scripts used in the data preparation phase of the Market Basket Analysis project. These scripts are part of a larger project aimed at uncovering associations between items purchased by customers. The data preparation phase is crucial for ensuring data accuracy and suitability for analysis.

#### Purpose

The purpose of these SQL scripts is to perform various data preparation and cleaning tasks to get the dataset ready for deeper analysis. Each script serves a specific function, and they are organized in the order in which they were executed.


#### Data

Online Retail. (2015). UCI Machine Learning Repository. https://doi.org/10.24432/C5BW33.

The dataset used in these scripts is from an online retail source and uploaded to a Postgres database.


#### Scripts

- **01_initial_data_exploration.sql**: performs initial data exploration and provides basic information about the dataset.

- **02_data_validation.sql**: Counts missing values for each column in the dataset to assess data completeness and quality.

- **03_data_exploration.sql**:  explores data to refine the research question and gather insights.

- **04_data_cleaning.sql**:  removes data inconsistencies, handles null values, and ensures data accuracy.

- **05_data_exportation.sql**: exports cleaned data to a CSV file for further analysis.

- **06_data_filtering.sql**: Trims dataset  to fit the scope of analysis, including filtering transactions within specific date ranges.
