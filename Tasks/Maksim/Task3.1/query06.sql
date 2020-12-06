--Query  6
SELECT TOP (10)
       SOD.SalesOrderID,
       SOD.UnitPrice TotalPrice
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
        ON SOD.SalesOrderID = SOH.SalesOrderID
WHERE YEAR(SOH.OrderDate) = 2011
ORDER BY SOD.UnitPrice DESC
;
