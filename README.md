# 🏡 Sydney First-Home Buyer Affordability Dashboard

This project explores the harsh reality of the property market for first-home buyers in Greater Sydney (2016-2021). By combining historical property sales data with regional income data, this analysis calculates the true **"Affordability Ratio"** (years of median income required to purchase a property).

## 📂 Project Structure

* 📄 `Data_Cleaning.sql` → SQL scripts used to clean raw data, handle missing values, and join regional income data with property sales.
* 📊 `Sydney_Affordability_Dashboard.pbix` → The interactive Power BI dashboard containing the final UI, DAX measures, and data model.
* 📁 `Raw_Data/` → CSV files containing ABS regional median income and raw property transactions.

## 🧩 Data Preparation in SQL

To prepare the final analysis-ready dataset, I used SQL to combine raw property transactions with two supporting tables:

- a custom **Sydney region mapping** table
- suburb-level **ABS weekly household income** data

This allowed me to enrich each property transaction with location grouping and affordability context before loading the data into Power BI.

### 1️⃣ Select the core transaction fields

First, I selected the raw property-level fields needed for analysis, including date, suburb, property type, price, CBD distance, and property attributes.

```sql
SELECT
    d.date_sold,
    d.suburb AS suburb,
    d.type AS property_type,
    d.price AS price,
    d.km_from_cbd AS km_from_cbd,
    d.num_bed,
    d.num_bath,
    d.num_parking,
    d.property_size
FROM domain_properties d

### 2️⃣ Add custom Sydney region mapping

Next, I joined the raw property data with a custom regions.csv table to group selected suburbs into broader Sydney regions such as Inner West, North Shore, and South / St George.

```sql
JOIN regions r
    ON TRIM(LOWER(d.suburb)) = TRIM(LOWER(r.suburb))

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
