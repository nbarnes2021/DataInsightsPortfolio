# Business Data Report - Market Basket Analysis
*Author: Naomi Barnes*

## Introduction
This report outlines the process for conducting a market basket analysis, aiming to uncover associations between items purchased by customers. The analysis provides insights to guide business decisions, such as product placement and marketing strategies.

## Step 1: Research Question and Problem Statement
**Research Question/Problem Statement:**
- What are the most commonly co-purchased items in the dataset, and how do these co-purchasing patterns vary between top-selling countries?
  
**Notes:**
- This analysis aims to explore patterns of co-purchase behavior in the dataset to understand customer preferences and potential cross-selling opportunities.
- We hypothesize that certain items, such as tea sets and jam in the United Kingdom, may be frequently co-purchased due to cultural factors.
- The scope of the analysis will be focused on the top-performing countries by sales volume.

## Step 2: Data Collection and Measurement Strategy
**Data Requirements:**
- Type of data required: Tabular sales and transaction data
- Data sources: Raw Excel spreadsheet
- Data structure: Tabular format with columns (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)

**Data Issues:**
- Original data may include non-UTF-8 characters
- CustomerID field contains values in a non-standard text format (e.g., "99.96," "988," "987.14") but is not extensively modified for the current scope of the research.

**Collection/Measurement:**
- Measurement procedures: Converted raw Excel data to UTF-8 encoded CSV for compatibility
- Validity and reliability: Ensured data integrity by maintaining original structure and addressing encoding issues

**Data Cleaning:**
- Pre-processing steps: Converted Excel to UTF-8 CSV using PowerShell script
- Data cleaning process: Addressed potential encoding issues during conversion
- Missing data: [Missing data handling]
- Data removal: [Data removal explanation]

**Conversion of Raw Excel to UTF-8 CSV:**

1. Created a PowerShell script to convert the original Excel spreadsheet to UTF-8 encoded CSV.

**Importing UTF-8 CSV into PostgreSQL:**

1. Used the PostgreSQL terminal to import the UTF-8 CSV data into the 'market_basket_data' table.

## Step 3: Visualize and Summarize Data
**Data Overview:**

****Summary Statistics (Uncleaned Data):****
  - Total Rows: 541,909
  - Count of Quantity Column: 541,909
  - Average Quantity: 9.55
  - Minimum Quantity: -80,995 (Note: This value is incorrect and likely due to data anomalies.)
  - Maximum Quantity: 80,995

  - Count of UnitPrice Column: 406,829 (Note: Indicates missing values)
  - Average Unit Price: 15,287.69
  - Minimum Unit Price: 1,234.00
  - Maximum Unit Price: 18,287.00

**Notes:**

- The summary statistics above are based on the raw, uncleaned data which includes null and missing values.
- The minimum quantity value appears to be incorrect, indicating potential data anomalies that require investigation.
- The total unit price value is less than than the total rows, missing or null values.
- The total unit price entries are less than the total number of rows, indicating missing or null values in the "UnitPrice" column.


**Handling Missing Data:**

- After exploring the data in the "Description" column, it was observed that certain rows contained descriptions like "?", "amazon", "check", "damaged," etc., which were deemed irrelevant to the analysis. These rows were removed.
- Rows with negative quantities and customerIDs of 0 were also removed from the dataset, as they did not align with the scope of the research, which focuses on co-purchase patterns and does not include post-purchase events like returns or exchanges.

- Summary statistics: [Summary statistics]
- Visualizations: [Visualizations]

**Interpretation:**
- Interpret visuals: [Interpretation of visuals]
- Trends and patterns: [Trends and patterns]

## Step 4: Model Development and Interpretation
**Model Building:**
- Model iterations: [Model iterations]
- Complex models: [Complex models exploration]

## Step 5: Model Evaluation
**Final Model Evaluation:**
- Model errors: [Model errors assessment]
- Model accuracy: [Model accuracy evaluation]
- Residuals and assumptions: [Residuals and assumptions]

## Step 6: Communication of Results
**Results Communication:**
- Visualization and language: [Visualization and language approach]
- Answering the research question: [Research question conclusion]
- Limitations: [Analysis limitations]

**Future Analysis and Conclusion:**
- Suggestions for future analysis: [Future analysis recommendations]
- Contextual answers: [Other data sets or considerations]
