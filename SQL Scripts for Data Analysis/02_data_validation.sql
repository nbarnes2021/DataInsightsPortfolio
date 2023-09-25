-- Script: 02_data_validation.sql
-- Purpose: Count missing values for each column in market_basket_data table.

-- Check for NULL values
SELECT
  COUNT(CASE WHEN "InvoiceNo" IS NULL THEN 1 END) AS missing_invoiceno_count,
  COUNT(CASE WHEN "StockCode" IS NULL THEN 1 END) AS missing_stockcode_count,
  COUNT(CASE WHEN "Description" IS NULL THEN 1 END) AS missing_description_count,
  COUNT(CASE WHEN "Quantity" IS NULL THEN 1 END) AS missing_quantity_count,
  COUNT(CASE WHEN "InvoiceDate" IS NULL THEN 1 END) AS missing_invoicedate_count,
  COUNT(CASE WHEN "UnitPrice" IS NULL THEN 1 END) AS missing_unitprice_count,
  COUNT(CASE WHEN "CustomerID" IS NULL THEN 1 END) AS missing_customerid_count,
  COUNT(CASE WHEN "Country" IS NULL THEN 1 END) AS missing_country_count
FROM market_basket_data;