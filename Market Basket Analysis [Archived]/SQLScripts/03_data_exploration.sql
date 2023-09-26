-- Script: 03_data_exploration.sql
-- Purpose: Further explore data to refine research question.

-- Display count of unique store items
Select count(distinct "Description") as Unique_Count
from market_basket_data;

-- Displays list of store items
Select distinct "Description" as Unique_Values
from market_basket_data;

-- Display count of unique countries
Select count(distinct "Country") as  Unique_Countries
from market_basket_data;

-- Displays list of various countries
Select distinct "Country" as Unique_Countries
from market_basket_data;

-- Shows products sold in the UK based on sales numbers
Select "Description" as Unique_UK_Products,
count("Description") as total_count
from market_basket_data
where "Country" = 'United Kingdom'
group by "Description"
order by total_count desc;

-- Displays schema information about the table
select column_name, data_type
from information_schema.columns
where table_name = 'market_basket_data';

-- Shows data issue with CustomerID column
select distinct "CustomerID"
from market_basket_data
order by "CustomerID" desc;

-- Summary Statistics for Quantity column
select count(*) as total_rows,
count("Quantity") as count_Quantity,
avg("Quantity") as avg_Quantity,
min("Quantity") as min_Quantity,
max("Quantity") as max_Quantity
from market_basket_data;

-- Summary Statistics for UnitPrice column
select count(*) as total_rows,
count("UnitPrice") as count_UnitPrice,
avg("UnitPrice") as avg_UnitPrice,
min("UnitPrice") as min_UnitPrice,
max("UnitPrice") as max_UnitPrice
from market_basket_data;

