--Query  5
SELECT DISTINCT
       PC.Name,
	   AVG(SOD.LineTotal) OVER( PARTITION BY PC.Name) AveragePrice,
	   COUNT(SOD.LineTotal) OVER( PARTITION BY PC.Name) ProductsCount
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
        ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product product
        ON  SOD.ProductID = product.ProductID
INNER JOIN Production.ProductSubcategory PS
        On product.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory PC
        ON PS.ProductCategoryID = PC.ProductCategoryID
ORDER BY AveragePrice DESC
;
