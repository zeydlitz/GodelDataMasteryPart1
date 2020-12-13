--Query 7
ALTER TABLE tempdb.dbo.Orders
ADD TerritoryID  int NULL;
UPDATE  od
SET   od.TerritoryID = customer.TerritoryID
FROM tempdb.dbo.Orders od
INNER JOIN AdventureWorks2019.Sales.SalesOrderHeader SOH
		ON SOH.SalesOrderID = od.orderid
INNER JOIN AdventureWorks2019.Sales.Customer customer
		ON customer.CustomerID = SOH.CustomerID;
;
