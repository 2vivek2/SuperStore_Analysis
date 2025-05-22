# 🛒 Superstore Sales Data Analysis

Empowering business decisions through data-driven insights from a global retail dataset

## 📘 Project Summary

A complete end-to-end BI project analyzing 4 years of sales data from a global superstore. This project involved data cleaning, warehousing, KPI analysis, and dynamic dashboarding in Power BI to uncover insights that optimize profit, inventory, and customer engagement.

## 🧰 Tools & Technologies


MySQL

Data storage, cleaning, and transformation

VS Code

Manual data cleaning and character replacement

Power BI

Visual reporting and KPI dashboarding

DAX & SQL

Data modeling and calculation logic

## 🧹 Data Cleaning & Transformation

- Replaced invalid encoding (e.g., \xa0) in the Product Name column using VS Code.

- Removed NULLs, blanks, and standardized data types.

- Used STR_TO_DATE() in MySQL to convert string dates into DATE format.

- Modeled the data into a star schema for performance-friendly reporting.

## 🗄️ Data Warehouse Design

- Structured using a star schema:

- Fact Table: Sales metrics (quantity, discount, profit, shipping time)

- Dimensions: Products, Categories, Customers, Regions, Dates

## 📊 Key KPIs & Metrics

## 💰 Sales Metrics

- Total Sales: $2.26M

- Total Orders: 9,800

- Avg Orders per Period: 231

- Avg Shipping Time: 4 Days

## 👤 Customer Metrics

- Repeat Orders: 66.57%

- Unique Customers: 33.43%

## 🧭 Segment Contribution

- Consumer: 50.76%

- Corporate: 30.44%

- Home Office: 18.79%

## 🔍 Business Insights

## 🏆 Top Sub-Categories by Sales

Chairs ($327.78K), Phones, Storage, Tables, Binders

## 🛑 Underperformers

Fasteners, Labels, Supplies → Recommend bundling or discount strategy

## 🗺️ Top 5 States

California, New York, Texas, Washington, Pennsylvania

## ⚠️ Bottom 5 States

North Dakota, West Virginia, Maine, South Dakota, Wyoming (< $1.6K)

## 📈 Sales Trends

- Highest YoY Growth (2017–18)

- Office Supplies: +137%

- Furniture: +132%

- Technology: +121%

## 🌍 Geographical & Segment Analysis

- Heatmaps revealed strong performance in West and Northeast

- Southeast regions showing emerging opportunity zones

- Consumer segment dominates, suggesting targeted campaigns could boost ROI

# 🚀 Strategic Recommendations

✅ Expand in high-growth states (e.g., California, New York)

✅ Launch localized promotions in low-performing regions

✅ Focus on top-selling categories for bundled offers

✅ Use consumer segment for loyalty programs and remarketing

✅ Streamline inventory around low-demand products

## 📂 Project Structure

superstore-sales-analysis/
├── SQL-Scripts/               → SQL queries for data prep and analysis
├── PowerBI-Dashboard/        → PBIX dashboard files
├── Reports/                  → Final report & presentations
├── Dataset/                  → Raw + cleaned data files (CSV)
└── README.md                 → Documentation & project guide

## 🌐 Deployment

- Dashboards published to Power BI Service

- Data refresh simulated using SQL queries; can be extended with Power BI Gateway

## 🙋 About the Author

## Vivek Kumar
🔍 Data Analyst | 📊 BI Developer📧 
hellovivek2002@gmail.com🔗 https://www.linkedin.com/in/2vivek2/ 



"Data is the new oil—but only if refined into insight."


