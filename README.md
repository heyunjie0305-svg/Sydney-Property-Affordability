# 🏡 Sydney First-Home Buyer Affordability — End-to-End Data Analysis

This project explores the harsh reality of the property market for first-home buyers in Greater Sydney (2016-2021). By combining historical property sales data with regional income data, this analysis calculates the true **"Affordability Ratio"** (years of median income required to purchase a property).

## 📂 Project Structure

* 📄 `Data_Cleaning.sql` → SQL scripts used to clean raw data, handle missing values, and join regional income data with property sales.
* 📊 `Sydney_Affordability_Dashboard.pbix` → The interactive Power BI dashboard containing the final UI, DAX measures, and data model.
* 📁 `Raw_Data/` → CSV files containing ABS regional median income and raw property transactions.

## 🧹 Data Cleaning & Preparation (SQL & Power Query)

To ensure high data quality and realistic insights, the following steps were taken:

1.  **Data Sourcing:** Proactively sourced regional median income data from the **ABS (Australian Bureau of Statistics)** to create a realistic affordability benchmark.
2.  **SQL Joins:** Merged property sales records with ABS income data using regional matching.
3.  **Outlier Removal:** Filtered out invalid transactions (e.g., $0 sales) and extreme luxury outliers that would skew the average pricing for "first-home buyers".
4.  **Feature Engineering:** Extracted `Year` from sale dates for time-series trend analysis.

## 📊 Dashboard Interactivity (Power BI)
* **Dynamic UI:** Designed a custom dark/light-mode UI.
* **Bookmarks & Buttons:** Implemented an interactive toggle switch allowing users to seamlessly switch between the **"Top 10 Most Affordable"** and **"Top 10 Least Affordable"** suburbs without losing context.
* **Cross-filtering:** Used scatter plots (Affordability vs Distance to CBD) to allow users to filter the entire dashboard by clicking on specific property clusters.

## 💡 Key Business Insights

* 📈 **The Extreme House Premium:** The overall affordability ratio for Houses sits at a staggering 19.41. The trendline shows a concerning upward spike starting in 2020.
* 🏢 **Apartments as the "Golden Ticket":** Shifting to Apartments/Units drops the affordability ratio by nearly half (to 10.34), proving it to be the most realistic entry point to the inner-city market.
* 🎯 **The Sweet Spots:** Areas like **Annandale** and **Marrickville** offer the ultimate balance—lower affordability ratios while keeping buyers well within a 10km radius of the CBD.

## 🛠️ Skills Demonstrated
* **Data Cleaning & Integration:** SQL (Joins, Aggregations, Filtering), Power Query.
* **Data Modeling:** DAX (Explicit measures for dynamic KPIs).
* **Data Visualization & UX:** Power BI, Dashboard Design, Bookmarks, Tooltips, Action Buttons.
* **Business Acumen:** Translating raw datasets into actionable affordability metrics.
