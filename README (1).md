# Supply Chain Delivery & Cost Analysis

## Project Overview

This project analyzes 10,324 real shipment records from a humanitarian health supply chain program (SCMS/PEPFAR) to uncover where the network loses time and money — and where it's actually performing well. The analysis moves from raw data cleaning in Excel through pivot table analysis to an interactive Tableau dashboard, covering shipment cost, delivery reliability, country-level efficiency, and vendor pricing.

## Business Objective

Organizations moving goods across global, often difficult-to-reach destinations need to balance two competing priorities: **cost** and **reliability**. This project set out to answer:

- Are we paying a premium for faster shipping, and is that premium actually justified by better delivery performance?
- Which countries and vendors represent hidden cost or reliability risk?
- Where should a supply chain team focus first if they wanted to cut costs or fix delays?

## Dashboard Components

The interactive Tableau dashboard includes four visuals, each chosen deliberately for what it needed to show:

1. **Freight Cost by Shipment Mode** (bar chart) — average cost per shipment across Air, Air Charter, Ocean, and Truck
2. **Delivery Delay by Shipment Mode** (diverging bar chart) — average days early/late per mode, colored red (late) / green (early), with a reference line at zero ("On Time")
3. **Delivery Delay by Country** (map) — every country sized by shipment volume and colored by average delay, making outlier destinations visible at a glance
4. **Vendor Price Distribution — ARV Product Group** (box plot) — full price spread per vendor (median, quartiles, outliers), not just the average

## Key Insights

**1. Air and Air Charter dominate shipping volume and cost.**
Together they account for ~65% of all shipments and are also the most expensive modes ($10,459 and $21,052 average freight cost respectively, vs. $10,176 for Truck and $12,733 for Ocean).

**2. Certain countries pay disproportionately high freight relative to order value.**
Cameroon (12.25%), Congo DRC (12.11%), South Sudan (11.71%), Guyana (11.62%), and Ethiopia (10.41%) all show freight-to-value ratios 2-3x higher than large-volume markets like Nigeria (4.07%) — pointing to a lack of shipment consolidation or harder logistics access in lower-volume destinations.

**3. Vendor pricing for the same product category varies more than 10x.**
Within the ARV product group, Strides Arcolab averaged $0.07/unit vs. Merck Sharp & Dohme at $0.80/unit — a meaningful cost-saving opportunity if volume were shifted toward lower-cost, reliable suppliers like Strides, Aurobindo, or Cipla. The box plot further shows Merck Sharp & Dohme's pricing is also highly variable order to order, while Strides is both cheap and consistent.

**4. The most expensive shipment mode is also the most reliable.**
Every mode except Ocean delivers early on average. Air Charter — the priciest mode — is also the most consistently early (avg. 19 days ahead of schedule), suggesting its cost premium is justified. Ocean is the only mode that runs late on average (+5.9 days) despite costing more than Truck — a real inefficiency.

**5. Congo, DRC is a dual-risk destination.**
It combines a high freight-to-value ratio (12.11%) with the worst average delivery delay of any country with a reliable sample size (+11.2 days late across 333 shipments). Notably, other high-freight countries (Cameroon, Guyana, Ethiopia) do *not* show the same lateness — their extra cost appears to buy reliability, similar to the Air Charter pattern. This makes Congo, DRC a standout case rather than part of a broader trend, and it's visibly flagged red on the dashboard map.

## Analytical Approach

1. **Data cleaning** — reviewed all ~33 fields, handled encoding, identified and documented data quality issues (see Limitations)
2. **Delay calculation** — engineered a `Delivery Delay (Days)` field: `Delivered to Client Date − Scheduled Delivery Date` (positive = late, negative = early)
3. **Five pivot table analyses** in Excel covering shipment mode cost, country-level freight efficiency, vendor pricing, and delivery delay by mode and by country
4. **Outlier handling** — used volume-based filters (minimum shipment count or minimum order value) to exclude small-sample countries and vendors from headline findings, rather than treating every raw percentage as equally reliable
5. **Interactive Tableau dashboard** rebuilding four of the five findings as a bar chart, a diverging bar chart, a map, and a box plot — chosen for variety and to match each chart type to the specific question it needed to answer

