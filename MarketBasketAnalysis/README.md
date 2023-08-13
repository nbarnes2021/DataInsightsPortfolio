# Business Data Report - Market Basket Analysis
*Author: Naomi Barnes*

## Introduction
This report outlines the process for conducting a market basket analysis, aiming to uncover associations between items purchased by customers. The analysis provides insights to guide business decisions, such as product placement and marketing strategies.

## Step 1: Research Question and Problem Statement
**Research Question/Problem Statement:**
- [Research question or problem statement #1]
- [Research question or problem statement #2]

**Notes:**
- [Additional thoughts around the research question]
- [Hypothesis, potential issues, challenges, limitations, etc.]

## Step 2: Data Collection and Measurement Strategy
**Data Requirements:**
- Type of data required: Tabular sales and transaction data
- Data sources: Raw Excel spreadsheet
- Data structure: Tabular format with columns (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)

- Data issues: Original data may include non-UTF-8 characters

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
