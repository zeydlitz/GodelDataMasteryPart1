--Query 7
WITH tab
AS (
    SELECT DISTINCT
           YEAR(OrderDate) Year,
           COUNT(CustomerID) Count
    FROM Sales.SalesOrderHeader
    GROUP BY YEAR(OrderDate))
SELECT tab.year,
       tab.count CurNumCust,
       CASE
           WHEN LAG(tab.count) OVER (ORDER BY tab.year) IS NULL THEN NULL
           ELSE LAG(tab.count) OVER (ORDER BY tab.year)
       END PrvNumCusts,
       CASE
           WHEN LAG(tab.count) OVER (ORDER BY tab.year) IS NULL THEN NULL
           ELSE tab.count - LAG(tab.count) OVER (ORDER BY tab.year)
       END growth
FROM tab
;
