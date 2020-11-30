--Query 5
SELECT emp.BusinessEntityID,
       person.LastName,
       CASE 
           WHEN phone.PhoneNumberTypeID != 1  THEN NULL
           ELSE phone.PhoneNumber
           END as PhoneNumber
From Person.Person AS person
         JOIN HumanResources.Employee AS emp
            ON person.BusinessEntityID = emp.BusinessEntityID
         JOIN Person.PersonPhone phone
            ON emp.BusinessEntityID = phone.BusinessEntityID
ORDER BY emp.BusinessEntityID
;
