# Joining and Subquery Project

The Project Containing SQL CODE that using  SQL Joining table and Subquery for answering the business question,

1. What is the best selling product?
```
SELECT * , (Quantity * Unitsaleprice)[TotalSales]
FROM (SELECT go_products.Product ,go_products.Productnumber , go_daily_sales.Quantity, go_daily_sales.Unitsaleprice
	FROM go_daily_sales 
	LEFT JOIN go_products 
	ON go_products.Productnumber = go_daily_sales.Productnumber)
	ORDER BY [TotalSales] DESC;
;
```
2. What is the most average sales product?
3. What is top 10 highest profit product? 
4. Which type of product has the highest sales volume?
5. What brand has the highest sales?
6. Which retailer has the highest number of product orders?
7. Which retailer has ordered the highest quantity of products?




