Monday-Coffee-Sales-Analysis_
Data analysis project to detect top cities for coffee shop growth based on sales, customer data, and product demand.
Monday Coffee Sales Analysis

This project probes sales, customer, and product data for “Monday Coffee”, an online coffee retailer operational since January 2023. The goal is to present actionable recommendations for expanding physical coffee shop locations in India based on consumer demand and sales performance.

 Project Objectives

- Analyze historical online sales data
- Identify top-performing cities in terms of revenue, transactions, and customer base
- Understand product demand across different regions
- Recommend the best cities to open new Monday Coffee shops

 Tools & Technologies

- SQL(MySQL Workbench) →Data querying & aggregation
- Jupyter Notebook / Google Colab → Data analysis
- Excel/CSV → Raw data storage
- GitHub → Project versioning & documentation

Project Structure

monday-coffee-sales-analysis/

├── data/
│ ├── customers.csv
│ ├── products.csv
│ └── sales.csv
│
├── notebooks/
│ └── coffee-analysis.ipynb
│
├── sql/
│ └── analysis_queries.sql
│
├── outputs/
│ ├── top_cities_report.csv
│ └── monthly_trends.png
│
└── README.md

Dataset Overview
1. Customers
- `customer_id`, `customer_name`, `city_id`
 2. Products
- `product_id`, `product_name`, `price`
3. Sales
- `sale_id`, `sale_date`, `product_id`, `customer_id`, `quantity`, `total_amount`, `rating`

Key Analysis Performed

Data Preparation
- Cleaned null and duplicate entries
- Validated totals: `price × quantity = total_amount`
- Joined tables (`sales`, `customers`, `products`) for integrated analysis

Activity 4: Data Analysis & Aggregation
- Total sales per city
- Total transactions per city
- Unique customers per city
- Average order value per city
- Product demand per city
- Monthly sales trend
- Average product rating per city

Recommendations
- Ranked cities based on total sales, unique customers, and transactions
- Identified top 3 cities with consistent demand and high customer satisfaction

Key Findings

Metric               | Insight |
City_ID 1       | Highest in total sales, orders, and customers |
City_ID 2        | Strong performance and high customer ratings |
City_ID 3        | Solid demand with room for further growth |
Monthly Sales   | Consistent upward trend since launch |
Product Deman   | High and stable for core coffee products |

Final Recommendations

1. Open new coffee shop locations in City_IDs 1, 2, and 3 top performers across all KPIs
2. Stock products based on local demand, especially Coffee Beans, Instant Coffee
3. Target cities with high customer ratings, ensures stronger brand loyalty
4. Avoid low-demand cities, focus investment where demand and satisfaction are proven
5. Use monthly trends to time launches when demand is rising

If a `cities` table is added, City_IDs can be mapped to actual city names. But in this dataset city_name is not included. 

How to Use This Project
You can:
- Run the SQL queries in `sql/analysis_queries.sql` to reproduce the insights
- Explore the analysis step-by-step in the Jupyter notebook (`notebooks/coffee-analysis.ipynb`)
- View reports and charts in the `outputs/` folder

Future Improvements

- Add city name mapping via a `cities.csv` file
- Automate data pipeline with Python scripts
- Build an interactive dashboard (e.g., Power BI or Tableau)

 Acknowledgements

Thanks to the team at **FutureConnect** for providing the dataset and real-world problem statement.

Connect

For questions or suggestions, feel free to reach out via GitHub Issues or connect on;
https://www.linkedin.com/in/zohra-jabeen-568774264?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app 

