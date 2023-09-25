# R Scripts for Market Basket Analysis

## Description

This repository contains R scripts used for Market Basket Analysis on retail transaction data. The analysis aims to uncover associations between products purchased by customers, providing valuable insights for business decisions.

## Purpose

The purpose of this project is to perform Market Basket Analysis to:

- Identify patterns and associations in customer purchasing behavior.
- Improve marketing strategies, product recommendations, and inventory management.
- Enhance the overall customer experience.

## Data

The data used for this analysis is stored in CSV format and contains transaction records with columns such as InvoiceNo, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, and Country.

## Scripts

### Script 1: Original Research Question

**Script Name:** `01_initial_analysis.R`

**Description:** This script performs an initial analysis on the dataset based on the original research question. It includes data import, preprocessing, and exploratory data analysis. The script generates item frequency plots and association rules with specific support and confidence thresholds.

**Usage:**

1. Ensure you have R installed on your machine.
2. Download the script (`01_initial_analysis.R`).
3. Install the required R packages (arules, arulesViz, datasets, readr) using the provided commands.
4. Run the script to conduct the initial analysis.

### Script 2: Modified Research Question

**Script Name:** `02_market_basket_analysis.R`

**Description:** This script addresses the modified research question by performing Market Basket Analysis using the Apriori algorithm from the arules package. It focuses on transaction data preprocessing, generating association rules with different support and confidence parameters, and visualizing the results.

**Usage:**

1. Ensure you have R installed on your machine.
2. Download the script (`02_market_basket_analysis.R`).
3. Install the required R packages (arules, arulesViz, datasets, readr, tidyverse) using the provided commands.
4. Run the script to perform Market Basket Analysis for the modified research question.


## Acknowledgments

- The analysis in these scripts is based on the [arules package](https://cran.r-project.org/web/packages/arules/index.html).
- The dataset used in this project is sourced from Online Retail. (2015). UCI Machine Learning Repository. https://doi.org/10.24432/C5BW33
