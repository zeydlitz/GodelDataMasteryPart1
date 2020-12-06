--Query  8
SELECT customer.CustomerID,
       CONCAT(person.FirstName, ' ', person.MiddleName, ' ', person.LastName) AS CustomerFullName,
       product.Name AS ProductName
FROM Person.Person AS person
LEFT JOIN Person.BusinessEntityAddress bea
       ON bea.BusinessEntityID = person.BusinessEntityID
LEFT JOIN Person.Address address
       ON bea.AddressID = address.AddressID
LEFT JOIN Person.StateProvince SP
       ON address.StateProvinceID = SP.StateProvinceID
LEFT JOIN Person.CountryRegion CR
       ON CR.CountryRegionCode = SP.CountryRegionCode
LEFT JOIN Sales.Customer AS customer
       ON customer.PersonID = person.BusinessEntityID
LEFT JOIN Sales.SalesOrderHeader SOH
       ON SOH.CustomerID = customer.CustomerID
LEFT JOIN Sales.SalesOrderDetail SOD
       ON SOD.SalesOrderID =SOH.SalesOrderID
LEFT JOIN Production.Product AS product
       ON product.ProductID = SOD.ProductID
WHERE CR.Name = 'France'
    AND person.MiddleName = 'R'

ORDER BY 1,3
;
