--Query  4
WITH tab_all
as(
	SELECT DISTINCT
		   PC.Name,
		   SUM(SOD.LineTotal) CategoryTotal
	FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD
			ON SOH.SalesOrderID = SOD.SalesOrderID
	INNER JOIN Production.Product product
			ON  SOD.ProductID = product.ProductID
	INNER JOIN Production.ProductSubcategory PS
			On product.ProductSubcategoryID = PS.ProductSubcategoryID
	INNER JOIN Production.ProductCategory PC
			ON PS.ProductCategoryID = PC.ProductCategoryID
	GROUP BY   PC.Name
	),
tab_year as(
		SELECT DISTINCT
		   PC.Name,
		   SUM(SOD.LineTotal) OverYear,
		   YEAR(SOH.OrderDate) YEAR
	FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD
			ON SOH.SalesOrderID = SOD.SalesOrderID
	INNER JOIN Production.Product product
			ON  SOD.ProductID = product.ProductID
	INNER JOIN Production.ProductSubcategory PS
			On product.ProductSubcategoryID = PS.ProductSubcategoryID
	INNER JOIN Production.ProductCategory PC
			ON PS.ProductCategoryID = PC.ProductCategoryID
	GROUP BY   PC.Name, YEAR(SOH.OrderDate))
SELECT tab_all.Name,
	   tab_all.CategoryTotal,
	   tab_year.OverYear,
	   (tab_year.OverYear * 100) / tab_all.CategoryTotal  AS CategoryPercentage
FROM tab_all
INNER JOIN tab_year
		ON tab_all.Name = tab_year.Name
WHERE tab_year.YEAR = 2014
ORDER BY CategoryPercentage DESC
;
