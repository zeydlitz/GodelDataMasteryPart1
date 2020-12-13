--Query 5
DELETE FROM od
FROM tempdb.dbo.Orders od
INNER JOIN AdventureWorks2019.Sales.SalesOrderHeader SOH
		ON SOH.SalesOrderID = od.orderid
INNER JOIN AdventureWorks2019.Sales.Customer customer
		ON customer.CustomerID = SOH.CustomerID
INNER JOIN tempdb.dbo.Customers c2
		ON customer.CustomerID = c2.CustomerID
WHERE c2.CountryRegionCode = 'FR'
;
