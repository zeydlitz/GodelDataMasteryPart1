--Query 5
DELETE FROM od
FROM tempdb.dbo.Orders od
INNER JOIN tempdb.dbo.Customers cu
        ON od.custid = cu.CustomerID
WHERE cu.CountryRegionCode = 'FR'
;
