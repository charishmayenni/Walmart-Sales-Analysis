CREATE DATABASE walmart_sales;
USE walmart_sales;
CREATE TABLE walmart (
    Store INT,
    Date DATE,
    Weekly_Sales DECIMAL(12,2),
    Holiday_Flag INT,
    Temperature DECIMAL(6,2),
    Fuel_Price DECIMAL(5,3),
    CPI DECIMAL(10,3),
    Unemployment DECIMAL(5,3)
);
SHOW TABLES;
SELECT * FROM walmart;
SELECT COUNT(*) AS Total_Records
FROM walmart;
SELECT COUNT(DISTINCT Store) AS Total_Stores
FROM walmart;
SELECT *
FROM walmart
LIMIT 10;
SELECT ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart;
SELECT ROUND(AVG(Weekly_Sales),2) AS Average_Weekly_Sales
FROM walmart;
SELECT MAX(Weekly_Sales) AS Highest_Weekly_Sales
FROM walmart;
SELECT MIN(Weekly_Sales) AS Highest_Weekly_Sales
FROM walmart;
SELECT COUNT(*) AS Holiday_Weeks
FROM walmart
WHERE Holiday_Flag = 1;
SELECT COUNT(*) AS Non_Holiday_Weeks
FROM walmart
WHERE Holiday_Flag = 0;
SELECT ROUND(SUM(Weekly_Sales),2) AS Holiday_Sales
FROM walmart
WHERE Holiday_Flag = 1;
SELECT ROUND(SUM(Weekly_Sales),2) AS Non_Holiday_Sales
FROM walmart
WHERE Holiday_Flag = 0;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales DESC;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales ASC
LIMIT 5;
SELECT Store,
       ROUND(AVG(Weekly_Sales),2) AS Average_Weekly_Sales
FROM walmart
GROUP BY Store
ORDER BY Average_Weekly_Sales DESC; 
SELECT Store,
       MAX(Weekly_Sales) AS Highest_Weekly_Sale
FROM walmart
GROUP BY Store
ORDER BY Highest_Weekly_Sale DESC;
SELECT Store,
       MIN(Weekly_Sales) AS Lowest_Weekly_Sale
FROM walmart
GROUP BY Store
ORDER BY Lowest_Weekly_Sale ASC;
SELECT Store,
       COUNT(*) AS Total_Weeks
FROM walmart
GROUP BY Store
ORDER BY Total_Weeks DESC;
SELECT Store,
       COUNT(*) AS Total_Weeks
FROM walmart
GROUP BY Store
ORDER BY Total_Weeks DESC;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Holiday_Sales
FROM walmart
WHERE Holiday_Flag = 1
GROUP BY Store
ORDER BY Holiday_Sales DESC;
SELECT Store,
       ROUND(AVG(Weekly_Sales),2) AS Average_Weekly_Sales
FROM walmart
GROUP BY Store
HAVING AVG(Weekly_Sales) > 1000000
ORDER BY Average_Weekly_Sales DESC;
SELECT Date
FROM walmart
LIMIT 5;
DESCRIBE walmart;
ALTER TABLE walmart
ADD COLUMN New_Date DATE;
UPDATE walmart
SET New_Date = STR_TO_DATE(Date, '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 0;
UPDATE walmart
SET New_Date = STR_TO_DATE(Date, '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;
SELECT Date, New_Date
FROM walmart
LIMIT 10;
SELECT YEAR(New_Date) AS Year,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY YEAR(New_Date)
ORDER BY Total_Sales DESC;
SELECT MONTH(New_Date) AS Month,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY MONTH(New_Date)
ORDER BY Total_Sales DESC;
SELECT MONTH(New_Date) AS Month,
       ROUND(AVG(Weekly_Sales),2) AS Average_Sales
FROM walmart
GROUP BY MONTH(New_Date)
ORDER BY Average_Sales DESC;
SELECT YEAR(New_Date) AS Year,
       COUNT(*) AS Total_Weeks
FROM walmart
GROUP BY YEAR(New_Date);
SELECT YEAR(New_Date) AS Year,
       MAX(Weekly_Sales) AS Highest_Sale
FROM walmart
GROUP BY YEAR(New_Date);
SELECT YEAR(New_Date) AS Year,
       MIN(Weekly_Sales) AS Lowest_Sale
FROM walmart
GROUP BY YEAR(New_Date);
SELECT YEAR(New_Date) AS Year,
       ROUND(AVG(Temperature),2) AS Average_Temperature
FROM walmart
GROUP BY YEAR(New_Date);
SELECT YEAR(New_Date) AS Year,
       ROUND(AVG(Fuel_Price),2) AS Average_Fuel_Price
FROM walmart
GROUP BY YEAR(New_Date);
SELECT YEAR(New_Date) AS Year,
       ROUND(AVG(Unemployment),2) AS Average_Unemployment
FROM walmart
GROUP BY YEAR(New_Date);
SELECT Holiday_Flag,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Holiday_Flag;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
       RANK() OVER(ORDER BY SUM(Weekly_Sales) DESC) AS Sales_Rank
FROM walmart
GROUP BY Store;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
       DENSE_RANK() OVER(ORDER BY SUM(Weekly_Sales) DESC) AS 'Dense_Rank'
FROM walmart
GROUP BY Store;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
       ROW_NUMBER() OVER(ORDER BY SUM(Weekly_Sales) DESC) AS Row_Num
FROM walmart
GROUP BY Store;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
       ROW_NUMBER() OVER(ORDER BY SUM(Weekly_Sales) DESC) AS Row_Num
FROM walmart
GROUP BY Store;
WITH StoreSales AS
(
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
)

SELECT *
FROM StoreSales
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT Store,
       ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart
GROUP BY Store
HAVING SUM(Weekly_Sales) >
(
SELECT AVG(Store_Total)
FROM
(
SELECT SUM(Weekly_Sales) AS Store_Total
FROM walmart
GROUP BY Store
) AS AvgTable
);
SELECT *
FROM walmart
ORDER BY Weekly_Sales DESC
LIMIT 1;
SELECT Holiday_Flag,
       ROUND(AVG(Weekly_Sales),2) AS Average_Sales
FROM walmart
GROUP BY Holiday_Flag;
SELECT Store,
       MAX(Weekly_Sales) AS Highest_Weekly_Sales
FROM walmart
GROUP BY Store
ORDER BY Highest_Weekly_Sales DESC;




 

 
