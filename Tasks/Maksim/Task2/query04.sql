--Query  4
SELECT person.BusinessEntityID,
       person.LastName,
       person.FirstName
FROM Person.Person AS person
LEFT JOIN Person.BusinessEntityAddress as bea
       ON bea.BusinessEntityID = person.BusinessEntityID
LEFT JOIN Person.AddressType AD
        ON bea.AddressTypeID = AD.AddressTypeID
WHERE bea.BusinessEntityID IS NULL
      OR
      AD.Name != 'Home'
ORDER BY person.BusinessEntityID
;
