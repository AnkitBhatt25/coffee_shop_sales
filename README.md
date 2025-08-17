# coffee_shop_sales

## Project Overview
This project presents a comprehensive "Coffee Shop Sales Analysis Dashboard" built in Power BI, supported by SQL queries for backend insights.  
The goal is to provide actionable business intelligence by analyzing sales, orders, and quantity trends across multiple dimensions (time, location, product category, and customer behavior).  

The dashboard enables stakeholders to:
- Track key KPIs (Sales, Orders, Quantity)
- Identify sales patterns and growth trends
- Compare performance across stores
- Make data-driven business decisions

---

## Problem Statement
The coffee shop chain needs a clear and interactive way to analyze sales performance across different stores, products, and time periods. The objective is to:  

1. Monitor total sales, orders, and quantity sold month-over-month.  
2. Analyze daily and hourly sales patterns.  
3. Understand customer behavior differences between weekdays and weekends.  
4. Identify top-performing products and categories.  
5. Compare performance across different store locations.  

---

##  Dataset Description
The dataset contains transaction-level sales records from multiple coffee shop locations.  
Key fields include:  

- `Transaction ID`  
- `Order Date` & `Order Time`  
- `Store Location`  
- `Product Category` & `Product Name`  
- `Quantity Sold`  
- `Total Sales Amount`  

(Data was cleaned and queried in "SQL", then loaded into "Power BI" for interactive reporting.)  

---

## 🛠️ Approach & Methodology
1. Data Preparation (SQL)  
   - Cleaned raw transaction data  
   - Aggregated metrics (sales, orders, quantities) at monthly, daily, and hourly levels  
   - Created queries to calculate MoM growth, top products, and trends  

2. Dashboard Development (Power BI) 
   - Imported processed dataset  
   - Created DAX measures for KPIs  
   - Designed interactive visuals mapped to business requirements  
   - Added slicers for month selection and store filtering 

---

##  KPI Requirements & Solutions

###  1. Total Sales Analysis
- Total sales per month  
- Month-on-month (MoM) % change in sales  
- Difference between selected vs. previous month  

###  2. Total Orders Analysis
- Total number of orders per month  
- MoM growth/decline in orders  
- Difference between months  

###  3. Total Quantity Sold Analysis
- Total quantity sold per month  
- MoM growth/decline in quantity  
- Difference between months  

---

##  Chart Requirements & Solutions

###  1. Calendar Heat Map
- Daily sales visualized with color intensity  
- Darker shades = higher sales  
- Tooltips for Sales, Orders, Quantity  

###  2. Sales by Weekdays vs. Weekends
- Segmented data into weekdays & weekends  
- Compared performance variations  

###  3. Sales by Store Location
- Store-wise sales comparison  
- MoM performance metrics  
- Identified top & low-performing stores  

###  4. Daily Sales with Average Line
- Daily sales line chart  
- Included average line for comparison  
- Highlighted exceptional high/low sales days  

###  5. Sales by Product Category
- Category-wise performance analysis  
- Identified categories contributing most to sales  

###  6. Top 10 Products by Sales
- Ranked top 10 products  
- Quick insight into best-selling items  

###  7. Sales by Days & Hours
- Heatmap for day-hour patterns  
- Peak sales hours identified  
- Tooltips for detailed metrics  

---

##  Key Insights
- Sales Growth: Clear MoM sales trend tracking  
- Store Performance: Some stores consistently outperform others  
- Customer Behavior: Higher sales on weekends and during morning/evening hours  
- Product Analysis: Beverages dominate sales; some food items also major contributors  
- Top Products: A few products account for a significant share of revenue  

---

##  Tech Stack
- Power BI – Dashboard development & visualization  
- SQL – Data cleaning & querying  
- Excel/CSV – Raw dataset format  

---

##  How to Use
1. Download the `.pbix` file from this repository  
2. Open in Power BI Desktop 
3. Use slicers (Month, Store) to explore interactive insights  
4. Hover over visuals for detailed tooltips  


