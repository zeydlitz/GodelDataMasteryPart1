--Query  7
SELECT DISTINCT customer.CustomerId,
                CASE 
                    WHEN person.MiddleName IS NULL THEN CONCAT(person.FirstName, ' ', person.LastName) 
                    ELSE CONCAT(person.FirstName, ' ', person.MiddleName, ' ', person.LastName) 
                END CustomerFullName,
                CASE
                    WHEN SOH.OrderDate IS NOT NULL THEN 'Yes'
                    ELSE 'No'
                END  'Has Orders in 2013'
FROM Sales.Customer AS customer
LEFT JOIN Sales.SalesOrderHeader SOH
       ON customer.CustomerID = SOH.CustomerID AND YEAR(SOH.OrderDate) = 2013
LEFT JOIN  Person.Person as person
       ON customer.PersonID = person.BusinessEntityID
WHERE person.FirstName = 'Zoe'
ORDER BY 1
;
