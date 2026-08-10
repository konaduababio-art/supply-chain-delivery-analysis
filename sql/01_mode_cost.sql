-- Query 1: Delivery Performance by Shipment Mode
-- Matches Excel Pivot Table 1
SELECT 
  Shipment_Mode,
  COUNT(*) AS total_shipments,
  SUM(CASE WHEN Freight_Cost_USD GLOB '[0-9]*' THEN 1 ELSE 0 END) AS valid_freight_count,
  ROUND(
    AVG(CASE WHEN Freight_Cost_USD GLOB '[0-9]*' THEN CAST(Freight_Cost_USD AS REAL) END), 
    2
  ) AS avg_freight_cost
FROM Shipments
WHERE Shipment_Mode != 'N/A'
GROUP BY Shipment_Mode
ORDER BY avg_freight_cost DESC;
