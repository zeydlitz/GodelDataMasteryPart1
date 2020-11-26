--Query 10
SELECT SalesOrderID,
		OrderDate,
		CASE DATEPART(weekday,OrderDate)
            WHEN 6 THEN 'Saturday'
            WHEN 7 THEN 'Sunday'
            ELSE 'None'
        END as Day
FROM Sales.SalesOrderHeader
WHERE 
    YEAR(OrderDate) = 2011
    AND
    MONTH(OrderDate) = 8
    AND
    (DATEPART(weekday,OrderDate) = 6
    OR
    DATEPART(weekday,OrderDate) = 7);
;
