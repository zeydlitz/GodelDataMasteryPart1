--Query 5
WITH tab
AS (
    SELECT DISTINCT
           YEAR(OrderDate) Year,
           COUNT(CustomerID) Count
    FROM Sales.SalesOrderHeader
    GROUP BY YEAR(OrderDate))
SELECT *
FROM tab
;