## Tools & Technologies

Excel (PivotTables, calculated fields) · Tableau Public (interactive dashboard, calculated fields, geographic mapping)

## Dashboard Design

Each visual was chosen for a specific reason rather than defaulting to bar charts throughout:
- The **diverging bar chart** was used for delivery delay because the data has a natural zero baseline (scheduled date) — this chart type shows deviation above/below that baseline more clearly than a standard bar chart would.
- The **map** was used for country-level delay because geographic clustering (e.g., Central Africa) is easier to spot visually than in a sorted list, and dot size encodes shipment volume as a secondary signal of reliability.
- The **box plot** replaced an earlier bar-chart version of the vendor pricing view specifically to show price *variance*, not just average — a bar chart alone would have hidden the fact that Merck Sharp & Dohme's high average price also comes with high inconsistency.
- Color was used consistently across charts (red = late/expensive, green = early/cheap) so the dashboard reads the same way throughout, without needing to re-learn each chart's logic.

## Business Value

This analysis gives a supply chain team a starting checklist rather than just a data summary:
- A specific country (Congo, DRC) to prioritize for a logistics review
- A specific shipment mode (Ocean) to investigate for underperformance
- A specific, quantified vendor-consolidation opportunity (ARV product group)
- Evidence that current Air Charter spend is justified, so it isn't cut based on cost alone without accounting for the reliability trade-off

## Limitations

- 360 shipments (~3.5%) have no recorded shipment mode and were excluded from mode-specific analysis, though retained for other analyses.
- A number of countries show $0 freight cost despite real order value, likely reflecting uncaptured cost data (e.g., vendor-absorbed freight) rather than genuinely free shipping — freight-ratio conclusions for these specific countries should be treated with caution.
- Delay analysis uses averages, which can be sensitive to outliers; a median cross-check is recommended before treating any single figure as definitive.
- "Product Group" is a broad category — some vendor price variance may reflect different specific formulations rather than pure price differences for an identical product.
- Some country-level delay figures are based on very small sample sizes (fewer than 20 shipments) and were excluded from headline findings for reliability.
- Three extreme outlier orders (>$2/unit) were excluded from the vendor box plot view to keep the scale readable; they remain in the underlying dataset.

## Future Analysis

- Build a simple predictive model (e.g., logistic regression) to estimate late-delivery risk based on shipment mode, country, and order size
- Layer in time trends — is Congo, DRC's delay pattern consistent year-round, or concentrated in specific periods?
- Extend the vendor pricing comparison beyond the ARV group to other product categories
- Add a cost-to-serve view combining freight, delay risk, and vendor pricing into a single per-country or per-vendor risk score

## Skills Demonstrated

- Data cleaning and data quality investigation (encoding issues, missing values, non-numeric entries in numeric fields)
- Pivot table analysis and calculated field design in Excel
- Statistical judgment: distinguishing genuine findings from small-sample noise, using averages vs. distributions appropriately
- Interactive dashboard design in Tableau (geographic mapping, diverging bar charts, box plots, calculated fields, filters)
- Deliberate chart-type selection based on the analytical question, not default formatting
- Translating raw data findings into specific, actionable business recommendations

## Conclusion

This project shows that the biggest costs in a supply chain aren't always the biggest problems — Air Charter is expensive but earns its cost through reliability, while Ocean freight costs more than Truck without delivering the same value. The clearest opportunity for improvement is concentrated, not spread evenly: one destination (Congo, DRC), one shipment mode (Ocean), and one product group's vendor mix (ARV) account for the most actionable findings in the dataset. That kind of targeted prioritization — not just reporting numbers, but pointing to where action should start — is the goal of this analysis.

## 👤 Author

**Nana Konadu Ababio**
Graduate student building a data analytics portfolio.

---

🔗 **[View the live interactive dashboard on Tableau Public](https://public.tableau.com/views/NanaAbabio/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**
