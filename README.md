# Walmart Data Analytics Project

This project provides a full-stack data analytics solution for analyzing Walmart's retail data, including ETL scripts, database creation, analytical SQL, and a Power BI dashboard.

##  Project Structure

Walmart-Data-Analytics-master/
│
├── Analytical_Dashboard.pbix # Power BI dashboard file
├── DB Analytical SQL.pdf # PDF explaining SQL analysis
├── DB_Creation.sql # SQL script to create initial database schema
├── db.sql # Database population SQL script
├── dwh.sql # Data warehouse schema script
├── mart_dwh_q.sql # Data mart and analytics queries
├── anQueryPj.sql # Additional analytical SQL queries
│
├── el.py # ETL logic in Python
├── env_variables.py # Environment variables for project setup
├── t.py # Testing or transformation script
├── test.ipynb # Jupyter Notebook with analysis or tests
├── req.txt # Python requirements
│
├── Documentation.docx # Project documentation
└── .gitignore # Git ignored files

##  Features

- Creation of normalized and dimensional schemas using SQL.
- ETL pipeline using Python to load and process data.
- Power BI dashboard for interactive insights.
- Analytical SQL queries for KPI generation and insights.

##  Dashboard

Open the `Analytical_Dashboard.pbix` in Microsoft Power BI to explore sales trends, top-performing products, regional metrics, and more.

##  Requirements

Install dependencies using:

```bash
pip install -r req.txt

🏁 How to Run
Create the database schema using DB_Creation.sql.

Populate the database using db.sql.

Set up the DWH schema using dwh.sql.

Run ETL scripts using Python files.

Open the Power BI file to interact with the dashboard.
