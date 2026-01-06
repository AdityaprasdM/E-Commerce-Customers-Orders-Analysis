# E-Commerce-Customers-Orders-Analysis
Built a self-initiated end-to-end E-Commerce analytics project using MySQL and Power BI.
📌 Project Overview

This is a self-initiated end-to-end data analytics project built to analyze e-commerce business data using MySQL and Power BI.

The project demonstrates the complete analytics workflow:

Database Design → SQL Analysis → CSV Export → Power BI Dashboard → Business Insights

The main goal is to understand:

Customer behavior

Order performance

Revenue trends

Product & category performance

Payment method usage

Customer value and retention

🎯 Business Objectives

Analyze customer acquisition and repeat behavior

Track order performance (delivered, cancelled, returned)

Measure revenue and key KPIs (AOV, CLV, Repeat Rate)

Identify top customers and top products

Understand payment method preferences

Build a professional, decision-ready dashboard

🗄️ Dataset & Data Model

The project uses a structured e-commerce database with the following tables:

customers – customer details

products – product catalog

orders – order transactions

order_items – order-product mapping

payments – payment details

Relationships:

customers → orders → payments

orders → order_items → products

🛠️ Tools & Technologies

MySQL – Database & SQL analysis

MySQL Workbench – Query execution & export

Power BI – Dashboard & visualization

CSV / Excel – Data exchange format

🔄 Project Workflow
Database Design → SQL Queries → Export to CSV → Power BI → Dashboard → Insights

📊 Analysis Performed (30+ Business Questions)
🧍 Customer Analysis

Total customers, new customers per month

Returning vs new customers

Customers with no orders

Average orders per customer

Top customers by number of orders

City-wise customer distribution

🧾 Order Analysis

Total orders and monthly trend

Order status distribution

Cancelled order percentage

Orders with many items

Average items per order

Orders without successful payment

💰 Revenue & Performance

Total revenue

Average Order Value (AOV)

Monthly revenue trend

Revenue by customer

Revenue from repeat vs new customers

📦 Product & Category Analysis

Top-selling products

Category-wise revenue

Unsold products

Highest revenue generating product

💳 Payment Analysis

Payment method usage

Average payment amount per method

Revenue contribution by payment method

⭐ Advanced Metrics

Customer Lifetime Value (CLV)

Top 5 high-value customers

Repeat purchase rate

📈 Power BI Dashboard

The Power BI dashboard contains multiple pages:

Executive Overview (KPIs)

Customer Analysis

Order Analysis

Revenue & Performance

Product & Category Analysis

Payment Analysis

Advanced Insights

Key KPIs:

Total Customers

Total Orders

Total Revenue

Average Order Value (AOV)

Customer Lifetime Value (CLV)

Repeat Purchase Rate

Cancelled Order Percentage

💡 Key Insights

A small group of repeat customers contributes a large portion of total revenue

Electronics category generates the highest revenue

UPI and Credit Card are the most preferred payment methods

Top 5 customers contribute a significant share of total revenue

Order cancellations have a noticeable impact on monthly performance

📁 Repository Structure
Ecommerce-Analytics/
│
├── sql/
│   ├── schema.sql
│   ├── data.sql
│   └── analysis_queries.sql
│
├── powerbi/
│   └── Ecommerce_Dashboard.pbix
│
├── exports/
│   └── csv_files/
│
└── README.md

▶️ How to Run This Project

Create a database in MySQL

Run schema.sql to create tables

Run data.sql to insert data

Run analysis_queries.sql to perform analysis

Export required query results as CSV

Open Ecommerce_Dashboard.pbix in Power BI and refresh data

⚠️ Limitations

Dataset is simulated (not real company data)

No profit or logistics cost included

Power BI is not connected live to MySQL

🚀 Future Improvements

Direct MySQL → Power BI connection

Profit and margin analysis

Customer segmentation (RFM)

Automated refresh

Larger dataset
