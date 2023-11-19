# SQL-Marketing-Project

<b>SQL Analysis of Marketing Campaign Data</b>

<br><b>Description:</b><br>
This project demonstrates the use of SQL for insightful data analysis within a marketing context. By creating a marketing database and utilizing various SQL queries, the project delves into the analysis of a marketing campaign dataset, focusing on customer demographics, purchasing behavior, and campaign effectiveness.

<br><b>Key Features and SQL Commands:</b><br>

<br>1. Database Setup: Created a database named 'marketing' and a table 'marketing_campaign'.<br>
<br>CREATE DATABASE marketing; USE marketing;<br>

<br>2 .Data Exploration: Used SELECT and DESCRIBE statements for initial data exploration.<br>
<br>SELECT * FROM marketing_campaign; DESCRIBE marketing_campaign;<br>

<br>3. Income and Education Analysis: Analyzed average income by education level.<br>
<br>SELECT Education, ROUND(AVG(Income),0) AS Average_Income FROM marketing_campaign GROUP BY Education;<br>

<br>4. Campaign Performance by Education: Evaluated the effectiveness of marketing campaigns across different educational backgrounds.<br>
<br>SELECT Education, SUM(AcceptedCmp1) AS Campaign_1 FROM marketing_campaign GROUP BY Education;<br>

<br>5. Purchasing Behavior by Marital Status: Investigated customer purchasing patterns across marital statuses.<br>
<br>SELECT Marital_Status, SUM(NumCatalogPurchases), SUM(NumStorePurchases) FROM marketing_campaign GROUP BY Marital_Status;<br>

<br>6. Age Analysis: Added and calculated a new 'Age' column, then analyzed purchasing behavior by age.<br>
<br>ALTER TABLE marketing_campaign ADD COLUMN Age INT; UPDATE marketing_campaign SET Age = YEAR(NOW()) - Year_Birth;<br>

<br>7. Customer Engagement Duration: Calculated the duration of customer engagement with the company.<br>
<br>SELECT (YEAR(Dt_Customer) - Year_Birth) AS Customers_in_years FROM marketing_campaign;<br>

<br>8. Multi-Channel Purchase Analysis: Examined purchases made through different channels.<br>
<br>SELECT AVG(NumDealsPurchases), AVG(NumWebPurchases) FROM marketing_campaign;<br>

<br>9. Web Activity Analysis: Analyzed the frequency of web visits in the last month.<br>
<br>SELECT AVG(NumWebVisitsMonth) FROM marketing_campaign;<br>

<br>Technologies Used: SQL.<br>

<b>Project Outcome:</b><br> The project yielded valuable insights into customer profiles, purchasing trends, and campaign performances, aiding in informed marketing decisions.<br>

