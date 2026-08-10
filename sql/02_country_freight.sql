-- Query 2: Country-Level Spend & Freight Efficiency
-- Matches Excel Pivot Table 2
SELECT 
  Country,
  ROUND(SUM(CASE WHEN Line_Item_Value GLOB '[0-9]*' THEN CAST(Line_Item_Value AS REAL) ELSE 0 END), 2) AS total_line_item_value,
  ROUND(SUM(CASE WHEN Freight_Cost_USD GLOB '[0-9]*' THEN CAST(Freight_Cost_USD AS REAL) ELSE 0 END), 2) AS total_freight_cost,
  ROUND(
    SUM(CASE WHEN Freight_Cost_USD GLOB '[0-9]*' THEN CAST(Freight_Cost_USD AS REAL) ELSE 0 END) * 100.0 
    / SUM(CASE WHEN Line_Item_Value GLOB '[0-9]*' THEN CAST(Line_Item_Value AS REAL) ELSE 0 END), 
    2
  ) AS freight_pct_of_value
FROM Shipments
GROUP BY Country
HAVING SUM(CASE WHEN Line_Item_Value GLOB '[0-9]*' THEN CAST(Line_Item_Value AS REAL) ELSE 0 END) >= 500000
ORDER BY freight_pct_of_value DESC;
