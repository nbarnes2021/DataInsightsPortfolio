-- Script: 01_initial_data_exploration.sql
-- Purpose: Perform initial data exploration and validation queries.

-- Count total rows in the table
SELECT COUNT(*) FROM market_basket_data;

-- Display sample records
SELECT * FROM market_basket_data LIMIT 10;