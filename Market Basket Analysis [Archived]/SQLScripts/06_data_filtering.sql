-- Script: 06_data_filtering.sql
-- Purpose: Trimming data to fit scope of analysis

--Checks the current datestyle of the database
SELECT current_setting('datestyle') AS datestyle_setting
FROM market_basket_data
LIMIT 10;

--Pulls the first and last transaction
(SELECT * FROM 
market_basket_data
ORDER BY "InvoiceDate"
LIMIT 1)
UNION
(SELECT *FROM 
market_basket_data
ORDER BY "InvoiceDate" DESC
LIMIT 1);

--Reformats first and last transaction date into mm-dd-yyyy datestyle
SELECT
  TO_CHAR(MIN("InvoiceDate"), 'MM/DD/YYYY') AS start_date,
  TO_CHAR(MAX("InvoiceDate"), 'MM/DD/YYYY') AS end_date
FROM market_basket_data;


-- dataset is in yyyy-mm-dd format

-- Selects transactions between november and december
select * 
from market_basket_data
where ("InvoiceDate" >= '2010-11-01 00:00:00' 
and "InvoiceDate" <= '2010-12-31 23:59:59')
or ("InvoiceDate" >= '2011-11-01 00:00:00' 
and "InvoiceDate" <= '2011-12-31 23:59:59');

-- Exports back into csv via windows terminal
\copy
(SELECT * 
 FROM market_basket_data 
 WHERE (
	 "InvoiceDate" >= '2010-11-01 00:00:00' 
	 AND "InvoiceDate" <= '2010-12-31 23:59:59'
 ) OR (
	 "InvoiceDate" >= '2011-11-01 00:00:00' 
	 AND "InvoiceDate" <= '2011-12-31 23:59:59'
 )) TO 
 'C:\Users\14043\Documents\DataAnalysisProjects\DataInsightsPortfolio\MarketBasketAnalysis\Data\OnlineRetailFiltered.csv' 
 WITH CSV HEADER;

