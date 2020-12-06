--Query  6
SELECT DISTINCT
       SOH.CustomerID,
       product.Name as BikeName,
       SOH.OrderDate,
       SOH.OnlineOrderFlag
FROM Sales.SalesOrderHeader SOH
LEFT JOIN Sales.SalesOrderDetail SOD
       ON SOH.SalesOrderID = SOD.SalesOrderID
LEFT JOIN Production.Product as product
       ON SOD.ProductID = product.ProductID
LEFT JOIN Production.ProductSubcategory PD
       ON product.ProductSubcategoryID = PD.ProductSubcategoryID
WHERE SOH.OnlineOrderFlag = 1
  AND SOH.OrderDate = CONVERT(DATETIME, '20130101', 101)
  AND PD.ProductCategoryID = 1
ORDER BY 1
;
