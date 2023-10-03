
## Archived Business Data Report - Market Basket Analysis
*Author: Naomi Barnes*

### Introduction
This archived report outlines the process and challenges encountered during a market basket analysis, aiming to uncover associations between items purchased by customers. It serves as a reflection on the analysis, detailing what went wrong, the lessons learned, and insights gained during the process.

### Step 1: Research Question and Problem Statement

**Problem Statement:**
- Initially, the problem statement aimed to identify item bundles for offering discounts during holidays.

**Research Question:**
- The original research question was vague: "Which items are purchased together?"

**Revised Research Question:**
- After some tailoring, the new research question became: "What are the top 5 co-purchased items with a holiday theme during the months of November and December?"

**Lesson Learned:**
- The initial research question lacked specificity, making it challenging to derive meaningful insights. The revised question focused on effective research with a direct business use case.

### Step 2: Data Collection and Processing

**Data Requirements:**
- The dataset consisted of tabular sales and transaction data from a raw Excel spreadsheet.

**Challenges Encountered:**
- Data quality and format issues were addressed during pre-processing, including encoding problems.
- Rows with irrelevant descriptions, negative quantities, and customer IDs of 0 were removed.
- Null values in the "Description" column were imputed with "Unknown."
- A timeframe filter was applied to focus on November and December sales.

**Lesson Learned:**
- Data quality and relevance are crucial. Careful pre-processing is essential to ensure the dataset aligns with the research scope.

### Step 3: Data Analysis

**Analysis Process:**
- Summary statistics were generated inside of Excel and examined

![image](https://github.com/nbarnes2021/DataInsightsPortfolio/blob/main/Market%20Basket%20Analysis%20%5BArchived%5D/Data/Summary%20Statistics/Holiday%20Items%20Sold%20by%20Month.png)

![image](https://github.com/nbarnes2021/DataInsightsPortfolio/blob/main/Market%20Basket%20Analysis%20%5BArchived%5D/Data/Summary%20Statistics/Holiday%20Sales%20by%20Month.png)


![image](https://github.com/nbarnes2021/DataInsightsPortfolio/blob/main/Market%20Basket%20Analysis%20%5BArchived%5D/Data/Summary%20Statistics/Holiday%20Transactions%20by%20Month.png)

![image](https://github.com/nbarnes2021/DataInsightsPortfolio/blob/main/Market%20Basket%20Analysis%20%5BArchived%5D/Data/Summary%20Statistics/Summary%20Statistics%20Table.png)


**Challenges Encountered:**
- The apriori algorithm failed to find meaningful associations in the limited dataset.

**Lesson Learned:**
- Inadequate data or research scope may lead to difficulties in deriving meaningful results.

### Step 4: Communication of Results

**Expected Results:**
- The analysis was designed around finding hidden product associations to recommend to customers at checkout over the holiday season to increase sales

**Actual Results:**
- The analysis showed that the majority of items were not purchased frequently enough over the holiday season for the apriori algorithm to produce any rules.

**Lesson Learned:**
- It's important to acknowledge when an analysis doesn't yield the expected results, providing an opportunity for future improvements. In the future another algorithm could be utilized for a different output, or the business could retry the analysis after more transaction data has been gathered. 

### Report Summary
- This archived report reflects on the challenges encountered during a market basket analysis, primarily due to data limitations and an initially vague research question.
- Lessons learned include the importance of precise problem statements, data quality, and acknowledging when an analysis does not produce meaningful results.
- The report remains a record of the journey, providing insights for future analyses.

