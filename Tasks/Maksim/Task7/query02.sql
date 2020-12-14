--Query 2
INSERT INTO tempdb.dbo.Customers
SELECT DISTINCT
       Customer.CustomerID,
       Customer.PersonID,
       Person.FirstName,
       Person.LastName,
       S.Name,
       ST.CountryRegionCode
FROM AdventureWorks2019.Sales.Customer
INNER JOIN AdventureWorks2019.Sales.SalesOrderHeader SOH
        ON Customer.CustomerID = SOH.CustomerID
INNER JOIN AdventureWorks2019.Person.Person person
        ON Customer.PersonID = person.BusinessEntityID
INNER JOIN AdventureWorks2019.Sales.Store S
        ON S.BusinessEntityID = Customer.StoreID
INNER JOIN AdventureWorks2019.Sales.SalesTerritory ST
        ON Customer.TerritoryID = ST.TerritoryID
;
