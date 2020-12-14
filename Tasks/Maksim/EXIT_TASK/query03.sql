--Query  3
SELECT DISTINCT
       PC.Name
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
        ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product product
        ON  SOD.ProductID = product.ProductID
INNER JOIN Production.ProductSubcategory PS
        On product.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory PC
        ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE SOH.OrderDate > CONVERT(DATETIME, '20140106', 101)
      AND
      SOH.OrderDate < CONVERT(DATETIME, '20141231', 101)
ORDER BY PC.Name
;
