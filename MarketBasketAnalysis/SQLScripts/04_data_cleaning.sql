-- Script: 04_data_cleaning.sql
-- Purpose: Removing data to ensure accuracy in analysis.

-- Finds null values
select
count(case when "InvoiceNo" is null then 1 end) as missing_invoiceno_count,
count(case when "StockCode" is null then 1 end) as missing_stockcode_count,
count(case when "Description" is null then 1 end) as missing_description_count,
count(case when "Quantity"is null then 1 end) as missing_quantity_count,
count(case when "InvoiceDate" is null then 1 end) as missing_invoicedate_count,
count(case when "UnitPrice" is null then 1 end) as missing_unitprice_count,
count(case when "CustomerID" is null then 1 end) as missing_customerid_count,
count(case when "Country" is null then 1 end) as missing_country_count
from market_basket_data;

-- Imputes median value onto null unit price fields
update market_basket_data
set "UnitPrice" = (
-- subquery to calculate median value to update column
	select median_value from(
		select percentile_cont(0.5) within group (order by "UnitPrice") as median_value
		from market_basket_data
		where "UnitPrice" is not null)
	as subquery)
where "UnitPrice" is null;

-- Code to further explore Description column to determine strategies for missing data
SELECT COUNT(DISTINCT "Description") AS unique_description_count
FROM market_basket_data;

-- Determining frequency of top items
SELECT "Description", COUNT(*) AS frequency
FROM market_basket_data
GROUP BY "Description"
ORDER BY frequency DESC
LIMIT 600;

-- Examining null product values
SELECT *
FROM market_basket_data
WHERE "Description" IS NULL;

SELECT *
FROM market_basket_data
WHERE "Description" IS NULL
and "Quantity" < 1
order by "Quantity" desc;

SELECT *
FROM market_basket_data
WHERE "Description" IS NULL
and "Quantity" > 1
order by "Quantity" desc;

-- Finding special characters within product names
SELECT *
FROM market_basket_data
WHERE "Description" ~ '[^a-zA-Z0-9 ]';

-- Determining null values within the United Kingdom
SELECT "Country", COUNT(*) AS missing_description_count
FROM market_basket_data
WHERE "Description" IS NULL
GROUP BY "Country"
ORDER BY missing_description_count DESC;

--Determining counts of unique stockcodes and products
Select count(distinct "Description") as unique_desciption, count(distinct "StockCode") as unique_stockcode
from market_basket_data;

-- Finding data impurities within the description column
Select distinct "Description", "StockCode"
from market_basket_data;

-- Verifies and deletes rows with descriptions containing special keywords
SELECT "Description" FROM market_basket_data
WHERE "Description" LIKE '%?%'
   OR "Description" LIKE '%amazon%'
   OR "Description" LIKE '%check%'
   OR "Description" LIKE '%damaged%'
   OR "Description" LIKE '%dotcom%'
   OR "Description" LIKE '%ebay%'
   OR "Description" LIKE '%found%'
   OR "Description" LIKE '%incorrect%'
   OR "Description" LIKE '%lost%'
   OR "Description" LIKE '%mailout%'
   OR "Description" LIKE '%michel oops%'
   OR "Description" LIKE '%manual%'
   OR "Description" LIKE '%missing%'
   OR "Description" LIKE '%mixed up%'
   OR "Description" LIKE '%return%'
   OR "Description" LIKE '%throw away%'
   OR "Description" LIKE '%sample%'
   OR "Description" LIKE '%sale error%'
   OR "Description" LIKE '%smashed%'
   OR "Description" LIKE '%sold%'
   OR "Description" LIKE '%test%'
   OR "Description" LIKE '%destroyed%'
   OR "Description" LIKE '%wet%'
   OR "Description" LIKE '%adjustment%';

DELETE FROM market_basket_data
WHERE "Description" LIKE '%?%'
   OR "Description" LIKE '%amazon%'
   OR "Description" LIKE '%check%'
   OR "Description" LIKE '%damaged%'
   OR "Description" LIKE '%dotcom%'
   OR "Description" LIKE '%ebay%'
   OR "Description" LIKE '%found%'
   OR "Description" LIKE '%incorrect%'
   OR "Description" LIKE '%lost%'
   OR "Description" LIKE '%mailout%'
   OR "Description" LIKE '%michel oops%'
   OR "Description" LIKE '%manual%'
   OR "Description" LIKE '%missing%'
   OR "Description" LIKE '%mixed up%'
   OR "Description" LIKE '%return%'
   OR "Description" LIKE '%throw away%'
   OR "Description" LIKE '%sample%'
   OR "Description" LIKE '%sale error%'
   OR "Description" LIKE '%smashed%'
   OR "Description" LIKE '%sold%'
   OR "Description" LIKE '%test%'
   OR "Description" LIKE '%destroyed%'
   OR "Description" LIKE '%wet%'
   OR "Description" LIKE '%adjustment%';
   
-- Second Round of data removal
SELECT "Description" FROM market_basket_data
WHERE "Description" LIKE '%wrongly%'
   OR "Description" LIKE '%marked%'
   OR "Description" LIKE '%allocate%'
   OR "Description" LIKE '%adjust%'
   OR "Description" LIKE '%bad%'
   OR "Description" LIKE '%adjustment%'
   OR "Description" LIKE '%amazon%'
   OR "Description" LIKE '%bank%'
   OR "Description" LIKE '%barcode%'
   OR "Description" LIKE '%broken%'
   OR "Description" LIKE '%check%'
   OR "Description" LIKE '%counted%'
   OR "Description" LIKE '%cracked%'
   OR "Description" LIKE '%crushed%'
   OR "Description" LIKE '%dagamed%'
   OR "Description" LIKE '%damages%'
   OR "Description" LIKE '%not%'
   OR "Description" LIKE '%dotcom%'
   OR "Description" LIKE '%fba%'
   OR "Description" LIKE '%faulty%'
   OR "Description" LIKE '%found%'
   OR "Description" LIKE '%had%'
   OR "Description" LIKE '%incorrect%'
   OR "Description" LIKE '%manual%'
   OR "Description" LIKE '%missing%'
   OR "Description" LIKE '%mouldy%';
   
