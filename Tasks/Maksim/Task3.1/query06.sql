--Query  6
SELECT TOP (10)
       SOD.SalesOrderID,
       SOD.LineTotal TotalPrice
FROM Sales.SalesOrderDetail SOD
WHERE EXISTS(
        SELECT *
        FROM Sales.SalesOrderHeader SOH
        WHERE SOH.SalesOrderID = SOD.SalesOrderID
              AND
              YEAR(SOH.OrderDate) = 2011)
ORDER BY TotalPrice DESC
;
