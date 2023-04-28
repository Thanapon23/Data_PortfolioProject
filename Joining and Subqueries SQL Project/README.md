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
```

2. What is the most average sales product?
```
SELECT * , (Quantity * Unitsaleprice)[TotalSales] 
FROM (SELECT go_products.Product ,go_products.Productnumber , go_daily_sales.Quantity, go_daily_sales.Unitsaleprice
		FROM go_daily_sales 
		LEFT JOIN go_products 
		ON go_products.Productnumber = go_daily_sales.Productnumber)
GROUP BY Product
ORDER BY [TotalSales] DESC;
```

3. What is top 10 highest profit product? 
```
SELECT Productnumber, Product, Unitcost, Unitsaleprice, Quantity, cost, Sales, Sales-cost as Profit	
	FROM(SELECT * ,Unitcost*Quantity as cost ,  Unitsaleprice*Quantity as Sales 
		FROM go_products
		INNER JOIN go_daily_sales)
GROUP BY Product 
ORDER BY Profit DESC
LIMIT 10 ;
```

4. Which type of product has the highest sales volume?
```
SELECT Producttype , count(Producttype)[MostSalesProductType]  
FROM go_products
	INNER JOIN go_daily_sales USING (Productnumber)
	INNER JOIN go_1k USING (Productnumber)
GROUP BY Producttype
ORDER By [MostSalesProductType] DESC;
```

5. What brand has the highest sales?
```
SELECT Productbrand , count(Productbrand)[ProductBrandSales]  
FROM go_products
	INNER JOIN go_daily_sales USING (Productnumber)
	INNER JOIN go_1k USING (Productnumber)
GROUP BY Productbrand
ORDER By [ProductBrandSales] DESC;
```

6. Which retailer has the highest number of product orders?
```
SELECT Retailername, count(Retailername)[Product_order]
FROM go_retailers
	INNER JOIN go_daily_sales USING (Retailercode)
	INNER JOIN go_1k USING (Retailercode)
GROUP BY Retailername
ORDER BY [Product_order] DESC;
```

7. Which retailer has ordered the highest quantity of products?
```
SELECT Retailercode, Retailername, sum(go_daily_sales.Quantity) as TotalQuantity 
FROM go_retailers
	INNER JOIN go_daily_sales USING (Retailercode)
	INNER JOIN go_1k USING (Retailercode)
	INNER JOIN go_products USING (Productnumber)
GROUP BY Retailername
ORDER BY TotalQuantity DESC;
```


