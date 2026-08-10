-- Query 3: Vendor Pricing within ARV Product Group
-- Matches Excel Pivot Table 3
SELECT 
  Vendor,
  COUNT(*) AS order_count,
  ROUND(
    AVG(CASE WHEN Unit_Price GLOB '[0-9]*' THEN CAST(Unit_Price AS REAL) END), 
    2
  ) AS avg_unit_price
FROM Shipments
WHERE Product_Group = 'ARV'
GROUP BY Vendor
HAVING COUNT(*) >= 20
ORDER BY avg_unit_price ASC;
