--Query 3
INSERT INTO tempdb.dbo.Orders
SELECT DISTINCT
       SOH.SalesOrderID,
       SOH.OrderDate,
       Employee.BusinessEntityID,
       Customer.CustomerID,
       SUM(SalesOrderDetail.OrderQty)
FROM AdventureWorks2019.Sales.SalesOrderHeader  SOH
INNER JOIN AdventureWorks2019.Sales.Customer
        ON SOH.CustomerID = Customer.CustomerID
INNER JOIN AdventureWorks2019.Sales.Store
        ON Customer.StoreID = Store.BusinessEntityID
INNER JOIN AdventureWorks2019.Sales.SalesPerson
        ON SOH.SalesPersonID = SalesPerson.BusinessEntityID
INNER JOIN AdventureWorks2019.HumanResources.Employee
        ON SalesPerson.BusinessEntityID = Employee.BusinessEntityID
INNER JOIN AdventureWorks2019.Sales.SalesOrderDetail
        On SOH.SalesOrderID = SalesOrderDetail.SalesOrderID
WHERE YEAR(OrderDate) = 2011 
      OR
      YEAR(OrderDate) = 2012
GROUP BY SOH.SalesOrderID, SOH.OrderDate ,Employee.BusinessEntityID, Customer.CustomerID
;