DELETE FROM market_basket_data
WHERE "Description" LIKE '%wrongly%'
   OR "Description" LIKE '%marked%'
   OR "Description" LIKE '%allocate%'
   OR "Description" LIKE '%adjust%'
   OR "Description" LIKE '%bad%'
   OR "Description" LIKE '%adjustment%'
   OR "Description" LIKE '%amazon%'
   OR "Description" LIKE '%bank%'
   OR "Description" LIKE '%barcode%'
   OR "Description" LIKE '%broken%'
   OR "Description" LIKE '%check%'
   OR "Description" LIKE '%counted%'
   OR "Description" LIKE '%cracked%'
   OR "Description" LIKE '%crushed%'
   OR "Description" LIKE '%dagamed%'
   OR "Description" LIKE '%damages%'
   OR "Description" LIKE '%not%'
   OR "Description" LIKE '%dotcom%'
   OR "Description" LIKE '%fba%'
   OR "Description" LIKE '%faulty%'
   OR "Description" LIKE '%found%'
   OR "Description" LIKE '%had%'
   OR "Description" LIKE '%incorrect%'
   OR "Description" LIKE '%manual%'
   OR "Description" LIKE '%missing%'
   OR "Description" LIKE '%mouldy%'
   OR "Description" LIKE '%20713%'
   OR "Description" LIKE '%Adjustment%'
   OR "Description" LIKE '%alan hodge cant mamage this section%'
   OR "Description" LIKE '%Amazon%'
   OR "Description" LIKE '%AMAZON%'
   OR "Description" LIKE '%Amazon Adjustment%'
   OR "Description" LIKE '%AMAZON FEE%'
   OR "Description" LIKE '%Bank Charges%'
   OR "Description" LIKE '%Breakages%'
   OR "Description" LIKE '%came coded as 20713%'
   OR "Description" LIKE '%CHECK%'
   OR "Description" LIKE '%CRUK Commission%' 
   OR "Description" LIKE '%Crushed%'
   OR "Description" LIKE '%Dagamed%'
   OR "Description" LIKE '%Damaged%'
   OR "Description" LIKE '%DAMAGED%'
   OR "Description" LIKE '%Damages%'
   OR "Description" LIKE '%Discount%'
   OR "Description" LIKE '%Display%'
   OR "Description" LIKE '%Dotcom%'
   OR "Description" LIKE '%DOTCOM POSTAGE%'
   OR "Description" LIKE '%Dotcom sales%'
   OR "Description" LIKE '%Dotcom set%'
   OR "Description" LIKE '%Dotcomgiftshop%'
   OR "Description" LIKE '%FBA%'
   OR "Description" LIKE '%Found%'
   OR "Description" LIKE '%FOUND%'
   OR "Description" LIKE '%Given away%'
   OR "Description" LIKE '%High Resolution Image%'
   OR "Description" LIKE '%Incorrect stock entry.%'
   OR "Description" LIKE '%John Lewis%'
   OR "Description" LIKE '%label mix up%'
   OR "Description" LIKE '%Lighthouse Trading zero invc incorr%'
   OR "Description" LIKE '%Manual%'
   OR "Description" LIKE '%Marked as 23343%'
   OR "Description" LIKE '%MIA%'
   OR "Description" LIKE '%Missing%'
   OR "Description" LIKE '%mix up with c%'
   OR "Description" LIKE '%for online retail orders%'
   OR "Description" LIKE '%on cargo order%'
   OR "Description" LIKE '%printing smudges/thrown away%'
   OR "Description" LIKE '%rusty thrown away%'
   OR "Description" LIKE '%Sale error%'
   OR "Description" LIKE '%SALLE DE BAIN HOOK%'
   OR "Description" LIKE '%SAMPLES%'
   OR "Description" LIKE '%Show Samples%'
   OR "Description" LIKE '%showroom%'
   OR "Description" LIKE '%thrown away%'
   OR "Description" LIKE '%thrown%'
   OR "Description" LIKE '%website fixed%'
   OR "Description" LIKE '%Wet pallet-thrown away%'
   OR "Description" LIKE '%WET/MOULDY%'
   OR "Description" LIKE '%wrong code%';
   
-- Detect duplicate stock codes
Select count("StockCode") as stock_counts,"StockCode"
from market_basket_data
group by "StockCode"
having count(*) > 1
order by stock_counts desc;

-- Exploring Stock Code
select *
from market_basket_data
where "StockCode" = '85123A';

select distinct "Description"
from market_basket_data
where "StockCode" = '85123A';

Select count("StockCode") as stock_counts,"StockCode", "Description"
from market_basket_data
group by "StockCode", "Description"
order by stock_counts desc;

--Looking into data anomalies
SELECT DISTINCT "StockCode"
FROM market_basket_data
WHERE "StockCode" NOT LIKE '%[0-9]%';

--Imputing null values
UPDATE market_basket_data
SET "Description" = 'UNKNOWN'
WHERE "Description" IS NULL;

--Validating data imputation
select * from
market_basket_data
where "Description" is null;