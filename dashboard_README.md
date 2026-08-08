# Interactive Dashboard — Supply Chain Delivery & Cost Analysis

## Project Overview

This is the interactive companion to the Excel-based Supply Chain Delivery & Cost Analysis in this repo. Built in Tableau Public from the same cleaned dataset (10,324 shipments from a humanitarian health supply chain program), it turns four of the five core findings into visuals someone can explore directly — hovering, comparing, and zooming — rather than reading static numbers.

See the [main README](../README.md) for the full write-up, methodology, and all five findings.

## Business Objective

The dashboard exists to make the analysis's core question — *where is this supply chain losing money and time, and is the extra cost anywhere actually buying reliability?* — explorable in under a minute, without needing to open Excel or read pivot tables.

## Dashboard Components

1. **Freight Cost by Shipment Mode** (bar chart) — average freight cost per shipment across Air, Air Charter, Ocean, and Truck
2. **Delivery Delay by Shipment Mode** (diverging bar chart) — average days early/late per mode, colored red (late) / green (early), with a reference line at zero ("On Time")
3. **Delivery Delay by Country** (map) — every country sized by shipment volume and colored by average delay; Congo, DRC is visible immediately as the one red marker in Central Africa
4. **Vendor Price Distribution — ARV Product Group** (box plot) — full price spread per vendor (median, quartiles, outliers), not just the average

## Key Insights

- Air Charter costs roughly 2x more than Truck on average, but is also the most reliably early shipment mode — its cost premium appears justified
- Ocean is the only shipment mode that runs late on average, despite costing more than Truck
- Congo, DRC is the one country that is both expensive to serve and consistently late — visible as a single red dot on the map, distinct from other high-cost countries that are not also late
- Merck Sharp & Dohme has both the highest median unit price and the widest price variance within the ARV product group, while Strides Arcolab is both cheap and consistent

## Analytical Approach

- Built from the same cleaned raw dataset as the Excel analysis (not the pivot tables) — using a calculated field `Freight % of Value` and an engineered `Delivery Delay (Days)` field
- Small-sample countries and vendors were filtered out (minimum order value or minimum shipment count) before drawing conclusions, matching the same outlier-handling approach used in the Excel analysis
- Chart type was chosen deliberately per question rather than defaulting to bar charts throughout (see Dashboard Design below)

## Tools & Technologies

Tableau Public — calculated fields, geographic mapping, diverging color palettes, box plots, volume-based filters

## Dashboard Design

- **Diverging bar chart** for delivery delay, because the data has a natural zero baseline (scheduled date) — this shows deviation above/below that baseline more clearly than a standard bar chart
- **Map** for country-level delay, because geographic clustering is easier to spot visually than in a sorted list; dot size encodes shipment volume as a secondary reliability signal
- **Box plot** for vendor pricing instead of a bar chart, specifically to show price *variance*, not just average — a bar chart alone would have hidden that Merck Sharp & Dohme's high average price also comes with high inconsistency
- Consistent red/green coloring across every chart (red = late/expensive, green = early/cheap) so the dashboard reads the same way throughout

## Business Value

Gives a viewer — recruiter or supply chain stakeholder alike — an at-a-glance starting point: one country to investigate (Congo, DRC), one shipment mode to review (Ocean), and one vendor-consolidation opportunity (ARV group), without needing to read a report first.

## Limitations

- The dashboard shows 4 of the 5 findings from the full analysis; Country Freight Efficiency (the 5th) is covered in the Excel pivot tables and main README, left out here to keep the visual set varied rather than repeating chart types
- Three extreme outlier orders (>$2/unit) were excluded from the box plot view to keep the scale readable; they remain in the underlying dataset
- Delay figures shown are averages; see the main README for the median-based caveat

## Future Analysis

- Add the Country Freight Efficiency view as a 5th dashboard tab
- Add interactive filters (e.g., a shipment-mode or country selector) so a viewer can cross-filter across all four charts at once
- Add a text annotation directly on the map flagging Congo, DRC by name

## Skills Demonstrated

- Interactive dashboard design in Tableau (geographic mapping, diverging bar charts, box plots, calculated fields, filters)
- Deliberate chart-type selection based on the analytical question, not default formatting
- Outlier and small-sample handling to keep visualizations honest rather than misleading

## Conclusion

This dashboard turns a five-finding Excel analysis into something explorable in under a minute — built to let a viewer find the same "where should we look first" answers the full report reaches, just by hovering over a chart.

## 👤 Author

**Nana Konadu Ababio**
Graduate student building a data analytics portfolio.

---

🔗 **[Open the live dashboard](https://public.tableau.com/views/NanaAbabio/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**
