-- Query 4: Delivery Delay by Shipment Mode
-- Matches Excel Pivot Table 4
WITH parsed AS (
  SELECT
    Shipment_Mode,
    (
      '20' || SUBSTR(Scheduled_Delivery_Date, -2) || '-' ||
      CASE SUBSTR(Scheduled_Delivery_Date, INSTR(Scheduled_Delivery_Date,'-')+1, 3)
        WHEN 'Jan' THEN '01' WHEN 'Feb' THEN '02' WHEN 'Mar' THEN '03'
        WHEN 'Apr' THEN '04' WHEN 'May' THEN '05' WHEN 'Jun' THEN '06'
        WHEN 'Jul' THEN '07' WHEN 'Aug' THEN '08' WHEN 'Sep' THEN '09'
        WHEN 'Oct' THEN '10' WHEN 'Nov' THEN '11' WHEN 'Dec' THEN '12'
      END || '-' ||
      PRINTF('%02d', CAST(SUBSTR(Scheduled_Delivery_Date, 1, INSTR(Scheduled_Delivery_Date,'-')-1) AS INTEGER))
    ) AS scheduled_iso,
    (
      '20' || SUBSTR(Delivered_to_Client_Date, -2) || '-' ||
      CASE SUBSTR(Delivered_to_Client_Date, INSTR(Delivered_to_Client_Date,'-')+1, 3)
        WHEN 'Jan' THEN '01' WHEN 'Feb' THEN '02' WHEN 'Mar' THEN '03'
        WHEN 'Apr' THEN '04' WHEN 'May' THEN '05' WHEN 'Jun' THEN '06'
        WHEN 'Jul' THEN '07' WHEN 'Aug' THEN '08' WHEN 'Sep' THEN '09'
        WHEN 'Oct' THEN '10' WHEN 'Nov' THEN '11' WHEN 'Dec' THEN '12'
      END || '-' ||
      PRINTF('%02d', CAST(SUBSTR(Delivered_to_Client_Date, 1, INSTR(Delivered_to_Client_Date,'-')-1) AS INTEGER))
    ) AS delivered_iso
  FROM Shipments
)
SELECT
  Shipment_Mode,
  COUNT(*) AS shipment_count,
  ROUND(AVG(julianday(delivered_iso) - julianday(scheduled_iso)), 2) AS avg_delay_days
FROM parsed
WHERE Shipment_Mode != 'N/A'
GROUP BY Shipment_Mode
ORDER BY avg_delay_days ASC;
