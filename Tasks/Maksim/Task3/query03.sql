--Query  3
SELECT SP.BusinessEntityID,
       person.FirstName,
       person.LastName
FROM Sales.SalesPerson SP
INNER JOIN Person.Person person
        ON SP.BusinessEntityID = person.BusinessEntityID
WHERE EXISTS
            (SELECT *
             FROM Sales.SalesOrderHeader SOH
             WHERE SOH.SalesPersonID = SP.BusinessEntityID
                   AND
                   SOH.OrderDate >= CONVERT(DATETIME, '20110801', 101)
                   AND
                   SOH.SalesPersonID = SP.BusinessEntityID)
;
