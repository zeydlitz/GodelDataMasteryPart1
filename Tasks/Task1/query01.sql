--Query 1
SELECT SalesOrderID,
       OrderDate,
       CustomerID,
       SalesPersonID
FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate)=5 and YEAR(OrderDate)=2011;
;
